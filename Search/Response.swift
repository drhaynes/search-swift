//
//  Response.swift
//
//  Created by Dave Hardiman on 11/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import OSJSON

public final class Response: NSObject {

    // MARK: Properties
    public let results: [SearchResult]
    public let header: Header


    init(results: [SearchResult], header: Header) {
        self.results = results
        self.header = header
    }







    //MARK: JSON initialiser
    convenience init?(json: JSON) {
        guard let results = json.jsonArrayForKey(Response.ResultsKey)?.flatMap({ SearchResult.init(json: $0) }),
headerJSON = json.jsonForKey(Response.HeaderKey),        
header = Header(json: headerJSON)
        else {
            return nil
        }
        self.init(
            results: results,            
header: header
        )
    }
}

extension Response {
    // MARK: Declaration for string constants to be used to decode and also serialize.
    @nonobjc internal static let ResultsKey: String = "results"
    @nonobjc internal static let HeaderKey: String = "header"

}
