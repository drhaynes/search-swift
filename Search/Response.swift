//
//  Response.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public final class Response: NSObject {
    
    public let results: [SearchResult]
    public let header: Header

    init(results: [SearchResult], header: Header) {
        self.results = results
        self.header = header
    }
}
