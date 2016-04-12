//
//  OSOpenNamesSearchService.swift
//  Search
//
//  Created by Dave Hardiman on 12/04/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation
import Fetch
import OSTransformation
import OSAPIResponse

protocol OpenNamesService {
    func find(query: String, completion: (Result<OpenNamesResponse> -> Void))

    func nearest(location: OSGridPoint, completion: (Result<OpenNamesResponse> -> Void))

    func find(query: String, boundingBox: OSGridRect, completion: (Result<OpenNamesResponse> -> Void))
}

extension OpenNamesSearchService: OpenNamesService {}

/**
 *  Objective-C compatible wrapper for Open Names search
 */
@objc(OSOpenNamesSearchService)
public class OSOpenNamesSearchService: NSObject {
    var searchService: OpenNamesService

    /**
     Initialiser

     - parameter apiKey: The API key to use with the service
     */
    public init(apiKey: String) {
        searchService = OpenNamesSearchService(apiKey: apiKey)
        super.init()
    }

    private func callCompletion(result: Result<OpenNamesResponse>, completion: (OpenNamesResponse?, NSError?) -> Void) {
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
    public func find(query: String, completion: (OpenNamesResponse?, NSError?) -> Void) {
        searchService.find(query) { result in
            self.callCompletion(result, completion: completion)
        }
    }

    /**
     Find the specified text, prioritising results within the bounding box

     - parameter query:       The text to find
     - parameter boundingBox: The bounding box to search within
     - parameter completion:  Completion block to call
     */
    public func find(query: String, boundingBox: OSGridRect, completion: (OpenNamesResponse?, NSError?) -> Void) {
        searchService.find(query, boundingBox: boundingBox) { result in
            self.callCompletion(result, completion: completion)
        }
    }

    /**
     Find the nearest address to the provided grid point. Will find a result
     within 100 metres.

     - parameter location:   The location to query
     - parameter completion: Completion block to call
     */
    public func nearest(location: OSGridPoint, completion: (OpenNamesResponse?, NSError?) -> Void) {
        searchService.nearest(location) { result in
            self.callCompletion(result, completion: completion)
        }
    }
}