//
//  SearchResult.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import JSONLib
import JSONCodable
import Gloss

public class SearchResult: NSObject, JSONDecodable, Gloss.Decodable {

    public let language: String
    public let lastUpdateDate: String
    public let rpc: String
    public let buildingNumber: String?
    public let postcode: String
    public let uprn: String
    public let matchDescription: String
    public let entryDate: String
    public let postalAddressCode: String
    public let localCustodianCode: Int
    public let status: String
    public let blpuStateCode: String?
    public let organisationName: String?
    public let postalAddressCodeDescription: String
    public let classificationCodeDescription: String
    public let xCoordinate: Int
    public let match: Float
    public let classificationCode: String
    public let topographyLayerToid: String?
    public let localCustodianCodeDescription: String
    public let blpuStateCodeDescription: String
    public let dependentLocality: String?
    public let logicalStatusCode: String
    public let yCoordinate: Int
    public let thoroughfareName: String?
    public let address: String
    public let postTown: String
    public let blpuStateDate: String?

    init(language: String, lastUpdateDate: String, rpc: String, buildingNumber: String?, postcode: String, uprn: String, matchDescription: String, entryDate: String, postalAddressCode: String, localCustodianCode: Int, status: String, blpuStateCode: String?, organisationName: String?, postalAddressCodeDescription: String, classificationCodeDescription: String, xCoordinate: Int, match: Float, classificationCode: String, topographyLayerToid: String?, localCustodianCodeDescription: String, blpuStateCodeDescription: String, dependentLocality: String?, logicalStatusCode: String, yCoordinate: Int, thoroughfareName: String?, address: String, postTown: String, blpuStateDate: String?) {
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

    convenience init?(jsonDict: SomeJSON) {
        guard let
            result = jsonDict[Response.ResultKey] as? SomeJSON,
            language = result[SearchResult.LanguageKey] as? String,
            lastUpdateDate = result[SearchResult.LastUpdateDateKey] as? String,
            rpc = result[SearchResult.RpcKey] as? String,
            postcode = result[SearchResult.PostcodeKey] as? String,
            uprn = result[SearchResult.UprnKey] as? String,
            matchDescription = result[SearchResult.MatchDescriptionKey] as? String,
            entryDate = result[SearchResult.EntryDateKey] as? String,
            postalAddressCode = result[SearchResult.PostalAddressCodeKey] as? String,
            localCustodianCode = result[SearchResult.LocalCustodianCodeKey] as? Int,
            status = result[SearchResult.StatusKey] as? String,
            postalAddressCodeDescription = result[SearchResult.PostalAddressCodeDescriptionKey] as? String,
            classificationCodeDescription = result[SearchResult.ClassificationCodeDescriptionKey] as? String,
            xCoordinate = result[SearchResult.XCoordinateKey] as? Int,
            match = result[SearchResult.MatchKey] as? Float,
            classificationCode = result[SearchResult.ClassificationCodeKey] as? String,
            localCustodianCodeDescription = result[SearchResult.LocalCustodianCodeDescriptionKey] as? String,
            blpuStateCodeDescription = result[SearchResult.BlpuStateCodeDescriptionKey] as? String,
            logicalStatusCode = result[SearchResult.LogicalStatusCodeKey] as? String,
            yCoordinate = result[SearchResult.YCoordinateKey] as? Int,
            address = result[SearchResult.AddressKey] as? String,
            postTown = result[SearchResult.PostTownKey] as? String
            else {
                return nil
        }

        let buildingNumber = result[SearchResult.BuildingNumberKey] as? String
        let blpuStateCode = result[SearchResult.BlpuStateCodeKey] as? String
        let organisationName = result[SearchResult.OrganisationNameKey] as? String
        let topographyLayerToid = result[SearchResult.TopographyLayerToidKey] as? String
        let dependentLocality = result[SearchResult.DependentLocalityKey] as? String
        let thoroughfareName = result[SearchResult.ThoroughfareNameKey] as? String
        let blpuStateDate = result[SearchResult.BlpuStateDateKey] as? String

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
            localCustodianCode: localCustodianCode,
            status: status,
            blpuStateCode: blpuStateCode,
            organisationName: organisationName,
            postalAddressCodeDescription: postalAddressCodeDescription,
            classificationCodeDescription: classificationCodeDescription,
            xCoordinate: xCoordinate,
            match: match,
            classificationCode: classificationCode,
            topographyLayerToid: topographyLayerToid,
            localCustodianCodeDescription: localCustodianCodeDescription,
            blpuStateCodeDescription: blpuStateCodeDescription,
            dependentLocality: dependentLocality,
            logicalStatusCode: logicalStatusCode,
            yCoordinate: yCoordinate,
            thoroughfareName: thoroughfareName,
            address: address,
            postTown: postTown,
            blpuStateDate: blpuStateDate
        )
    }

