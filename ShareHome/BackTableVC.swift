//
//  BackTableVC.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 3/14/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var TableArray = [String] ()
    
    override func viewDidLoad() {
        TableArray = ["Home","Profile","Make a Post", "Schedule","Grocery List","Purchases"]
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableArray[indexPath.row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]

        
        return cell
    }
    
    
}
