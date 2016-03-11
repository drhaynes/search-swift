//
//  Header.swift
//
//  Created by Dave Hardiman on 11/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import OSJSON

public class Header: NSObject {

    // MARK: Properties
    public let matchprecision: Int
    public let lr: String
    public let dataset: String
    public let maxresults: Int
    public let totalresults: Int
    public let uri: String
    public let outputSrs: String
    public let epoch: String
    public let offset: Int
    public let format: String
    public let query: String


    init(matchprecision: Int, lr: String, dataset: String, maxresults: Int, totalresults: Int, uri: String, outputSrs: String, epoch: String, offset: Int, format: String, query: String) {
        self.matchprecision = matchprecision
        self.lr = lr
        self.dataset = dataset
        self.maxresults = maxresults
        self.totalresults = totalresults
        self.uri = uri
        self.outputSrs = outputSrs
        self.epoch = epoch
        self.offset = offset
        self.format = format
        self.query = query
    }







    //MARK: JSON initialiser
    convenience init?(json: JSON) {
        guard let
lr = json.stringValueForKey(Header.LrKey),        
dataset = json.stringValueForKey(Header.DatasetKey),        
uri = json.stringValueForKey(Header.UriKey),
outputSrs = json.stringValueForKey(Header.OutputSrsKey),        
epoch = json.stringValueForKey(Header.EpochKey),
format = json.stringValueForKey(Header.FormatKey),        
query = json.stringValueForKey(Header.QueryKey)
        else {
            return nil
        }
        let matchprecision = json.intValueForKey(Header.MatchprecisionKey)
        let maxresults = json.intValueForKey(Header.MaxresultsKey)
        let totalresults = json.intValueForKey(Header.TotalresultsKey)
        let offset = json.intValueForKey(Header.OffsetKey)

        self.init(
            matchprecision: Int(matchprecision),            
lr: lr,            
dataset: dataset,            
maxresults: Int(maxresults),            
totalresults: Int(totalresults),            
uri: uri,            
outputSrs: outputSrs,            
epoch: epoch,            
offset: Int(offset),            
format: format,            
query: query
        )
    }
}

extension Header {
    // MARK: Declaration for string constants to be used to decode and also serialize.
    @nonobjc internal static let MatchprecisionKey: String = "matchprecision"
    @nonobjc internal static let LrKey: String = "lr"
    @nonobjc internal static let DatasetKey: String = "dataset"
    @nonobjc internal static let MaxresultsKey: String = "maxresults"
    @nonobjc internal static let TotalresultsKey: String = "totalresults"
    @nonobjc internal static let UriKey: String = "uri"
    @nonobjc internal static let OutputSrsKey: String = "output_srs"
    @nonobjc internal static let EpochKey: String = "epoch"
    @nonobjc internal static let OffsetKey: String = "offset"
    @nonobjc internal static let FormatKey: String = "format"
    @nonobjc internal static let QueryKey: String = "query"

}
