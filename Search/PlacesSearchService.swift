//
//  SearchService.swift
//  Search
//
//  Created by David Haynes on 10/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch

/// Service for consuming the OS Places API
public class PlacesSearchService: Searchable {
    let apiKey: String

    /**
     Constructor

     - parameter apiKey: The OS Places API key to use with the service
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    /**
     Find using the free text specificed.
     Documentation can be found at: https://apidocs.os.uk/docs/os-places-find

     - parameter query:      The query text to find
     - parameter completion: Completion closure to execute
     */
    public func find(query: String, completion: (Result<Response> -> Void)) {
        let request = Request(url: urlForQuery(query))
        get(request) { (result) in
            completion(result)
        }
    }

    private func urlForQuery(query: String) -> NSURL {
        let components = NSURLComponents()
        components.scheme = "https"
        components.host = "api.ordnancesurvey.co.uk"
        components.path = "/places/v1/addresses/find"
        let queryItems = [
            NSURLQueryItem(name: "key", value: apiKey),
            NSURLQueryItem(name: "query", value: query)
        ]
        components.queryItems = queryItems
        return components.URL!
    }
}

/**
 *  Searchable protocol
 */
public protocol Searchable {
    /**
     Find the text specified

     - parameter query:      The text to find
     - parameter completion: Completion block to call
     */
    func find(query: String, completion: (Result<Response> -> Void))
}
