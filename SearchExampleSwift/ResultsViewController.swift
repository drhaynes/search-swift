//
//  SearchResultsControllerViewController.swift
//  Search
//
//  Created by David Haynes on 10/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import UIKit
import Search
import Fetch

class ResultsViewController: UITableViewController {

    var searchService: SearchService!

    override func viewDidLoad() {
        let apiKey = NSBundle.mainBundle().URLForResource("APIKEY", withExtension: nil).flatMap { url -> String? in
            do {
                return try String(contentsOfURL: url)
            } catch {
                return nil
            }
            } ?? ""

        self.searchService = SearchService(apiKey: apiKey)

        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal func search(text: String) {
        if(text.utf16.count > 2) {
            searchService.find(text, completion: { (result) in
                print("\(result)")
            })
        }
    }
}
