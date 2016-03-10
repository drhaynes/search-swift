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
    guard let headerJson = json.jsonForKey(Response.HeaderKey) else {
        return nil
    }
    guard let header = headerFromOSJson(headerJson) else {
        return nil
    }

    let resultsJson = json.jsonForKey(Response.ResultsKey)
    guard let results = resultsJson?.array().flatMap(dpaFromOSJson) else {
        return nil
    }
    return Response(results: results, header: header)
}


private func dpaFromOSJson(json: OSJSON) -> SearchResult? {
    guard let nestedJson = json.jsonForKey(Response.ResultKey) else {
        return nil
    }
    guard let language = nestedJson.stringValueForKey(SearchResult.LanguageKey),
        lastUpdateDate = nestedJson.stringValueForKey(SearchResult.LastUpdateDateKey),
        rpc = nestedJson.stringValueForKey(SearchResult.RpcKey),
        postcode = nestedJson.stringValueForKey(SearchResult.PostcodeKey),
        uprn = nestedJson.stringValueForKey(SearchResult.UprnKey),
        matchDescription = nestedJson.stringValueForKey(SearchResult.MatchDescriptionKey),
        entryDate = nestedJson.stringValueForKey(SearchResult.EntryDateKey),
        postalAddressCode = nestedJson.stringValueForKey(SearchResult.PostalAddressCodeKey),
        status = nestedJson.stringValueForKey(SearchResult.StatusKey),
        postalAddressCodeDescription = nestedJson.stringValueForKey(SearchResult.PostalAddressCodeDescriptionKey),
        classificationCodeDescription = nestedJson.stringValueForKey(SearchResult.ClassificationCodeDescriptionKey),
        classificationCode = nestedJson.stringValueForKey(SearchResult.ClassificationCodeKey),
        localCustodianCodeDescription = nestedJson.stringValueForKey(SearchResult.LocalCustodianCodeDescriptionKey),
        blpuStateCodeDescription = nestedJson.stringValueForKey(SearchResult.BlpuStateCodeDescriptionKey),
        logicalStatusCode = nestedJson.stringValueForKey(SearchResult.LogicalStatusCodeKey),
        address = nestedJson.stringValueForKey(SearchResult.AddressKey),
        postTown = nestedJson.stringValueForKey(SearchResult.PostTownKey)
        else {
            return nil
    }

    let localCustodianCode = Int(nestedJson.intValueForKey(SearchResult.LocalCustodianCodeKey))
    let xCoordinate = Int(nestedJson.intValueForKey(SearchResult.XCoordinateKey))
    let yCoordinate = Int(nestedJson.intValueForKey(SearchResult.YCoordinateKey))
    let match = Float(nestedJson.doubleValueForKey(SearchResult.MatchKey))

    return SearchResult(
        language: language,
        lastUpdateDate: lastUpdateDate,
        rpc: rpc,
        buildingNumber: nestedJson.stringValueForKey(SearchResult.BuildingNumberKey),
        postcode: postcode,
        uprn: uprn,
        matchDescription: matchDescription,
        entryDate: entryDate,
        postalAddressCode: postalAddressCode,
        localCustodianCode: localCustodianCode,
        status: status,
        blpuStateCode: nestedJson.stringValueForKey(SearchResult.BlpuStateCodeKey),
        organisationName: nestedJson.stringValueForKey(SearchResult.OrganisationNameKey),
        postalAddressCodeDescription: postalAddressCodeDescription,
        classificationCodeDescription: classificationCodeDescription,
        xCoordinate: xCoordinate,
        match: match,
        classificationCode: classificationCode,
        topographyLayerToid: nestedJson.stringValueForKey(SearchResult.TopographyLayerToidKey),
        localCustodianCodeDescription: localCustodianCodeDescription,
        blpuStateCodeDescription: blpuStateCodeDescription,
        dependentLocality: nestedJson.stringValueForKey(SearchResult.DependentLocalityKey),
        logicalStatusCode: logicalStatusCode,
        yCoordinate: yCoordinate,
        thoroughfareName: nestedJson.stringValueForKey(SearchResult.ThoroughfareNameKey),
        address: address,
        postTown: postTown,
        blpuStateDate: nestedJson.stringValueForKey(SearchResult.BlpuStateDateKey)
    )
}

private func headerFromOSJson(json: OSJSON) -> Header? {
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
