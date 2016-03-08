//
//  Response+Parsing.swift
//  Search
//
//  Created by David Haynes on 02/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import JSONLib
import JSONCodable

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
        case 666:
            return parseResponse2(data)
        default:
            return .Failure(SearchError.UnknownError)
        }
    }
}

private func parseResponse(data: NSData?) -> Result<Response> {
    guard let data = data else {
        return .Failure(SearchError.NoDataReceived)
    }
    guard let json = JSValue.parse(data).value else {
        return .Failure(SearchError.FailedToParseJSON)
    }
    guard let response = responseFromJson(json) else {
        return .Failure(SearchError.FailedToDeserialiseJSON)
    }
    return .Success(response)
}

private func responseFromJson(json: JSON) -> Response? {
    let headerJson = json[Response.HeaderKey]
    guard let header = Header(json: headerJson) else {
        return nil
    }
    let resultsJson = json[Response.ResultsKey]
    guard let results = resultsJson.array?.flatMap(dpaFromJson) else {
        return nil
    }
    return Response(results: results, header: header)
}

private func dpaFromJson(json: JSON) -> SearchResult? {
    let dpaJson = json[Response.ResultKey]
    return SearchResult(json: dpaJson)
}

func parseResponse2(data: NSData?) -> Result<Response> {
    guard let data = data else {
        return .Failure(SearchError.NoDataReceived)
    }
    do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        return .Success(try! Response(object: json as! JSONObject))
    }
    catch {
        return .Failure(SearchError.FailedToParseJSON)
    }

}