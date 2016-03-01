//
//  Dpa.swift
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

    // MARK: Properties
	public var language: String?
	public var lastUpdateDate: String?
	public var rpc: String?
	public var buildingNumber: String?
	public var postcode: String?
	public var uprn: String?
	public var matchDescription: String?
	public var entryDate: String?
	public var postalAddressCode: String?
	public var localCustodianCode: Int?
	public var status: String?
	public var blpuStateCode: String?
	public var organisationName: String?
	public var postalAddressCodeDescription: String?
	public var classificationCodeDescription: String?
	public var xCoordinate: Int?
	public var match: Float?
	public var classificationCode: String?
	public var topographyLayerToid: String?
	public var localCustodianCodeDescription: String?
	public var blpuStateCodeDescription: String?
	public var dependentLocality: String?
	public var logicalStatusCode: String?
	public var yCoordinate: Int?
	public var thoroughfareName: String?
	public var address: String?
	public var postTown: String?
	public var blpuStateDate: String?

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if language != nil {
			dictionary.updateValue(language!, forKey: kDpaLanguageKey)
		}
		if lastUpdateDate != nil {
			dictionary.updateValue(lastUpdateDate!, forKey: kDpaLastUpdateDateKey)
		}
		if rpc != nil {
			dictionary.updateValue(rpc!, forKey: kDpaRpcKey)
		}
		if buildingNumber != nil {
			dictionary.updateValue(buildingNumber!, forKey: kDpaBuildingNumberKey)
		}
		if postcode != nil {
			dictionary.updateValue(postcode!, forKey: kDpaPostcodeKey)
		}
		if uprn != nil {
			dictionary.updateValue(uprn!, forKey: kDpaUprnKey)
		}
		if matchDescription != nil {
			dictionary.updateValue(matchDescription!, forKey: kDpaMatchDescriptionKey)
		}
		if entryDate != nil {
			dictionary.updateValue(entryDate!, forKey: kDpaEntryDateKey)
		}
		if postalAddressCode != nil {
			dictionary.updateValue(postalAddressCode!, forKey: kDpaPostalAddressCodeKey)
		}
		if localCustodianCode != nil {
			dictionary.updateValue(localCustodianCode!, forKey: kDpaLocalCustodianCodeKey)
		}
		if status != nil {
			dictionary.updateValue(status!, forKey: kDpaStatusKey)
		}
		if blpuStateCode != nil {
			dictionary.updateValue(blpuStateCode!, forKey: kDpaBlpuStateCodeKey)
		}
		if organisationName != nil {
			dictionary.updateValue(organisationName!, forKey: kDpaOrganisationNameKey)
		}
		if postalAddressCodeDescription != nil {
			dictionary.updateValue(postalAddressCodeDescription!, forKey: kDpaPostalAddressCodeDescriptionKey)
		}
		if classificationCodeDescription != nil {
			dictionary.updateValue(classificationCodeDescription!, forKey: kDpaClassificationCodeDescriptionKey)
		}
		if xCoordinate != nil {
			dictionary.updateValue(xCoordinate!, forKey: kDpaXCoordinateKey)
		}
		if match != nil {
			dictionary.updateValue(match!, forKey: kDpaMatchKey)
		}
		if classificationCode != nil {
			dictionary.updateValue(classificationCode!, forKey: kDpaClassificationCodeKey)
		}
		if topographyLayerToid != nil {
			dictionary.updateValue(topographyLayerToid!, forKey: kDpaTopographyLayerToidKey)
		}
		if localCustodianCodeDescription != nil {
			dictionary.updateValue(localCustodianCodeDescription!, forKey: kDpaLocalCustodianCodeDescriptionKey)
		}
		if blpuStateCodeDescription != nil {
			dictionary.updateValue(blpuStateCodeDescription!, forKey: kDpaBlpuStateCodeDescriptionKey)
		}
		if dependentLocality != nil {
			dictionary.updateValue(dependentLocality!, forKey: kDpaDependentLocalityKey)
		}
		if logicalStatusCode != nil {
			dictionary.updateValue(logicalStatusCode!, forKey: kDpaLogicalStatusCodeKey)
		}
		if yCoordinate != nil {
			dictionary.updateValue(yCoordinate!, forKey: kDpaYCoordinateKey)
		}
		if thoroughfareName != nil {
			dictionary.updateValue(thoroughfareName!, forKey: kDpaThoroughfareNameKey)
		}
		if address != nil {
			dictionary.updateValue(address!, forKey: kDpaAddressKey)
		}
		if postTown != nil {
			dictionary.updateValue(postTown!, forKey: kDpaPostTownKey)
		}
		if blpuStateDate != nil {
			dictionary.updateValue(blpuStateDate!, forKey: kDpaBlpuStateDateKey)
		}

        return dictionary
    }

}
