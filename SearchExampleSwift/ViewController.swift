//
//  ViewController.swift
//  SearchExampleSwift
//
//  Created by David Haynes on 10/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {

    var searchController: UISearchController
    var resultsController: ResultsViewController

    required init?(coder aDecoder: NSCoder) {
        self.resultsController = ResultsViewController()
        self.searchController = UISearchController(searchResultsController: resultsController)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["OS Places", "OS Open Names"]
        self.view.addSubview(searchController.searchBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let text = searchController.searchBar.text, scope = SearchScope(rawValue: searchController.searchBar.selectedScopeButtonIndex) {
            resultsController.search(text, scope: scope)
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
