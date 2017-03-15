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
        TableArray = ["Hello","Second","World"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]

        
        return cell
    }
    
    
}
