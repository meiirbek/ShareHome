//
//  CollectionViewofPosts.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 4/5/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import Foundation

class CollectionViewOfPosts: UICollectionViewController {
    
    override func viewDidLoad() {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "burger.png"), for: UIControlState.normal)
        button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
