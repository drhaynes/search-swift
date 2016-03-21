//
//  OSPlacesSearchServiceTests.swift
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
import Fetch
import OSTransformation
@testable import Search

class OSPlacesSearchServiceTests: XCTestCase {

    func testItHasABackingSearchService() {
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        guard let searchService = osPlacesService.searchService as? PlacesSearchService else {
            fail("Incorrect search service type")
            return
        }
        expect(searchService.apiKey).to(equal("test"))
    }

    class MockSearchService: Searchable {
        var query: String?
        var completionHandler: (Result<Response> -> Void)?
        var location: OSGridPoint?

        func find(query: String, completion: (Result<Response> -> Void)) {
            self.query = query
            self.completionHandler = completion
        }

        func nearest(location: OSGridPoint, completion: (Result<Response> -> Void)) {
            self.location = location
            self.completionHandler = completion
        }
    }

    func testTheServiceCallsTheUnderlyingService() {
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        osPlacesService.find("testQuery", completion: { (result) in })
        expect(mockService.query).to(equal("testQuery"))
        expect(mockService.completionHandler).notTo(beNil())
    }

    func testNearestCallsTheUnderlyingService() {
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        osPlacesService.nearest(OSGridPoint(easting: 1234, northing: 5678), completion: { _ in })
        expect(OSGridPointEqualToPoint(mockService.location!, OSGridPoint(easting: 1234, northing: 5678))).to(beTrue())
        expect(mockService.completionHandler).notTo(beNil())
    }

    func testASuccesfulResponseIsReturned() {
        let data = NSData(contentsOfURL: Bundle().URLForResource("test-response", withExtension: "json")!)!
        let result = Response.parse(fromData: data, withStatus: 200)
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        var receivedResponse: Response?

        osPlacesService.find("test") { (response, error) in
            receivedResponse = response
        }
        mockService.completionHandler?(result)
        expect(receivedResponse).notTo(beNil())
    }

    func testAnNSErrorIsReturned() {
        let expectedError = NSError(domain: "test.domain", code: 123, userInfo: nil)
        let response = Result<Response>.Failure(expectedError)
        performErrorTestScenario(response, expectedError: expectedError)
    }

    func testSearchServiceErrorsAreTranslatedCorrectly() {
        let errorCases = [
            SearchError.FailedToDeserialiseJSON,
            SearchError.FailedToParseJSON,
            SearchError.NoDataReceived,
            SearchError.Unauthorised,
            SearchError.UnknownError
        ]
        errorCases.forEach { error in
            let expectedError = NSError(domain: OSSearchErrorDomain, code: error.rawValue(), userInfo: nil)
            let result = Result<Response>.Failure(error)
            performErrorTestScenario(result, expectedError: expectedError)
        }
    }

    func testSearchServiceErrorsWithMessagesAreTranslatedCorrectly() {
        let errorCases = [
            SearchError.BadRequest("test description"),
            SearchError.ServerError("test description")
        ]
        errorCases.forEach { error in
            let expectedError = NSError(domain: OSSearchErrorDomain, code: error.rawValue(), userInfo: [ NSLocalizedDescriptionKey: "test description" ])
            let result = Result<Response>.Failure(error)
            performErrorTestScenario(result, expectedError: expectedError)
        }
    }

    func performErrorTestScenario(result: Result<Response>, expectedError: NSError) {
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        var receivedError: NSError?

        osPlacesService.find("test") { (results, error) in
            receivedError = error
        }
        mockService.completionHandler?(result)
        expect(receivedError).to(equal(expectedError))
    }

}
