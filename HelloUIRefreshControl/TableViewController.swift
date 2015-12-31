//
//  TableViewController.swift
//  HelloUIRefreshControl
//
//  Created by Masaaki Uno on 2015/12/31.
//  Copyright © 2015年 Masaaki Uno. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "引っ張って更新")
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = items[indexPath.row].title
        return cell
        
    }
    
    func refresh() {
        print("refresh...")
        
        let count = items.count
        items.append(Item(title: "item" + String(count + 1)))
        items.append(Item(title: "item" + String(count + 2)))
        items.append(Item(title: "item" + String(count + 3)))
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        
    }
}

class Item {
    var title = ""
    
    init(title: String) {
        self.title = title
    }
}
