//
//  Response.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import JSONCodable
import Gloss

public final class Response: NSObject, JSONDecodable, Gloss.Decodable {
    
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

    convenience public init?(json: Gloss.JSON) {
        guard let header: Header = Decoder.decodeDecodable(Response.HeaderKey)(json),
            results: [SearchResult] = Decoder.decodeDecodableArray(Response.ResultsKey)(json) else {
                return nil
        }
        self.init(results: results, header: header)
    }

    convenience init?(jsonDict: SomeJSON) {
        guard let headerDict = jsonDict[Response.HeaderKey] as? SomeJSON,
            searchResultsArray = jsonDict[Response.ResultsKey] as? [SomeJSON],
            header = Header(jsonDict: headerDict) else {
                return nil
        }
        self.init(results: searchResultsArray.flatMap({ SearchResult(jsonDict: $0) }), header: header)
    }
}
