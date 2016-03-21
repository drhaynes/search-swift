//
//  SearchServiceTests.swift
//  Search
//
//  Created by David Haynes on 10/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
import Fetch
import OHHTTPStubs
import OSTransformation
@testable import Search

class PlacesSearchServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTheServiceIsConfiguredCorrectly() {
        let testApiKey = "test-key"
        let service = PlacesSearchService(apiKey: testApiKey)
        expect(service.apiKey).to(equal(testApiKey))
    }

    func testItSendsAFindRequestCorrectly() {
        let testApiKey = "test-key"
        let testQuery = "Ordnance Survey"
        let service = PlacesSearchService(apiKey: testApiKey)

        let expectation = expectationWithDescription("Request received")

        stub(stubFindHttpBlock(testApiKey, query: testQuery)) { (request) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(error: stubError())
        }

        service.find(testQuery) { (result) -> Void in
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(1.0, handler: nil)
        OHHTTPStubs.removeAllStubs()
    }

    func testItSendsANearestRequestCorrectly() {
        let testApiKey = "test-key"
        let testLocation = NSURLQueryItem(name: "point", value: "437293%20115515")
        let service = PlacesSearchService(apiKey: testApiKey)

        let expectation = expectationWithDescription("Request received")

        stub(stubPlacesHttpBlock(testApiKey, path: "nearest", queryItems: [testLocation])) { (request) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(error: stubError())
        }

        service.nearest(OSGridPoint(easting: 437293, northing: 115515)) { (result) -> Void in
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(1.0, handler: nil)
        OHHTTPStubs.removeAllStubs()
    }

    func stubFindHttpBlock(apiKey: String, query: String) -> OHHTTPStubsTestBlock {
        let match = isScheme("https") &&
            isHost("api.ordnancesurvey.co.uk") &&
            isPath("/places/v1/addresses/find") &&
            containsQueryItems([
                NSURLQueryItem(name: "key", value: apiKey),
                NSURLQueryItem(name: "query", value: query)
            ])
        return match
    }

    func stubPlacesHttpBlock(apiKey: String, path: String, queryItems: [NSURLQueryItem]) -> OHHTTPStubsTestBlock {
        let query = [NSURLQueryItem(name: "key", value: apiKey)] + queryItems
        let match = isScheme("https") &&
            isHost("api.ordnancesurvey.co.uk") &&
            isPath("/places/v1/addresses/\(path)") &&
            containsQueryItems(query)
        return match
    }

}
