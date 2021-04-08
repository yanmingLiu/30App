//
//  ViewController.swift
//  16-SlideMenu
//
//  Created by lym on 2021/4/1.
//

import UIKit

class ViewController: UITableViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }

}

