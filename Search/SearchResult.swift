//
//  SearchResult.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import JSONLib

public class SearchResult: NSObject {

    public let language: String
    public let lastUpdateDate: String
    public let rpc: String
    public let buildingNumber: String
    public let postcode: String
    public let uprn: String
    public let matchDescription: String
    public let entryDate: String
    public let postalAddressCode: String
    public let localCustodianCode: Int
    public let status: String
    public let blpuStateCode: String
    public let organisationName: String
    public let postalAddressCodeDescription: String
    public let classificationCodeDescription: String
    public let xCoordinate: Int
    public let match: Float
    public let classificationCode: String
    public let topographyLayerToid: String
    public let localCustodianCodeDescription: String
    public let blpuStateCodeDescription: String
    public let dependentLocality: String
    public let logicalStatusCode: String
    public let yCoordinate: Int
    public let thoroughfareName: String
    public let address: String
    public let postTown: String
    public let blpuStateDate: String

    init(language: String, lastUpdateDate: String, rpc: String, buildingNumber: String, postcode: String, uprn: String, matchDescription: String, entryDate: String, postalAddressCode: String, localCustodianCode: Int, status: String, blpuStateCode: String, organisationName: String, postalAddressCodeDescription: String, classificationCodeDescription: String, xCoordinate: Int, match: Float, classificationCode: String, topographyLayerToid: String, localCustodianCodeDescription: String, blpuStateCodeDescription: String, dependentLocality: String, logicalStatusCode: String, yCoordinate: Int, thoroughfareName: String, address: String, postTown: String, blpuStateDate: String) {
        self.language = language
        self.lastUpdateDate = lastUpdateDate
        self.rpc = rpc
        self.buildingNumber = buildingNumber
        self.postcode = postcode
        self.uprn = uprn
        self.matchDescription = matchDescription
        self.entryDate = entryDate
        self.postalAddressCode = postalAddressCode
        self.localCustodianCode = localCustodianCode
        self.status = status
        self.blpuStateCode = blpuStateCode
        self.organisationName = organisationName
        self.postalAddressCodeDescription = postalAddressCodeDescription
        self.classificationCodeDescription = classificationCodeDescription
        self.xCoordinate = xCoordinate
        self.match = match
        self.classificationCode = classificationCode
        self.topographyLayerToid = topographyLayerToid
        self.localCustodianCodeDescription = localCustodianCodeDescription
        self.blpuStateCodeDescription = blpuStateCodeDescription
        self.dependentLocality = dependentLocality
        self.logicalStatusCode = logicalStatusCode
        self.yCoordinate = yCoordinate
        self.thoroughfareName = thoroughfareName
        self.address = address
        self.postTown = postTown
        self.blpuStateDate = blpuStateDate
    }

    convenience init?(json: JSON) {
        guard let language = json[SearchResult.LanguageKey].string,
            lastUpdateDate = json[SearchResult.LastUpdateDateKey].string,
            rpc = json[SearchResult.RpcKey].string,
            buildingNumber = json[SearchResult.BuildingNumberKey].string,
            postcode = json[SearchResult.PostcodeKey].string,
            uprn = json[SearchResult.UprnKey].string,
            matchDescription = json[SearchResult.MatchDescriptionKey].string,
            entryDate = json[SearchResult.EntryDateKey].string,
            postalAddressCode = json[SearchResult.PostalAddressCodeKey].string,
            localCustodianCode = json[SearchResult.LocalCustodianCodeKey].number,
            status = json[SearchResult.StatusKey].string,
            blpuStateCode = json[SearchResult.BlpuStateCodeKey].string,
            organisationName = json[SearchResult.OrganisationNameKey].string,
            postalAddressCodeDescription = json[SearchResult.PostalAddressCodeDescriptionKey].string,
            classificationCodeDescription = json[SearchResult.ClassificationCodeDescriptionKey].string,
            xCoordinate = json[SearchResult.XCoordinateKey].number,
            match = json[SearchResult.MatchKey].number,
            classificationCode = json[SearchResult.ClassificationCodeKey].string,
            topographyLayerToid = json[SearchResult.TopographyLayerToidKey].string,
            localCustodianCodeDescription = json[SearchResult.LocalCustodianCodeDescriptionKey].string,
            blpuStateCodeDescription = json[SearchResult.BlpuStateCodeDescriptionKey].string,
            dependentLocality = json[SearchResult.DependentLocalityKey].string,
            logicalStatusCode = json[SearchResult.LogicalStatusCodeKey].string,
            yCoordinate = json[SearchResult.YCoordinateKey].number,
            thoroughfareName = json[SearchResult.ThoroughfareNameKey].string,
            address = json[SearchResult.AddressKey].string,
            postTown = json[SearchResult.PostTownKey].string,
            blpuStateDate = json[SearchResult.BlpuStateDateKey].string
            else {
                return nil
        }

        self.init(
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
}
