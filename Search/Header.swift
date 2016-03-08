//
//  Header.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import JSONLib
import JSONCodable

public class Header: NSObject, JSONDecodable {

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

    convenience init?(json: JSON) {
        guard let uri = json[Header.UriKey].string,
            lr = json[Header.LrKey].string,
            dataset = json[Header.DatasetKey].string,
            outputSrs = json[Header.OutputSrsKey].string,
            epoch = json[Header.EpochKey].string,
            format = json[Header.FormatKey].string,
            query = json[Header.QueryKey].string,
            matchPrecision =  json[Header.MatchprecisionKey].number,
            maxresults = json[Header.MaxresultsKey].number,
            totalresults = json[Header.TotalresultsKey].number,
            offset = json[Header.OffsetKey].number
            else {
                return nil
        }

        self.init(
            matchprecision: Int(matchPrecision),
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

    convenience public required init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        let matchprecision: Int = try decoder.decode(Header.MatchprecisionKey)
        let lr: String = try decoder.decode(Header.LrKey)
        let dataset: String = try decoder.decode(Header.DatasetKey)
        let maxresults: Int = try decoder.decode(Header.MaxresultsKey)
        let totalresults: Int = try decoder.decode(Header.TotalresultsKey)
        let uri: String = try decoder.decode(Header.UriKey)
        let outputSrs: String = try decoder.decode(Header.OutputSrsKey)
        let epoch: String = try decoder.decode(Header.EpochKey)
        let offset: Int = try decoder.decode(Header.OffsetKey)
        let format: String = try decoder.decode(Header.FormatKey)
        let query: String =  try decoder.decode(Header.QueryKey)

        self.init(
            matchprecision: matchprecision,
            lr: lr,
            dataset: dataset,
            maxresults: maxresults,
            totalresults: totalresults,
            uri: uri,
            outputSrs: outputSrs,
            epoch: epoch,
            offset: offset,
            format: format,
            query: query
        )
    }
}
