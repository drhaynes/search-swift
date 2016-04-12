//
//  GazetteerEntry.swift
//  
//
//  Created by Dave Hardiman on 11/04/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import OSJSON

@objc(OSGazetteerEntry)
public class GazetteerEntry: NSObject, Decodable {

    // MARK: Properties
    public let id: String
    public let namesUri: String
    public let name1: String
    public let name1Lang: String?
    public let name2: String?
    public let name2Lang: String?
    public let type: String
    public let localType: String
    public let geometryX: Double
    public let geometryY: Double
    public let mostDetailViewRes: Int
    public let leastDetailViewRes: Int
    public let mbrXmin: Double
    public let mbrYmin: Double
    public let mbrXmax: Double
    public let mbrYmax: Double
    public let postcodeDistrict: String?
    public let postcodeDistrictUri: String?
    public let populatedPlace: String?
    public let populatedPlaceUri: String?
    public let populatedPlaceType: String?
    public let districtBorough: String?
    public let districtBoroughUri: String?
    public let districtBoroughType: String?
    public let countyUnitary: String?
    public let countyUnitaryUri: String?
    public let countyUnitaryType: String?
    public let region: String
    public let regionUri: String
    public let country: String
    public let countryUri: String
    public let relatedSpatialObject: String?
    public let sameAsGeonames: String?
    public let sameAsDbpedia: String?

    init(id: String, namesUri: String, name1: String, name1Lang: String?, name2: String?, name2Lang: String?, type: String, localType: String, geometryX: Double, geometryY: Double, mostDetailViewRes: Int, leastDetailViewRes: Int, mbrXmin: Double, mbrYmin: Double, mbrXmax: Double, mbrYmax: Double, postcodeDistrict: String?, postcodeDistrictUri: String?, populatedPlace: String?, populatedPlaceUri: String?, populatedPlaceType: String?, districtBorough: String?, districtBoroughUri: String?, districtBoroughType: String?, countyUnitary: String?, countyUnitaryUri: String?, countyUnitaryType: String?, region: String, regionUri: String, country: String, countryUri: String, relatedSpatialObject: String?, sameAsGeonames: String?, sameAsDbpedia: String?) {
        self.id = id
        self.namesUri = namesUri
        self.name1 = name1
        self.name1Lang = name1Lang
        self.name2 = name2
        self.name2Lang = name2Lang
        self.type = type
        self.localType = localType
        self.geometryX = geometryX
        self.geometryY = geometryY
        self.mostDetailViewRes = mostDetailViewRes
        self.leastDetailViewRes = leastDetailViewRes
        self.mbrXmin = mbrXmin
        self.mbrYmin = mbrYmin
        self.mbrXmax = mbrXmax
        self.mbrYmax = mbrYmax
        self.postcodeDistrict = postcodeDistrict
        self.postcodeDistrictUri = postcodeDistrictUri
        self.populatedPlace = populatedPlace
        self.populatedPlaceUri = populatedPlaceUri
        self.populatedPlaceType = populatedPlaceType
        self.districtBorough = districtBorough
        self.districtBoroughUri = districtBoroughUri
        self.districtBoroughType = districtBoroughType
        self.countyUnitary = countyUnitary
        self.countyUnitaryUri = countyUnitaryUri
        self.countyUnitaryType = countyUnitaryType
        self.region = region
        self.regionUri = regionUri
        self.country = country
        self.countryUri = countryUri
        self.relatedSpatialObject = relatedSpatialObject
        self.sameAsGeonames = sameAsGeonames
        self.sameAsDbpedia = sameAsDbpedia
    }

