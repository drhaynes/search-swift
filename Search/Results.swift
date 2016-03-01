//
//  Results.swift
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public class Results: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kResultsDpaKey: String = "DPA"

    // MARK: Properties
	public var dpa: Dpa?

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if dpa != nil {
			dictionary.updateValue(dpa!.dictionaryRepresentation(), forKey: kResultsDpaKey)
		}

        return dictionary
    }

}
