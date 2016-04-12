//
//  OSOpenNamesSearchServiceTests.swift
//  Search
//
//  Created by Dave Hardiman on 12/04/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
import Fetch
import OSTransformation
import OSAPIResponse
@testable import Search

extension OSGridRect: Equatable {}

public func ==(lhs: OSGridRect, rhs: OSGridRect) -> Bool {
    return OSGridRectEqualToRect(lhs, rhs)
}

class OSOpenNamesSearchServiceTests: XCTestCase {

    func testItHasABackingSearchService() {
        let osService = OSOpenNamesSearchService(apiKey: "test")
        guard let searchService = osService.searchService as? OpenNamesSearchService else {
            fail("Expected a search service")
            return
        }
        expect(searchService.apiKey).to(equal("test"))
    }

    class MockSearchService: OpenNamesService {
        var query: String?
        var boundingBox: OSGridRect?
        var completionHandler: (Result<OpenNamesResponse> -> Void)?
        var location: OSGridPoint?

        func find(query: String, completion: (Result<OpenNamesResponse> -> Void)) {
            self.query = query
            self.completionHandler = completion
        }

        func find(query: String, boundingBox: OSGridRect, completion: (Result<OpenNamesResponse> -> Void)) {
            self.query = query
            self.boundingBox = boundingBox
            self.completionHandler = completion
        }

        func nearest(location: OSGridPoint, completion: (Result<OpenNamesResponse> -> Void)) {
            self.location = location
            self.completionHandler = completion
        }
    }

    func testTheServiceCallsTheUnderlyingService() {
        let mockService = MockSearchService()
        let osService = OSOpenNamesSearchService(apiKey: "test")
        osService.searchService = mockService
        osService.find("testQuery", completion: { (result) in })
        expect(mockService.query).to(equal("testQuery"))
        expect(mockService.completionHandler).notTo(beNil())
    }

    func testTheServiceCallsTheUnderlyingServiceForBoundingBoxSearch() {
        let mockService = MockSearchService()
        let osService = OSOpenNamesSearchService(apiKey: "test")
        osService.searchService = mockService
        let boundingBox = OSGridRect(originSW: OSGridPoint(easting: 0, northing: 0), size: OSGridSize(width: 100, height: 100))
        osService.find("testQuery", boundingBox: boundingBox, completion: { (result) in })
        expect(mockService.query).to(equal("testQuery"))
        expect(mockService.boundingBox).to(equal(boundingBox))
        expect(mockService.completionHandler).notTo(beNil())
    }

    func testNearestCallsTheUnderlyingService() {
        let mockService = MockSearchService()
        let osService = OSOpenNamesSearchService(apiKey: "test")
        osService.searchService = mockService
        osService.nearest(OSGridPoint(easting: 1234, northing: 5678), completion: { _ in })
        expect(OSGridPointEqualToPoint(mockService.location!, OSGridPoint(easting: 1234, northing: 5678))).to(beTrue())
        expect(mockService.completionHandler).notTo(beNil())
    }

    func testASuccesfulSearchResponseIsReturned() {
        let data = NSData(contentsOfURL: Bundle().URLForResource("opennamesresponse", withExtension: "json")!)!
        let result = OpenNamesResponse.parse(fromData: data, withStatus: 200)
        let mockService = MockSearchService()
        let osService = OSOpenNamesSearchService(apiKey: "test")
        osService.searchService = mockService
        var receivedResponse: OpenNamesResponse?

        osService.find("test") { (response, error) in
            receivedResponse = response
        }
        mockService.completionHandler?(result)
        expect(receivedResponse).notTo(beNil())
    }

    func testAnNSErrorIsReturned() {
        let expectedError = NSError(domain: "test.domain", code: 123, userInfo: nil)
        let response = Result<OpenNamesResponse>.Failure(expectedError)
        performErrorTestScenario(response, expectedError: expectedError)
    }

    func testAnNSErrorIsReturnedForNearest() {
        let expectedError = NSError(domain: "test.domain", code: 123, userInfo: nil)
        let result = Result<OpenNamesResponse>.Failure(expectedError)

        let mockService = MockSearchService()
        let osService = OSOpenNamesSearchService(apiKey: "test")
        osService.searchService = mockService
        var receivedError: NSError?

        osService.nearest(OSGridPoint(easting: 1234, northing: 5678)) { (results, error) in
            receivedError = error
        }
        mockService.completionHandler?(result)
        expect(receivedError).to(equal(expectedError))
    }

    func testSearchServiceErrorsAreTranslatedCorrectly() {
        let errorCases = [
            ResponseError.FailedToDeserialiseJSON,
            ResponseError.FailedToParseJSON,
            ResponseError.NoDataReceived,
            ResponseError.UnknownError
        ]
        errorCases.forEach { error in
            let expectedError = error.toNSError()
            let result = Result<OpenNamesResponse>.Failure(error)
            performErrorTestScenario(result, expectedError: expectedError)
        }
    }

    func testSearchServiceErrorsWithMessagesAreTranslatedCorrectly() {
        let errorCases = [
            ResponseError.BadRequest("test description"),
            ResponseError.ServerError("test description"),
            ResponseError.Unauthorised("unauthorised"),
        ]
        errorCases.forEach { error in
            let expectedError = error.toNSError()
            let result = Result<OpenNamesResponse>.Failure(error)
            performErrorTestScenario(result, expectedError: expectedError)
        }
    }

    func performErrorTestScenario(result: Result<OpenNamesResponse>, expectedError: NSError) {
        let mockService = MockSearchService()
        let osService = OSOpenNamesSearchService(apiKey: "test")
        osService.searchService = mockService
        var receivedError: NSError?

        osService.find("test") { (results, error) in
            receivedError = error
        }
        mockService.completionHandler?(result)
        expect(receivedError).to(equal(expectedError))
    }

}
