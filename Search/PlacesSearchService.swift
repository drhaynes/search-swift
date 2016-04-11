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
    public let apiKey: String
    public let apiPath: String = "places/v1/addresses"

    public typealias ResponseType = SearchResponse

    /**
     Constructor

     - parameter apiKey: The OS Places API key to use with the service
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

}
