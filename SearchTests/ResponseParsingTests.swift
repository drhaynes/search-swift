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
        // TODO: validateResults(response.results)
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

    private func validateResults(results: Results) {
        fail("Not yet implemented")
    }

}
