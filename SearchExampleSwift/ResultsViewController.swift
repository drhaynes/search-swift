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
    var results: [SearchResult]!

    override func viewDidLoad() {
        let apiKey = NSBundle.mainBundle().URLForResource("APIKEY", withExtension: nil).flatMap { url -> String? in
            do {
                return try String(contentsOfURL: url)
            } catch {
                return nil
            }
            } ?? ""

        self.searchService = SearchService(apiKey: apiKey)
        self.results = [SearchResult]()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal func search(text: String) {
        if(text.utf16.count > 2) {
            searchService.find(text, completion: { (result) in
                switch result {
                case .Success(let response):
                    self.results = response.results
                    self.tableView.reloadData()
                case .Failure(let error):
                    print("Search error: \(error)")
                }
            })
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected: \(indexPath)")
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let result = results[indexPath.row]
        cell.textLabel?.text = result.address
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        cell.detailTextLabel?.text = "Coords: \(result.xCoordinate), \(result.yCoordinate)"
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64.0
    }

}
