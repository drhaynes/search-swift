//
//  SearchTests.swift
//  SearchTests
//
//  Created by David Haynes on 25/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
import OSAPIResponse
@testable import Search

class ResponseParsingTests: XCTestCase {

    func testItIsPossibleToParseAResponse() {
        let data = NSData(contentsOfURL: Bundle().URLForResource("test-response", withExtension: "json")!)!
        let result = SearchResponse.parse(fromData: data, withStatus: 200)
        switch result {
        case .Success(let response):
            validateResponse(response)
        default:
            fail("Unexpected result")
        }
    }

    private func validateResponse(response: SearchResponse) {
        validateResults(response.results)
    }

    private func validateResults(results: [SearchResult]) {
        expect(results.count).to(equal(1))
        expect(results.first).toNot(beNil())
        let result = results.first!
        expect(result.language).to(equal("EN"))
        expect(result.uprn).to(equal("200010019924"))
        expect(result.address).to(equal("ORDNANCE SURVEY, 4, ADANAC DRIVE, NURSLING, SOUTHAMPTON, SO16 0AS"))
        expect(result.organisationName).to(equal("ORDNANCE SURVEY"))
        expect(result.buildingNumber).to(equal("4"))
        expect(result.thoroughfareName).to(equal("ADANAC DRIVE"))
        expect(result.dependentLocality).to(equal("NURSLING"))
        expect(result.postTown).to(equal("SOUTHAMPTON"))
        expect(result.postcode).to(equal("SO16 0AS"))
        expect(result.rpc).to(equal("2"))
        expect(result.xCoordinate).to(equal(437318.0))
        expect(result.yCoordinate).to(equal(115539.0))
        expect(result.status).to(equal("APPROVED"))
        expect(result.logicalStatusCode).to(equal("1"))
        expect(result.classificationCode).to(equal("CO01GV"))
        expect(result.classificationCodeDescription).to(equal("Central Government Service"))
        expect(result.localCustodianCode).to(equal(1760))
        expect(result.localCustodianCodeDescription).to(equal("TEST VALLEY"))
        expect(result.postalAddressCode).to(equal("S"))
        expect(result.postalAddressCodeDescription).to(equal("A single address"))
        expect(result.blpuStateCode).to(equal("2"))
        expect(result.blpuStateCodeDescription).to(equal("In use"))
        expect(result.topographyLayerToid).to(equal("osgb1000002682081995"))
        expect(result.lastUpdateDate).to(equal("01/09/2010"))
        expect(result.entryDate).to(equal("01/09/2010"))
        expect(result.blpuStateDate).to(equal("01/09/2010"))
        expect(result.match).to(equal(0.6))
        expect(result.matchDescription).to(equal("NO MATCH"))
    }

    func testNoDataReturnsCorrectError() {
        let data: NSData? = nil
        let result = SearchResponse.parse(fromData: data, withStatus: 200)
        switch result {
        case .Failure(let error as ResponseError):
            switch error {
            case .NoDataReceived:
                break
            default:
                fail("No data in response should raise correct error.")
            }
        default:
            fail("No data in response should raise an error.")
        }
    }

    func testNon200HttpResponseReturnsCorrectError() {
        let data: NSData? = NSData(contentsOfURL: Bundle().URLForResource("test-response", withExtension: "json")!)!
        let result = SearchResponse.parse(fromData: data, withStatus: 404)
        switch result {
        case .Failure(let error as ResponseError):
            switch error {
            case .NotFound:
                break
            default:
                fail("Non 200 response should raise correct error.")
            }
        default:
            fail("Non 200 response should raise an error.")
        }
    }

    func testInvalidHeaderJsonReturnsDeserialiseError() {
        let data: NSData? = NSData(contentsOfURL: Bundle().URLForResource("test-response-bad-header", withExtension: "json")!)!
        let result = SearchResponse.parse(fromData: data, withStatus: 200)
        switch result {
        case .Failure(let error as ResponseError):
            switch error {
            case .FailedToDeserialiseJSON:
                break
            default:
                fail("Invalid header JSON should raise correct error.")
            }
        default:
            fail("Invalid header JSON should raise an error.")
        }
    }

