//
//  OpenNamesResponse.swift
//  Search
//
//  Created by Dave Hardiman on 11/04/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

import Foundation
import OSAPIResponse
import OSJSON

@objc(OSOpenNamesResponse)
public final class OpenNamesResponse: Response, Parsable {
    // MARK: Properties
    public let results: [GazetteerEntry]

    public init(results: [GazetteerEntry], header: Header) {
        self.results = results
        super.init(header: header)
    }
}
