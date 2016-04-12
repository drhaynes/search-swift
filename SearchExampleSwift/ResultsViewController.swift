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

enum SearchScope: Int {
    case Places
    case OpenNames
}

class ResultsViewController: UITableViewController {

    var placesSearchService: PlacesSearchService!
    var openNamesSearchService: OpenNamesSearchService!

    var results: [AnyObject]!

    override func viewDidLoad() {
        let apiKey = NSBundle.mainBundle().URLForResource("APIKEY", withExtension: nil).flatMap { url -> String? in
            do {
                return try String(contentsOfURL: url)
            } catch {
                return nil
            }
        } ?? ""

        placesSearchService = PlacesSearchService(apiKey: apiKey)
        openNamesSearchService = OpenNamesSearchService(apiKey: apiKey)
        results = [AnyObject]()
        tableView.delegate = self
        tableView.dataSource = self

        class SearchCell: UITableViewCell {
            override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
                super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
            }
            
            required init?(coder aDecoder: NSCoder) {
                super.init(coder: aDecoder)
            }
        }
        tableView.registerClass(SearchCell.self, forCellReuseIdentifier: "cell")

        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal func search(text: String, scope: SearchScope) {
        if text.utf16.count > 2 {
            switch scope {
            case .Places:
                placesSearchService.find(text) { result in
                    switch result {
                    case .Success(let response):
                        self.results = response.results
                        self.tableView.reloadData()
                    case .Failure(let error):
                        print("Search error: \(error)")
                    }
                }
            case .OpenNames:
                openNamesSearchService.find(text) { result in
                    switch result {
                    case .Success(let response):
                        self.results = response.results
                        self.tableView.reloadData()
                    case .Failure(let error):
                        print("Search error: \(error)")
                    }
                }
            }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let result = results[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        if let result = result as? SearchResult {
            cell.textLabel?.text = result.address.capitalizedString
            cell.detailTextLabel?.text = "Coords: \(result.xCoordinate), \(result.yCoordinate)"
        } else if let result = result as? GazetteerEntry {
            cell.textLabel?.text = "\(result.name1), \(result.populatedPlace ?? result.countyUnitary ?? result.region), \(result.postcodeDistrict ?? "")"
            cell.detailTextLabel?.text = "Coords: \(result.geometryX), \(result.geometryY)"
        }
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64.0
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
