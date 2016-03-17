//
//  SearchService.swift
//  Search
//
//  Created by David Haynes on 10/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch

/**
 */

 /**
 Errors returned when executing a search

 - NoDataReceived:          No data received from the server.
 - Unauthorised:            Unauthorised request for this API key.
 - BadRequest:              Request was not properly formed, see localised desctription for detail.
 - ServerError:             The server has returned an error. See localised desctription for detail.
 - FailedToParseJSON:       JSON parsing has failed, likely due to invalid JSON.
 - FailedToDeserialiseJSON: JSON was valid, but cannot be deserialised.
 - UnknownError:            An error has occured which is none of the above.
 */
public enum SearchError: ErrorType {
    case NoDataReceived
    case Unauthorised
    case BadRequest(String)
    case ServerError(String)
    case FailedToParseJSON
    case FailedToDeserialiseJSON
    case UnknownError

    public func rawValue() -> Int {
        switch self {
        case .NoDataReceived:
            return OSSearchErrorNoDataReceived
        case .Unauthorised:
            return OSSearchErrorUnauthorised
        case .BadRequest:
            return OSSearchErrorBadRequest
        case .ServerError:
            return OSSearchErrorServerError
        case .FailedToDeserialiseJSON:
            return OSSearchErrorFailedToDeserialiseJSON
        case .FailedToParseJSON:
            return OSSearchErrorFailedToParseJSON
        case .UnknownError:
            return OSSearchErrorUnknownError
        }
    }
}

/// Service for consuming the OS Places API
public class PlacesSearchService: Searchable {
    let apiKey: String

    /**
     Constructor

     - parameter apiKey: The OS Places API key to use with the service
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    /**
     Find using the free text specificed.
     Documentation can be found at: https://apidocs.os.uk/docs/os-places-find

     - parameter query:      The query text to find
     - parameter completion: Completion closure to execute
     */
    public func find(query: String, completion: (Result<Response> -> Void)) {
        let request = Request(url: urlForQuery(query))
        get(request) { (result) in
            completion(result)
        }
    }

    private func urlForQuery(query: String) -> NSURL {
        let components = NSURLComponents()
        components.scheme = "https"
        components.host = "api.ordnancesurvey.co.uk"
        components.path = "/places/v1/addresses/find"
        let queryItems = [
            NSURLQueryItem(name: "key", value: apiKey),
            NSURLQueryItem(name: "query", value: query)
        ]
        components.queryItems = queryItems
        return components.URL!
    }
}