    //MARK: JSON initialiser
    convenience required public init?(json: JSON) {
        guard let gaz = json.jsonForKey(GazetteerEntry.GazetteerEntryKey),
            id = gaz.stringValueForKey(GazetteerEntry.IdKey),
            namesUri = gaz.stringValueForKey(GazetteerEntry.NamesUriKey),
            name1 = gaz.stringValueForKey(GazetteerEntry.Name1Key),
            type = gaz.stringValueForKey(GazetteerEntry.TypeKey),
            localType = gaz.stringValueForKey(GazetteerEntry.LocalTypeKey),
            region = gaz.stringValueForKey(GazetteerEntry.RegionKey),
            regionUri = gaz.stringValueForKey(GazetteerEntry.RegionUriKey),
            country = gaz.stringValueForKey(GazetteerEntry.CountryKey),
            countryUri = gaz.stringValueForKey(GazetteerEntry.CountryUriKey)
        else {
            return nil
        }

        let name1Lang = gaz.stringValueForKey(GazetteerEntry.Name1LangKey)
        let name2 = gaz.stringValueForKey(GazetteerEntry.Name2Key)
        let name2Lang = gaz.stringValueForKey(GazetteerEntry.Name2LangKey)
        let mostDetailViewRes = gaz.intValueForKey(GazetteerEntry.MostDetailViewResKey)
        let leastDetailViewRes = gaz.intValueForKey(GazetteerEntry.LeastDetailViewResKey)
        let geometryX = gaz.doubleValueForKey(GazetteerEntry.GeometryXKey)
        let geometryY = gaz.doubleValueForKey(GazetteerEntry.GeometryYKey)
        let mbrXmin = gaz.doubleValueForKey(GazetteerEntry.MbrXminKey)
        let mbrYmin = gaz.doubleValueForKey(GazetteerEntry.MbrYminKey)
        let mbrXmax = gaz.doubleValueForKey(GazetteerEntry.MbrXmaxKey)
        let mbrYmax = gaz.doubleValueForKey(GazetteerEntry.MbrYmaxKey)
        let postcodeDistrict = gaz.stringValueForKey(GazetteerEntry.PostcodeDistrictKey)
        let postcodeDistrictUri = gaz.stringValueForKey(GazetteerEntry.PostcodeDistrictUriKey)
        let populatedPlace = gaz.stringValueForKey(GazetteerEntry.PopulatedPlaceKey)
        let populatedPlaceUri = gaz.stringValueForKey(GazetteerEntry.PopulatedPlaceUriKey)
        let populatedPlaceType = gaz.stringValueForKey(GazetteerEntry.PopulatedPlaceTypeKey)
        let districtBorough = gaz.stringValueForKey(GazetteerEntry.DistrictBoroughKey)
        let districtBoroughUri = gaz.stringValueForKey(GazetteerEntry.DistrictBoroughUriKey)
        let districtBoroughType = gaz.stringValueForKey(GazetteerEntry.DistrictBoroughTypeKey)
        let countyUnitary = gaz.stringValueForKey(GazetteerEntry.CountyUnitaryKey)
        let countyUnitaryUri = gaz.stringValueForKey(GazetteerEntry.CountyUnitaryUriKey)
        let countyUnitaryType = gaz.stringValueForKey(GazetteerEntry.CountyUnitaryTypeKey)
        let relatedSpatialObject = gaz.stringValueForKey(GazetteerEntry.RelatedSpatialObjectKey)
        let sameAsGeonames = gaz.stringValueForKey(GazetteerEntry.SameAsGeonamesKey)
        let sameAsDbpedia = gaz.stringValueForKey(GazetteerEntry.SameAsDbpediaKey)

        self.init(
            id: id,
            namesUri: namesUri,
            name1: name1,
            name1Lang: name1Lang,
            name2: name2,
            name2Lang: name2Lang,
            type: type,
            localType: localType,
            geometryX: geometryX,
            geometryY: geometryY,
            mostDetailViewRes: mostDetailViewRes,
            leastDetailViewRes: leastDetailViewRes,
            mbrXmin: mbrXmin,
            mbrYmin: mbrYmin,
            mbrXmax: mbrXmax,
            mbrYmax: mbrYmax,
            postcodeDistrict: postcodeDistrict,
            postcodeDistrictUri: postcodeDistrictUri,
            populatedPlace: populatedPlace,
            populatedPlaceUri: populatedPlaceUri,
            populatedPlaceType: populatedPlaceType,
            districtBorough: districtBorough,
            districtBoroughUri: districtBoroughUri,
            districtBoroughType: districtBoroughType,
            countyUnitary: countyUnitary,
            countyUnitaryUri: countyUnitaryUri,
            countyUnitaryType: countyUnitaryType,
            region: region,
            regionUri: regionUri,
            country: country,
            countryUri: countryUri,
            relatedSpatialObject: relatedSpatialObject,
            sameAsGeonames: sameAsGeonames,
            sameAsDbpedia: sameAsDbpedia
        )
    }
}

