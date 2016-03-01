//
//  Result.swift
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public class Response: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kResultResultsKey: String = "results"
	internal let kResultHeaderKey: String = "header"

    // MARK: Properties
	public var results: [Results]?
	public var header: Header?

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if results?.count > 0 {
			var temp: [AnyObject] = []
			for item in results! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kResultResultsKey)
		}
		if header != nil {
			dictionary.updateValue(header!.dictionaryRepresentation(), forKey: kResultHeaderKey)
		}

        return dictionary
    }

}
