//
//  JsonPerformanceTests.swift
//  Search
//
//  Created by David Haynes on 08/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
import JSONLib
import JSONCodable
import Gloss
@testable import Search

class JsonPerformanceTests: XCTestCase {

    func testRawNSJSONPerformance() {
        measureBlock {
            let data = NSData(contentsOfURL: Bundle().URLForResource("100-results", withExtension: "json")!)!
            do {
                let _ = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            } catch {
                fail("Unexpected error")
            }
        }
    }

    func testJSONLibPerformance() {
        measureBlock {
            let data = NSData(contentsOfURL: Bundle().URLForResource("100-results", withExtension: "json")!)!
            let result = Response.parse(fromData: data, withStatus: 200)
            switch result {
            case .Success(_):
                break
            default:
                fail("Unexpected result")
            }
        }
    }

    func testOSJSONPerformance() {
        measureBlock {
            let data = NSData(contentsOfURL: Bundle().URLForResource("100-results", withExtension: "json")!)!
            let result = Response.parse(fromData: data, withStatus: 666)
            switch result {
            case .Success(_):
                break
            default:
                fail("Unexpected result")
            }
        }
    }

    func testJSONCodablePerformance() {
        measureBlock {
            let data = NSData(contentsOfURL: Bundle().URLForResource("100-results", withExtension: "json")!)!
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                do {
                    let _ = try Response(object: json as! JSONObject)
                } catch {
                    fail("Unexpected error decoding JSON: \(error)")
                }
            } catch {
                fail("Unexpected error parsing JSON")
            }
        }
    }

    func testGlossyPerformance() {
        measureBlock {
            let data = NSData(contentsOfURL: Bundle().URLForResource("100-results", withExtension: "json")!)!
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! Gloss.JSON
                let _ = Response(json: json)
            } catch {
                fail("Unexpected error parsing JSON")
            }
        }
    }
    
}
