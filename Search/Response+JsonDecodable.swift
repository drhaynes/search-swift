//
//  Response+JsonDecodable.swift
//  Search
//
//  Created by David Haynes on 08/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation
import JSONCodable

//extension Response: JSONDecodable {
//    convenience public init(object: JSONObject) throws {
//        let decoder = JSONDecoder(object: object)
//        let headerJson = object[Response.HeaderKey]
////        guard let header = Header(json: headerJson) else {
////            return nil
////        }
////        let resultsJson = object[Response.ResultsKey]
////        guard let results = resultsJson.array?.flatMap(dpaFromJson) else {
////            return nil
////        }
//        self.init(results: results, header: header)
//    }
//}
