//
//  Response.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public class Response: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kResponseResultsKey: String = "results"
    internal let kResponseHeaderKey: String = "header"

    public let results: [Results]?
    public let header: Header?

    init(results: [Results], header: Header) {
        self.results = results
        self.header = header
    }
}
