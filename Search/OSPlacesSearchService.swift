//
//  OSPlacesSearchService.swift
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import OSTransformation

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

    private func callCompletion(result: Result<SearchResponse>, completion: (SearchResponse?, NSError?) -> Void) {
        switch result {
        case .Success(let response):
            completion(response, nil)
        case .Failure(let error as SearchError):
            completion(nil, nsErrorFromSearchError(error))
        case.Failure(let error):
            completion(nil, error as NSError)
        }
    }

    public func find(query: String, completion: (SearchResponse?, NSError?) -> Void) {
        searchService.find(query) { result in
            self.callCompletion(result, completion: completion)
        }
    }

    public func nearest(location: OSGridPoint, completion: (SearchResponse?, NSError?) -> Void) {
        searchService.nearest(location) { result in
            self.callCompletion(result, completion: completion)
        }
    }

}

private func nsErrorFromSearchError(error: SearchError) -> NSError {
    let info: [String : String]?
    switch error {
    case .BadRequest(let description):
        info = [NSLocalizedDescriptionKey: description]
    case .ServerError(let description):
        info = [NSLocalizedDescriptionKey: description]
    default:
        info = nil
    }
    return NSError(domain: OSSearchErrorDomain, code: error.rawValue(), userInfo: info)
}
