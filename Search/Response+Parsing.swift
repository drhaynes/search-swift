//
//  Response+Parsing.swift
//  Search
//
//  Created by David Haynes on 02/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch

public enum SearchError: ErrorType {
    case NoDataReceived
    case FailedToParseJSON
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
    let headerJson = OSJSON(data: data, initialKeyPath: Response.HeaderKey)
    guard let header = headerFromJson(headerJson) else {
        return .Failure(SearchError.FailedToParseJSON)
    }

    let resultsJson = OSJSON(data: data, initialKeyPath: Response.ResultsKey)
    guard let results = resultsFromJson(resultsJson) else {
            return .Failure(SearchError.FailedToParseJSON)
    }

    return .Success(Response(results: results, header: header))
}

private func headerFromJson(json: OSJSON) -> Header? {
    guard let uri = json.stringValueForKey(Header.UriKey),
        lr = json.stringValueForKey(Header.LrKey),
        dataset = json.stringValueForKey(Header.DatasetKey),
        outputSrs = json.stringValueForKey(Header.OutputSrsKey),
        epoch = json.stringValueForKey(Header.EpochKey),
        format = json.stringValueForKey(Header.FormatKey),
        query = json.stringValueForKey(Header.QueryKey)
    else {
        return nil
    }
    let matchPrecision = Int(json.intValueForKey(Header.MatchprecisionKey))
    let maxresults = Int(json.intValueForKey(Header.MaxresultsKey))
    let totalresults = Int(json.intValueForKey(Header.TotalresultsKey))
    let offset = Int(json.intValueForKey(Header.OffsetKey))

    return Header(
        matchprecision: matchPrecision,
        lr: lr,
        dataset: dataset,
        maxresults: maxresults,
        totalresults: totalresults,
        uri: uri,
        outputSrs: outputSrs,
        epoch: epoch,
        offset: offset,
        format: format,
        query: query
    )
}

private func resultsFromJson(json: OSJSON) -> Results? {
    return Results(dpa: [Dpa(language: "Bla", lastUpdateDate: "bla", rpc: "bla", buildingNumber: "bla", postcode: "bla", uprn: "bla", matchDescription: "bla", entryDate: "bla", postalAddressCode: "bla", localCustodianCode: 666, status: "bla", blpuStateCode: "bla", organisationName: "bla", postalAddressCodeDescription: "bla", classificationCodeDescription: "bla", xCoordinate: 666, match: 666.0, classificationCode: "bla", topographyLayerToid: "bla", localCustodianCodeDescription: "bla", blpuStateCodeDescription: "bla", dependentLocality: "bla", logicalStatusCode: "bla", yCoordinate: 666, thoroughfareName: "bla", address: "bla", postTown: "bla", blpuStateDate: "bla")])
}
