//
//  ViewController.swift
//  CloudconnectivTask
//
//  Created by mac on 3/4/18.
//  Copyright © 2018 OrderEra. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfContect: [Content] = []
    var counterOfPagenation = 0
    var totalElements: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleGetData(page: "0", isLoadMore: false)
        setupDesignLayout()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

