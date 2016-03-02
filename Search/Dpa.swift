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
    internal let kDpaLanguageKey: String = "LANGUAGE"
    internal let kDpaLastUpdateDateKey: String = "LAST_UPDATE_DATE"
    internal let kDpaRpcKey: String = "RPC"
    internal let kDpaBuildingNumberKey: String = "BUILDING_NUMBER"
    internal let kDpaPostcodeKey: String = "POSTCODE"
    internal let kDpaUprnKey: String = "UPRN"
    internal let kDpaMatchDescriptionKey: String = "MATCH_DESCRIPTION"
    internal let kDpaEntryDateKey: String = "ENTRY_DATE"
    internal let kDpaPostalAddressCodeKey: String = "POSTAL_ADDRESS_CODE"
    internal let kDpaLocalCustodianCodeKey: String = "LOCAL_CUSTODIAN_CODE"
    internal let kDpaStatusKey: String = "STATUS"
    internal let kDpaBlpuStateCodeKey: String = "BLPU_STATE_CODE"
    internal let kDpaOrganisationNameKey: String = "ORGANISATION_NAME"
    internal let kDpaPostalAddressCodeDescriptionKey: String = "POSTAL_ADDRESS_CODE_DESCRIPTION"
    internal let kDpaClassificationCodeDescriptionKey: String = "CLASSIFICATION_CODE_DESCRIPTION"
    internal let kDpaXCoordinateKey: String = "X_COORDINATE"
    internal let kDpaMatchKey: String = "MATCH"
    internal let kDpaClassificationCodeKey: String = "CLASSIFICATION_CODE"
    internal let kDpaTopographyLayerToidKey: String = "TOPOGRAPHY_LAYER_TOID"
    internal let kDpaLocalCustodianCodeDescriptionKey: String = "LOCAL_CUSTODIAN_CODE_DESCRIPTION"
    internal let kDpaBlpuStateCodeDescriptionKey: String = "BLPU_STATE_CODE_DESCRIPTION"
    internal let kDpaDependentLocalityKey: String = "DEPENDENT_LOCALITY"
    internal let kDpaLogicalStatusCodeKey: String = "LOGICAL_STATUS_CODE"
    internal let kDpaYCoordinateKey: String = "Y_COORDINATE"
    internal let kDpaThoroughfareNameKey: String = "THOROUGHFARE_NAME"
    internal let kDpaAddressKey: String = "ADDRESS"
    internal let kDpaPostTownKey: String = "POST_TOWN"
    internal let kDpaBlpuStateDateKey: String = "BLPU_STATE_DATE"

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