    func testInvalidResultsJsonReturnsDeserialiseError() {
        let data: NSData? = NSData(contentsOfURL: Bundle().URLForResource("test-response-bad-results", withExtension: "json")!)!
        let result = SearchResponse.parse(fromData: data, withStatus: 200)
        switch result {
        case .Failure(let error as ResponseError):
            switch error {
            case .FailedToDeserialiseJSON:
                break
            default:
                fail("Invalid results JSON should raise correct error.")
            }
        default:
            fail("Invalid results JSON should raise an error.")
        }
    }

    func testInvalidJsonReturnsParseError() {
        let data: NSData? = NSData(base64EncodedString: "<!:@", options: .IgnoreUnknownCharacters)
        let result = SearchResponse.parse(fromData: data, withStatus: 200)
        switch result {
        case .Failure(let error as ResponseError):
            switch error {
            case .FailedToParseJSON:
                break
            default:
                fail("Invalid JSON should raise correct error.")
            }
        default:
            fail("Invalid JSON should raise an error.")
        }
    }

    func testResponseWithOptionalFieldsParsesCorrectly() {
        let data: NSData? = NSData(contentsOfURL: Bundle().URLForResource("test-response-optional-fields", withExtension: "json")!)!
        let result = SearchResponse.parse(fromData: data, withStatus: 200)
        switch result {
        case .Success(let response):
            expect(response.results.count).to(equal(3))
        default:
            fail("Unexpected result")
        }

    }

    func testItIsPossibleToParseAnOpenNamesResponse() {
        let data = NSData(contentsOfURL: Bundle().URLForResource("opennamesresponse", withExtension: "json")!)!
        let result = OpenNamesResponse.parse(fromData: data, withStatus: 200)
        switch result {
        case .Success(let response):
            expect(response.results).to(haveCount(1))
            let result = response.results.first!
            expect(result.id).to(equal("osgb4000000023852685"))
            expect(result.namesUri).to(equal("http://data.ordnancesurvey.co.uk/id/osgb4000000023852685"))
            expect(result.name1).to(equal("Adanac Drive"))
            expect(result.type).to(equal("transportNetwork"))
            expect(result.localType).to(equal("Named Road"))
            expect(result.geometryX).to(equal(437283.534))
            expect(result.geometryY).to(equal(115391.881))
            expect(result.mostDetailViewRes).to(equal(4000))
            expect(result.leastDetailViewRes).to(equal(20000))
            expect(result.mbrXmin).to(equal(437157.31))
            expect(result.mbrYmin).to(equal(115103.252))
            expect(result.mbrXmax).to(equal(437400.826))
            expect(result.mbrYmax).to(equal(115647.684))
            expect(result.postcodeDistrict).to(equal("SO16"))
            expect(result.postcodeDistrictUri).to(equal("http://data.ordnancesurvey.co.uk/id/postcodedistrict/SO16"))
            expect(result.populatedPlace).to(equal("Nursling"))
            expect(result.populatedPlaceUri).to(equal("http://data.ordnancesurvey.co.uk/id/4000000074566646"))
            expect(result.districtBorough).to(equal("Test Valley"))
            expect(result.districtBoroughUri).to(equal("http://data.ordnancesurvey.co.uk/id/7000000000043511"))
            expect(result.districtBoroughType).to(equal("http://data.ordnancesurvey.co.uk/ontology/admingeo/District"))
            expect(result.countyUnitary).to(equal("Hampshire"))
            expect(result.countyUnitaryUri).to(equal("http://data.ordnancesurvey.co.uk/id/7000000000017765"))
            expect(result.countyUnitaryType).to(equal("http://data.ordnancesurvey.co.uk/ontology/admingeo/County"))
            expect(result.region).to(equal("South East"))
            expect(result.regionUri).to(equal("http://data.ordnancesurvey.co.uk/id/7000000000041421"))
            expect(result.country).to(equal("England"))
            expect(result.countryUri).to(equal("http://data.ordnancesurvey.co.uk/id/country/england"))
        default:
            fail("Unexpected result")
        }

    }
}
