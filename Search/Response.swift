//
//  Response.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import JSONCodable

public final class Response: NSObject, JSONDecodable {
    
    public let results: [SearchResult]
    public let header: Header

    init(results: [SearchResult], header: Header) {
        self.results = results
        self.header = header
    }

    convenience public required init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        let header: Header = try decoder.decode(Response.HeaderKey)
        let results: [SearchResult] = try decoder.decode(Response.ResultsKey)

        self.init(results: results, header: header)
    }
}
