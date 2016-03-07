//
//  SearchTests.swift
//  SearchTests
//
//  Created by David Haynes on 25/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
@testable import Search

class ResponseParsingTests: XCTestCase {

    func testItIsPossibleToParseAResponse() {
        let data = NSData(contentsOfURL: Bundle().URLForResource("test-response", withExtension: "json")!)!
        let result = Response.parse(fromData: data, withStatus: 200)
        switch result {
        case .Success(let response):
            validateResponse(response)
        default:
            fail("Unexpected result")
        }
    }

    private func validateResponse(response: Response) {
        validateHeader(response.header)
        validateResults(response.results)
    }

    private func validateHeader(header: Header) {
        expect(header.uri).to(equal("https://api.ordnancesurvey.co.uk/places/v1/addresses/find?query=Ordnance%20Survey%2C%20Adanac%20Drive%2C%20SO16&maxresults=1"))
        expect(header.query).to(equal("query=Ordnance Survey, Adanac Drive, SO16"))
        expect(header.offset).to(equal(0))
        expect(header.totalresults).to(equal(1646227))
        expect(header.format).to(equal("JSON"))
        expect(header.dataset).to(equal("DPA"))
        expect(header.lr).to(equal("EN,CY"))
        expect(header.maxresults).to(equal(1))
        expect(header.matchprecision).to(equal(1))
        expect(header.epoch).to(equal("37"))
        expect(header.outputSrs).to(equal("EPSG:27700"))
    }

    private func validateResults(results: [Dpa]) {
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
        expect(result.xCoordinate).to(equal(437318))
        expect(result.yCoordinate).to(equal(115539))
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

}
