//
//  OSPlacesSearchService.swift
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

/**
*  Objective-C compatible wrapper for PlacesSearchService
*/
@objc public class OSPlacesSearchService: NSObject {

    let searchService: Searchable

    /**
     Initialiser

     - parameter apiKey: The API key to use with the service
     */
    public init(apiKey: String) {
        searchService = PlacesSearchService(apiKey: apiKey)
        super.init()
    }
}