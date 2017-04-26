//
//  Schedule.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 4/6/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import Foundation

class Schedule: UIViewController, UITableViewDataSource, UITabBarDelegate {
    
    let list = ["TaskOne", "TaskTwo", "TaskThree", "TaskFour", "TaskFive", "TaskSix"]
    var myIndex = 0;
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count);
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return (cell)
    }
    
    /*public func tableView(_tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        myIndex = indexPath.row
        performSegue(withIdentifier: "deatilSchedule" , sender:self)
    }*/
    
    override func viewDidLoad() {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "burger.png"), for: UIControlState.normal)
        button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.navigationItem.title = "Schedule"
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    
    }
}
