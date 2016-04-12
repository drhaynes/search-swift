//
//  OSPlacesSearchService.swift
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import OSTransformation
import OSAPIResponse

protocol PlacesService {
    func find(query: String, completion: (Result<SearchResponse> -> Void))

    func nearest(location: OSGridPoint, completion: (Result<SearchResponse> -> Void))
}

extension PlacesSearchService: PlacesService {}

/**
*  Objective-C compatible wrapper for PlacesSearchService
*/
@objc public class OSPlacesSearchService: NSObject {

    var searchService: PlacesService

    /**
     Initialiser

     - parameter apiKey: The API key to use with the service
     */
    public init(apiKey: String) {
        searchService = PlacesSearchService(apiKey: apiKey)
        super.init()
    }

    private func callCompletion(result: Result<SearchResponse>, completion: (SearchResponse?, NSError?) -> Void) {
        switch result {
        case .Success(let response):
            completion(response, nil)
        case .Failure(let error as ResponseError):
            completion(nil, error.toNSError())
        case.Failure(let error):
            completion(nil, error as NSError)
        }
    }

    /**
     Find the text specified

     - parameter query:      The text to find
     - parameter completion: Completion block to call
     */
    public func find(query: String, completion: (SearchResponse?, NSError?) -> Void) {
        searchService.find(query) { result in
            self.callCompletion(result, completion: completion)
        }
    }

    /**
     Find the nearest address to the provided grid point. Will find a result
     within 100 metres.

     - parameter location:   The location to query
     - parameter completion: Completion block to call
     */
    public func nearest(location: OSGridPoint, completion: (SearchResponse?, NSError?) -> Void) {
        searchService.nearest(location) { result in
            self.callCompletion(result, completion: completion)
        }
    }

}
