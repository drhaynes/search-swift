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
import Gloss

public class Header: NSObject, JSONDecodable, Gloss.Decodable {

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

    convenience init?(jsonDict: [String: AnyObject]) {
        guard let uri = jsonDict[Header.UriKey] as? String,
            lr = jsonDict[Header.LrKey] as? String,
            dataset = jsonDict[Header.DatasetKey] as? String,
            outputSrs = jsonDict[Header.OutputSrsKey] as? String,
            epoch = jsonDict[Header.EpochKey] as? String,
            format = jsonDict[Header.FormatKey] as? String,
            query = jsonDict[Header.QueryKey] as? String,
            matchPrecision =  jsonDict[Header.MatchprecisionKey] as? Int,
            maxresults = jsonDict[Header.MaxresultsKey] as? Int,
            totalresults = jsonDict[Header.TotalresultsKey] as? Int,
            offset = jsonDict[Header.OffsetKey] as? Int
            else {
                return nil
        }

        self.init(
            matchprecision: matchPrecision,
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

    convenience init?(json: JSONLib.JSON) {
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

    convenience public required init?(json: Gloss.JSON) {
        guard let uri: String = Decoder.decode(Header.UriKey)(json),
            lr: String = Decoder.decode(Header.LrKey)(json),
            dataset: String = Decoder.decode(Header.DatasetKey)(json),
            outputSrs: String = Decoder.decode(Header.OutputSrsKey)(json),
            epoch: String = Decoder.decode(Header.EpochKey)(json),
            format: String = Decoder.decode(Header.FormatKey)(json),
            query: String = Decoder.decode(Header.QueryKey)(json),
            matchPrecision: Int =  Decoder.decode(Header.MatchprecisionKey)(json),
            maxresults: Int = Decoder.decode(Header.MaxresultsKey)(json),
            totalresults: Int = Decoder.decode(Header.TotalresultsKey)(json),
            offset: Int = Decoder.decode(Header.OffsetKey)(json)
            else {
                return nil
        }

        self.init(
            matchprecision: matchPrecision,
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
