//
//  Response.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public final class Response: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal static let ResultsKey: String = "results"
    internal static let HeaderKey: String = "header"

    public let results: Results
    public let header: Header

    init(results: Results, header: Header) {
        self.results = results
        self.header = header
    }
}
