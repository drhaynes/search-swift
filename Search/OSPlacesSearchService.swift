//
//  OSPlacesSearchService.swift
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch

/**
*  Objective-C compatible wrapper for PlacesSearchService
*/
@objc public class OSPlacesSearchService: NSObject {

    var searchService: Searchable

    /**
     Initialiser

     - parameter apiKey: The API key to use with the service
     */
    public init(apiKey: String) {
        searchService = PlacesSearchService(apiKey: apiKey)
        super.init()
    }

    public func find(query: String, completion: (Response?, NSError?) -> Void) {
        searchService.find(query) { result in
            switch result {
            case .Success(let response):
                completion(response, nil)
            case .Failure(let error as SearchError):
                completion(nil, nil)
            case.Failure(let error):
                completion(nil, error as NSError)
            }
        }
    }

}