    convenience init?(json: JSONLib.JSON) {
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

    convenience required public init?(json: Gloss.JSON) {
        guard let
            result: Gloss.JSON = Decoder.decode(Response.ResultKey)(json),
            language: String = Decoder.decode(SearchResult.LanguageKey)(result),
            lastUpdateDate: String = Decoder.decode(SearchResult.LastUpdateDateKey)(result),
            rpc: String = Decoder.decode(SearchResult.RpcKey)(result),
            postcode: String = Decoder.decode(SearchResult.PostcodeKey)(result),
            uprn: String = Decoder.decode(SearchResult.UprnKey)(result),
            matchDescription: String = Decoder.decode(SearchResult.MatchDescriptionKey)(result),
            entryDate: String = Decoder.decode(SearchResult.EntryDateKey)(result),
            postalAddressCode: String = Decoder.decode(SearchResult.PostalAddressCodeKey)(result),
            localCustodianCode: Int = Decoder.decode(SearchResult.LocalCustodianCodeKey)(result),
            status: String = Decoder.decode(SearchResult.StatusKey)(result),
            postalAddressCodeDescription: String = Decoder.decode(SearchResult.PostalAddressCodeDescriptionKey)(result),
            classificationCodeDescription: String = Decoder.decode(SearchResult.ClassificationCodeDescriptionKey)(result),
            xCoordinate: Int = Decoder.decode(SearchResult.XCoordinateKey)(result),
            match: Float = Decoder.decode(SearchResult.MatchKey)(result),
            classificationCode: String = Decoder.decode(SearchResult.ClassificationCodeKey)(result),
            localCustodianCodeDescription: String = Decoder.decode(SearchResult.LocalCustodianCodeDescriptionKey)(result),
            blpuStateCodeDescription: String = Decoder.decode(SearchResult.BlpuStateCodeDescriptionKey)(result),
            logicalStatusCode: String = Decoder.decode(SearchResult.LogicalStatusCodeKey)(result),
            yCoordinate: Int = Decoder.decode(SearchResult.YCoordinateKey)(result),
            address: String = Decoder.decode(SearchResult.AddressKey)(result),
            postTown: String = Decoder.decode(SearchResult.PostTownKey)(result)
            else {
                return nil
        }

        let buildingNumber: String? = Decoder.decode(SearchResult.BuildingNumberKey)(result)
        let blpuStateCode: String? = Decoder.decode(SearchResult.BlpuStateCodeKey)(result)
        let organisationName: String? = Decoder.decode(SearchResult.OrganisationNameKey)(result)
        let topographyLayerToid: String? = Decoder.decode(SearchResult.TopographyLayerToidKey)(result)
        let dependentLocality: String? = Decoder.decode(SearchResult.DependentLocalityKey)(result)
        let thoroughfareName: String? = Decoder.decode(SearchResult.ThoroughfareNameKey)(result)
        let blpuStateDate: String? = Decoder.decode(SearchResult.BlpuStateDateKey)(result)

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
            localCustodianCode: localCustodianCode,
            status: status,
            blpuStateCode: blpuStateCode,
            organisationName: organisationName,
            postalAddressCodeDescription: postalAddressCodeDescription,
            classificationCodeDescription: classificationCodeDescription,
            xCoordinate: xCoordinate,
            match: match,
            classificationCode: classificationCode,
            topographyLayerToid: topographyLayerToid,
            localCustodianCodeDescription: localCustodianCodeDescription,
            blpuStateCodeDescription: blpuStateCodeDescription,
            dependentLocality: dependentLocality,
            logicalStatusCode: logicalStatusCode,
            yCoordinate: yCoordinate,
            thoroughfareName: thoroughfareName,
            address: address,
            postTown: postTown,
            blpuStateDate: blpuStateDate
        )
    }

    convenience public required init(object: JSONObject) throws {
        guard let nestedResultObject = object[Response.ResultKey] as? [String: AnyObject] else {
            throw SearchError.FailedToDeserialiseJSON
        }
        let decoder = JSONDecoder(object: nestedResultObject)
        let language: String = try decoder.decode(SearchResult.LanguageKey)
        let lastUpdateDate: String = try decoder.decode(SearchResult.LastUpdateDateKey)
        let rpc: String = try decoder.decode(SearchResult.RpcKey)
        let buildingNumber: String? = try? decoder.decode(SearchResult.BuildingNumberKey)
        let postcode: String = try decoder.decode(SearchResult.PostcodeKey)
        let uprn: String = try decoder.decode(SearchResult.UprnKey)
        let matchDescription: String = try decoder.decode(SearchResult.MatchDescriptionKey)
        let entryDate: String = try decoder.decode(SearchResult.EntryDateKey)
        let postalAddressCode: String = try decoder.decode(SearchResult.PostalAddressCodeKey)
        let localCustodianCode: Int = try decoder.decode(SearchResult.LocalCustodianCodeKey)
        let status: String = try decoder.decode(SearchResult.StatusKey)
        let blpuStateCode: String? = try? decoder.decode(SearchResult.BlpuStateCodeKey)
        let organisationName: String? = try? decoder.decode(SearchResult.OrganisationNameKey)
        let postalAddressCodeDescription: String = try decoder.decode(SearchResult.PostalAddressCodeDescriptionKey)
        let classificationCodeDescription: String = try decoder.decode(SearchResult.ClassificationCodeDescriptionKey)
        let xCoordinate: Int = try decoder.decode(SearchResult.XCoordinateKey)
        let match: Float = try decoder.decode(SearchResult.MatchKey)
        let classificationCode: String = try decoder.decode(SearchResult.ClassificationCodeKey)
        let topographyLayerToid: String? = try? decoder.decode(SearchResult.TopographyLayerToidKey)
        let localCustodianCodeDescription: String = try decoder.decode(SearchResult.LocalCustodianCodeDescriptionKey)
        let blpuStateCodeDescription: String = try decoder.decode(SearchResult.BlpuStateCodeDescriptionKey)
        let dependentLocality: String? = try? decoder.decode(SearchResult.DependentLocalityKey)
        let logicalStatusCode: String = try decoder.decode(SearchResult.LogicalStatusCodeKey)
        let yCoordinate: Int = try decoder.decode(SearchResult.YCoordinateKey)
        let thoroughfareName: String? = try? decoder.decode(SearchResult.ThoroughfareNameKey)
        let address: String = try decoder.decode(SearchResult.AddressKey)
        let postTown: String = try decoder.decode(SearchResult.PostTownKey)
        let blpuStateDate: String? = try? decoder.decode(SearchResult.BlpuStateDateKey)

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
