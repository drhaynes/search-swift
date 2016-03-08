////
////  SearchResult+JsonDecodable.swift
////  Search
////
////  Created by David Haynes on 08/03/2016.
////  Copyright © 2016 Ordnance Survey. All rights reserved.
////
//
//import Foundation
//import JSONCodable
//
//
//
//extension SearchResult: JSONDecodable {
//    convenience public init(object: JSONObject) throws {
//        guard let language = json[SearchResult.LanguageKey].string,
//            lastUpdateDate = json[SearchResult.LastUpdateDateKey].string,
//            rpc = json[SearchResult.RpcKey].string,
//            buildingNumber = json[SearchResult.BuildingNumberKey].string,
//            postcode = json[SearchResult.PostcodeKey].string,
//            uprn = json[SearchResult.UprnKey].string,
//            matchDescription = json[SearchResult.MatchDescriptionKey].string,
//            entryDate = json[SearchResult.EntryDateKey].string,
//            postalAddressCode = json[SearchResult.PostalAddressCodeKey].string,
//            localCustodianCode = json[SearchResult.LocalCustodianCodeKey].number,
//            status = json[SearchResult.StatusKey].string,
//            blpuStateCode = json[SearchResult.BlpuStateCodeKey].string,
//            organisationName = json[SearchResult.OrganisationNameKey].string,
//            postalAddressCodeDescription = json[SearchResult.PostalAddressCodeDescriptionKey].string,
//            classificationCodeDescription = json[SearchResult.ClassificationCodeDescriptionKey].string,
//            xCoordinate = json[SearchResult.XCoordinateKey].number,
//            match = json[SearchResult.MatchKey].number,
//            classificationCode = json[SearchResult.ClassificationCodeKey].string,
//            topographyLayerToid = json[SearchResult.TopographyLayerToidKey].string,
//            localCustodianCodeDescription = json[SearchResult.LocalCustodianCodeDescriptionKey].string,
//            blpuStateCodeDescription = json[SearchResult.BlpuStateCodeDescriptionKey].string,
//            dependentLocality = json[SearchResult.DependentLocalityKey].string,
//            logicalStatusCode = json[SearchResult.LogicalStatusCodeKey].string,
//            yCoordinate = json[SearchResult.YCoordinateKey].number,
//            thoroughfareName = json[SearchResult.ThoroughfareNameKey].string,
//            address = json[SearchResult.AddressKey].string,
//            postTown = json[SearchResult.PostTownKey].string,
//            blpuStateDate = json[SearchResult.BlpuStateDateKey].string
//            else {
//                throw
//        }
//
//        self.init(
//            language: language,
//            lastUpdateDate: lastUpdateDate,
//            rpc: rpc,
//            buildingNumber: buildingNumber,
//            postcode: postcode,
//            uprn: uprn,
//            matchDescription: matchDescription,
//            entryDate: entryDate,
//            postalAddressCode: postalAddressCode,
//            localCustodianCode: Int(localCustodianCode),
//            status: status,
//            blpuStateCode: blpuStateCode,
//            organisationName: organisationName,
//            postalAddressCodeDescription: postalAddressCodeDescription,
//            classificationCodeDescription: classificationCodeDescription,
//            xCoordinate: Int(xCoordinate),
//            match: Float(match),
//            classificationCode: classificationCode,
//            topographyLayerToid: topographyLayerToid,
//            localCustodianCodeDescription: localCustodianCodeDescription,
//            blpuStateCodeDescription: blpuStateCodeDescription,
//            dependentLocality: dependentLocality,
//            logicalStatusCode: logicalStatusCode,
//            yCoordinate: Int(yCoordinate),
//            thoroughfareName: thoroughfareName,
//            address: address,
//            postTown: postTown,
//            blpuStateDate: blpuStateDate
//        )
//
//    }
//}