//
//  Response+Parsing.swift
//  Search
//
//  Created by David Haynes on 02/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import OSJSON

/**
 Errors returned when executing a search

 - NoDataReceived:          No data received from the server.
 - FailedToParseJSON:       JSON parsing has failed, likely due to invalid JSON.
 - FailedToDeserialiseJSON: JSON was valid, but cannot be deserialised.
 - UnknownError:            An error has occured which is none of the above.
 */
public enum SearchError: ErrorType {
    case NoDataReceived
    case FailedToParseJSON
    case FailedToDeserialiseJSON
    case UnknownError
}

extension Response: Parsable {
    public static func parse(fromData data: NSData?, withStatus status: Int) -> Result<Response> {
        switch status {
        case 200:
            return parseResponse(data)
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
    guard let response = responseFromOSJson(responseJson) else {
        return .Failure(SearchError.FailedToDeserialiseJSON)
    }
    return .Success(response)
}

private func responseFromOSJson(json: OSJSON) -> Response? {
    guard let
        headerJson = json.jsonForKey(Response.HeaderKey),
        header = Header(json: headerJson),
        resultsJson = json.jsonForKey(Response.ResultsKey) else {
            return nil
    }
    guard let results = resultsJson.array()?.flatMap(dpaFromOSJson) else {
        return nil
    }
    return Response(results: results, header: header)
}

private func dpaFromOSJson(json: OSJSON) -> SearchResult? {
    guard let nestedJson = json.jsonForKey(Results.SearchResultKey) else {
        return nil
    }
    return SearchResult(json: nestedJson)
}
