//
//  OpenNamesSearchService.swift
//  Search
//
//  Created by Dave Hardiman on 11/04/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import OSTransformation
import Foundation
import Fetch

public class OpenNamesSearchService: BoundingBoxSearchable {
    let apiKey: String

    /**
     Constructor

     - parameter apiKey: The OS Places API key to use with the service
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    private func urlForPath(path: String, items: [NSURLQueryItem]) -> NSURL {
        let components = NSURLComponents()
        components.scheme = "https"
        components.host = "api.ordnancesurvey.co.uk"
        components.path = "/opennames/v1/\(path)"
        let queryItems = [
            NSURLQueryItem(name: "key", value: apiKey)
            ] + items
        components.queryItems = queryItems
        return components.URL!
    }

    private func findUrlForQuery(query: String, boundingBox: OSGridRect? = nil) -> NSURL {
        var items = [NSURLQueryItem(name: "query", value: query)]
        if let bbox = boundingBox,
            minX = NumberFormatter.stringFromNumber(bbox.originSW.easting),
            minY = NumberFormatter.stringFromNumber(bbox.originSW.northing),
            maxX = NumberFormatter.stringFromNumber(bbox.originSW.easting + bbox.size.width),
            maxY = NumberFormatter.stringFromNumber(bbox.originSW.northing + bbox.size.height) {
            items += [NSURLQueryItem(name: "bounds", value: "\(minX),\(minY),\(maxX),\(maxY)")]
        }
        return urlForPath("find", items: items)
    }

    public func find(query: String, completion: (Result<OpenNamesResponse> -> Void)) {
        let request = Request(url: findUrlForQuery(query))
        get(request) { (result) in
            completion(result)
        }
    }

    public func find(query: String, boundingBox: OSGridRect, completion: (Result<OpenNamesResponse> -> Void)) {
        let request = Request(url: findUrlForQuery(query, boundingBox: boundingBox))
        get(request) { (result) in
            completion(result)
        }
    }

    public func nearest(location: OSGridPoint, completion: (Result<OpenNamesResponse> -> Void)) {
        guard let easting = NumberFormatter.stringFromNumber(location.easting),
            northing = NumberFormatter.stringFromNumber(location.northing) else {
                fatalError("Couldn't convert grid point to string")
        }
        let request = Request(url: urlForPath("nearest", items: [NSURLQueryItem(name: "point", value: "\(easting),\(northing)")]))
        get(request) { result in
            completion(result)
        }
    }
}
