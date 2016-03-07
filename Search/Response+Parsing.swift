//
//  Response+Parsing.swift
//  Search
//
//  Created by David Haynes on 02/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import JSONLib

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
    guard let header = headerFromJson(headerJson) else {
        return nil
    }
    let resultsJson = json[Response.ResultsKey]
    guard let results = resultsFromJson(resultsJson) else {
        return nil
    }
    return Response(results: results, header: header)
}

private func headerFromJson(json: JSON) -> Header? {
    guard let uri = json[Header.UriKey].string,
        lr = json[Header.LrKey].string,
        dataset = json[Header.DatasetKey].string,
        outputSrs = json[Header.OutputSrsKey].string,
        epoch = json[Header.EpochKey].string,
        format = json[Header.FormatKey].string,
        query = json[Header.QueryKey].string,
        matchPrecision =  json[Header.MatchprecisionKey].number,
        maxresults = json[Header.MaxresultsKey].number,
        totalresults = json[Header.TotalresultsKey].number,
        offset = json[Header.OffsetKey].number
    else {
        return nil
    }

    return Header(
        matchprecision: Int(matchPrecision),
        lr: lr,
        dataset: dataset,
        maxresults: Int(maxresults),
        totalresults: Int(totalresults),
        uri: uri,
        outputSrs: outputSrs,
        epoch: epoch,
        offset: Int(offset),
        format: format,
        query: query
    )
}

private func resultsFromJson(json: JSON) -> [Dpa]? {
    return json.array?.flatMap(dpaFromJson)
}

private func dpaFromJson(json: JSON) -> Dpa? {
    let dpaJson = json[Response.DpaKey]
    guard let language = dpaJson[Dpa.LanguageKey].string,
        lastUpdateDate = dpaJson[Dpa.LastUpdateDateKey].string,
        rpc = dpaJson[Dpa.RpcKey].string,
        buildingNumber = dpaJson[Dpa.BuildingNumberKey].string,
        postcode = dpaJson[Dpa.PostcodeKey].string,
        uprn = dpaJson[Dpa.UprnKey].string,
        matchDescription = dpaJson[Dpa.MatchDescriptionKey].string,
        entryDate = dpaJson[Dpa.EntryDateKey].string,
        postalAddressCode = dpaJson[Dpa.PostalAddressCodeKey].string,
        localCustodianCode = dpaJson[Dpa.LocalCustodianCodeKey].number,
        status = dpaJson[Dpa.StatusKey].string,
        blpuStateCode = dpaJson[Dpa.BlpuStateCodeKey].string,
        organisationName = dpaJson[Dpa.OrganisationNameKey].string,
        postalAddressCodeDescription = dpaJson[Dpa.PostalAddressCodeDescriptionKey].string,
        classificationCodeDescription = dpaJson[Dpa.ClassificationCodeDescriptionKey].string,
        xCoordinate = dpaJson[Dpa.XCoordinateKey].number,
        match = dpaJson[Dpa.MatchKey].number,
        classificationCode = dpaJson[Dpa.ClassificationCodeKey].string,
        topographyLayerToid = dpaJson[Dpa.TopographyLayerToidKey].string,
        localCustodianCodeDescription = dpaJson[Dpa.LocalCustodianCodeDescriptionKey].string,
        blpuStateCodeDescription = dpaJson[Dpa.BlpuStateCodeDescriptionKey].string,
        dependentLocality = dpaJson[Dpa.DependentLocalityKey].string,
        logicalStatusCode = dpaJson[Dpa.LogicalStatusCodeKey].string,
        yCoordinate = dpaJson[Dpa.YCoordinateKey].number,
        thoroughfareName = dpaJson[Dpa.ThoroughfareNameKey].string,
        address = dpaJson[Dpa.AddressKey].string,
        postTown = dpaJson[Dpa.PostTownKey].string,
        blpuStateDate = dpaJson[Dpa.BlpuStateDateKey].string
    else {
        return nil
    }

    return Dpa(
        language: language,
        lastUpdateDate: lastUpdateDate,
        rpc: rpc,
        buildingNumber: buildingNumber,
        postcode: postcode,
        uprn: uprn,
        matchDescription: matchDescription,
        entryDate: entryDate,
        postalAddressCode: postalAddressCode,
        localCustodianCode: Int(localCustodianCode),
        status: status,
        blpuStateCode: blpuStateCode,
        organisationName: organisationName,
        postalAddressCodeDescription: postalAddressCodeDescription,
        classificationCodeDescription: classificationCodeDescription,
        xCoordinate: Int(xCoordinate),
        match: Float(match),
        classificationCode: classificationCode,
        topographyLayerToid: topographyLayerToid,
        localCustodianCodeDescription: localCustodianCodeDescription,
        blpuStateCodeDescription: blpuStateCodeDescription,
        dependentLocality: dependentLocality,
        logicalStatusCode: logicalStatusCode,
        yCoordinate: Int(yCoordinate),
        thoroughfareName: thoroughfareName,
        address: address,
        postTown: postTown,
        blpuStateDate: blpuStateDate
    )
}
