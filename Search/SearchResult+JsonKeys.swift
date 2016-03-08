//
//  Result+JsonKeys.swift
//  Search
//
//  Created by David Haynes on 08/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

extension SearchResult {
    // MARK: Declaration for string constants to be used to decode and also serialize.
    @nonobjc internal static let LanguageKey: String = "LANGUAGE"
    @nonobjc internal static let LastUpdateDateKey: String = "LAST_UPDATE_DATE"
    @nonobjc internal static let RpcKey: String = "RPC"
    @nonobjc internal static let BuildingNumberKey: String = "BUILDING_NUMBER"
    @nonobjc internal static let PostcodeKey: String = "POSTCODE"
    @nonobjc internal static let UprnKey: String = "UPRN"
    @nonobjc internal static let MatchDescriptionKey: String = "MATCH_DESCRIPTION"
    @nonobjc internal static let EntryDateKey: String = "ENTRY_DATE"
    @nonobjc internal static let PostalAddressCodeKey: String = "POSTAL_ADDRESS_CODE"
    @nonobjc internal static let LocalCustodianCodeKey: String = "LOCAL_CUSTODIAN_CODE"
    @nonobjc internal static let StatusKey: String = "STATUS"
    @nonobjc internal static let BlpuStateCodeKey: String = "BLPU_STATE_CODE"
    @nonobjc internal static let OrganisationNameKey: String = "ORGANISATION_NAME"
    @nonobjc internal static let PostalAddressCodeDescriptionKey: String = "POSTAL_ADDRESS_CODE_DESCRIPTION"
    @nonobjc internal static let ClassificationCodeDescriptionKey: String = "CLASSIFICATION_CODE_DESCRIPTION"
    @nonobjc internal static let XCoordinateKey: String = "X_COORDINATE"
    @nonobjc internal static let MatchKey: String = "MATCH"
    @nonobjc internal static let ClassificationCodeKey: String = "CLASSIFICATION_CODE"
    @nonobjc internal static let TopographyLayerToidKey: String = "TOPOGRAPHY_LAYER_TOID"
    @nonobjc internal static let LocalCustodianCodeDescriptionKey: String = "LOCAL_CUSTODIAN_CODE_DESCRIPTION"
    @nonobjc internal static let BlpuStateCodeDescriptionKey: String = "BLPU_STATE_CODE_DESCRIPTION"
    @nonobjc internal static let DependentLocalityKey: String = "DEPENDENT_LOCALITY"
    @nonobjc internal static let LogicalStatusCodeKey: String = "LOGICAL_STATUS_CODE"
    @nonobjc internal static let YCoordinateKey: String = "Y_COORDINATE"
    @nonobjc internal static let ThoroughfareNameKey: String = "THOROUGHFARE_NAME"
    @nonobjc internal static let AddressKey: String = "ADDRESS"
    @nonobjc internal static let PostTownKey: String = "POST_TOWN"
    @nonobjc internal static let BlpuStateDateKey: String = "BLPU_STATE_DATE"
}
