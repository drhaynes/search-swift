//
//  SearchService.swift
//  Search
//
//  Created by David Haynes on 10/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import OSTransformation

/// Service for consuming the OS Places API
public class PlacesSearchService: Searchable {
    let apiKey: String

    let numberFormatter: NSNumberFormatter

    /**
     Constructor

     - parameter apiKey: The OS Places API key to use with the service
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
        numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .NoStyle
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
    }

    /**
     Find using the free text specificed.
     Documentation can be found at: https://apidocs.os.uk/docs/os-places-find

     - parameter query:      The query text to find
     - parameter completion: Completion closure to execute
     */
    public func find(query: String, completion: (Result<SearchResponse> -> Void)) {
        let request = Request(url: urlForQuery(query))
        get(request) { (result) in
            completion(result)
        }
    }

    public func nearest(location: OSGridPoint, completion: (Result<SearchResponse> -> Void)) {
        guard let easting = numberFormatter.stringFromNumber(location.easting),
            northing = numberFormatter.stringFromNumber(location.northing) else {
                fatalError("Couldn't convert grid point to string")
        }
        let request = Request(url: urlForPath("nearest", items: [NSURLQueryItem(name: "point", value: "\(easting),\(northing)")]))
        get(request) { result in
            completion(result)
        }
    }

    private func urlForPath(path: String, items: [NSURLQueryItem]) -> NSURL {
        let components = NSURLComponents()
        components.scheme = "https"
        components.host = "api.ordnancesurvey.co.uk"
        components.path = "/places/v1/addresses/\(path)"
        let queryItems = [
            NSURLQueryItem(name: "key", value: apiKey)
        ] + items
        components.queryItems = queryItems
        return components.URL!
    }

    private func urlForQuery(query: String) -> NSURL {
        return urlForPath("find", items: [NSURLQueryItem(name: "query", value: query)])
    }
}
