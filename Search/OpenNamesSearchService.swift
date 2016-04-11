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
    public let apiKey: String

    public let apiPath: String = "opennames/v1"

    public typealias ResponseType = OpenNamesResponse

    /**
     Constructor

     - parameter apiKey: The OS Places API key to use with the service
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

}
