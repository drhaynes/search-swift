//
//  Dpa.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public class Dpa: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal static let LanguageKey: String = "LANGUAGE"
    internal static let LastUpdateDateKey: String = "LAST_UPDATE_DATE"
    internal static let RpcKey: String = "RPC"
    internal static let BuildingNumberKey: String = "BUILDING_NUMBER"
    internal static let PostcodeKey: String = "POSTCODE"
    internal static let UprnKey: String = "UPRN"
    internal static let MatchDescriptionKey: String = "MATCH_DESCRIPTION"
    internal static let EntryDateKey: String = "ENTRY_DATE"
    internal static let PostalAddressCodeKey: String = "POSTAL_ADDRESS_CODE"
    internal static let LocalCustodianCodeKey: String = "LOCAL_CUSTODIAN_CODE"
    internal static let StatusKey: String = "STATUS"
    internal static let BlpuStateCodeKey: String = "BLPU_STATE_CODE"
    internal static let OrganisationNameKey: String = "ORGANISATION_NAME"
    internal static let PostalAddressCodeDescriptionKey: String = "POSTAL_ADDRESS_CODE_DESCRIPTION"
    internal static let ClassificationCodeDescriptionKey: String = "CLASSIFICATION_CODE_DESCRIPTION"
    internal static let XCoordinateKey: String = "X_COORDINATE"
    internal static let MatchKey: String = "MATCH"
    internal static let ClassificationCodeKey: String = "CLASSIFICATION_CODE"
    internal static let TopographyLayerToidKey: String = "TOPOGRAPHY_LAYER_TOID"
    internal static let LocalCustodianCodeDescriptionKey: String = "LOCAL_CUSTODIAN_CODE_DESCRIPTION"
    internal static let BlpuStateCodeDescriptionKey: String = "BLPU_STATE_CODE_DESCRIPTION"
    internal static let DependentLocalityKey: String = "DEPENDENT_LOCALITY"
    internal static let LogicalStatusCodeKey: String = "LOGICAL_STATUS_CODE"
    internal static let YCoordinateKey: String = "Y_COORDINATE"
    internal static let ThoroughfareNameKey: String = "THOROUGHFARE_NAME"
    internal static let AddressKey: String = "ADDRESS"
    internal static let PostTownKey: String = "POST_TOWN"
    internal static let BlpuStateDateKey: String = "BLPU_STATE_DATE"

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
}
