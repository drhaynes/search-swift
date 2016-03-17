//
//  Response+Parsing.swift
//  Search
//
//  Created by David Haynes on 02/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import OSJSON

extension Response: Parsable {
    public static func parse(fromData data: NSData?, withStatus status: Int) -> Result<Response> {
        switch status {
        case 200:
            return parseResponse(data)
        case 401:
            return .Failure(SearchError.Unauthorised)
        case 400:
            return .Failure(SearchError.BadRequest(errorMessage(data)))
        case 500:
            return .Failure(SearchError.ServerError(errorMessage(data)))
        default:
            return .Failure(SearchError.UnknownError)
        }
    }
}

private func parseResponse(data: NSData?) -> Result<Response> {
    guard let data = data else {
        return .Failure(SearchError.NoDataReceived)
    }
    guard let responseJson = OSJSON(data: data) else {
        return .Failure(SearchError.FailedToParseJSON)
    }
    guard let response = Response(json: responseJson) else {
        return .Failure(SearchError.FailedToDeserialiseJSON)
    }
    return .Success(response)
}

private func errorMessage(data: NSData?) -> String {
    guard let data = data else {
        return ""
    }
    let json = JSON(data: data, initialKeyPath: "error")
    return json.stringValueForKey("message") ?? ""
}
