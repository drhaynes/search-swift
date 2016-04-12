//
//  Response.swift
//  Search
//
//  Created by Dave Hardiman on 11/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import OSAPIResponse
import OSJSON

@objc(OSSearchResponse)
public final class SearchResponse: Response, Parsable {

    public typealias Payload = SearchResult

    // MARK: Properties
    public let results: [SearchResult]


    public init(results: [SearchResult], header: Header) {
        self.results = results
        super.init(header: header)
    }
}
