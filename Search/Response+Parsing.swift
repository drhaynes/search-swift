//
//  Response+Parsing.swift
//  Search
//
//  Created by David Haynes on 02/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch

public enum SearchError: ErrorType {
    case FailedToParseJSON
}

extension Response: Parsable {
    public static func parse(fromData data: NSData?, withStatus status: Int) -> Result<Response> {
        return .Failure(SearchError.FailedToParseJSON)
    }
}
