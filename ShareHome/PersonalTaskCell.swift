//
//  PersonalTaskCell.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 4/5/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import UIKit

class PersonalTaskCell: UICollectionViewCell {
    
    @IBOutlet weak var personaText: UITextField!
    @IBOutlet weak var personalTaskText: UITextField!
    @IBOutlet weak var deadlineText: UITextField!
    
    var task: Task? {
        didSet {
            updateFields()
        }
    }
    
    func updateFields()
    {
        personaText.text = task?.personInCharge
        deadlineText.text = task?.deadline
        personalTaskText.text = task?.nameOfTask
    }
}