extension GazetteerEntry {
    // MARK: Declaration for string constants to be used to decode and also serialize.
    @nonobjc internal static let GazetteerEntryKey = "GAZETTEER_ENTRY"
    @nonobjc internal static let GeometryYKey = "GEOMETRY_Y"
    @nonobjc internal static let CountryKey = "COUNTRY"
    @nonobjc internal static let CountyUnitaryKey = "COUNTY_UNITARY"
    @nonobjc internal static let MbrYmaxKey = "MBR_YMAX"
    @nonobjc internal static let Name1Key = "NAME1"
    @nonobjc internal static let IdKey = "ID"
    @nonobjc internal static let CountyUnitaryTypeKey = "COUNTY_UNITARY_TYPE"
    @nonobjc internal static let TypeKey = "TYPE"
    @nonobjc internal static let PopulatedPlaceTypeKey = "POPULATED_PLACE_TYPE"
    @nonobjc internal static let CountyUnitaryUriKey = "COUNTY_UNITARY_URI"
    @nonobjc internal static let MbrYminKey = "MBR_YMIN"
    @nonobjc internal static let NamesUriKey = "NAMES_URI"
    @nonobjc internal static let RegionKey = "REGION"
    @nonobjc internal static let GeometryXKey = "GEOMETRY_X"
    @nonobjc internal static let MbrXminKey = "MBR_XMIN"
    @nonobjc internal static let LeastDetailViewResKey = "LEAST_DETAIL_VIEW_RES"
    @nonobjc internal static let MbrXmaxKey = "MBR_XMAX"
    @nonobjc internal static let PopulatedPlaceKey = "POPULATED_PLACE"
    @nonobjc internal static let PostcodeDistrictUriKey = "POSTCODE_DISTRICT_URI"
    @nonobjc internal static let RegionUriKey = "REGION_URI"
    @nonobjc internal static let CountryUriKey = "COUNTRY_URI"
    @nonobjc internal static let LocalTypeKey = "LOCAL_TYPE"
    @nonobjc internal static let PopulatedPlaceUriKey = "POPULATED_PLACE_URI"
    @nonobjc internal static let MostDetailViewResKey = "MOST_DETAIL_VIEW_RES"
    @nonobjc internal static let PostcodeDistrictKey = "POSTCODE_DISTRICT"
    @nonobjc internal static let Name1LangKey = "NAME1_LANG"
    @nonobjc internal static let Name2Key = "NAME2"
    @nonobjc internal static let Name2LangKey = "NAME2_LANG"
    @nonobjc internal static let DistrictBoroughKey = "DISTRICT_BOROUGH"
    @nonobjc internal static let DistrictBoroughUriKey = "DISTRICT_BOROUGH_URI"
    @nonobjc internal static let DistrictBoroughTypeKey = "DISTRICT_BOROUGH_TYPE"
    @nonobjc internal static let RelatedSpatialObjectKey = "RELATED_SPATIAL_OBJECT"
    @nonobjc internal static let SameAsGeonamesKey = "SAME_AS_GEONAMES"
    @nonobjc internal static let SameAsDbpediaKey = "SAME_AS_DBPEDIA"
}
