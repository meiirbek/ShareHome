//
//  Task.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 4/5/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import Foundation

class Task {
    
    var nameOfTask: String
    var deadline: String
    var personInCharge: String
    
    init(nameOfTask: String, deadline:String, personInCharge: String) {
        self.nameOfTask = nameOfTask
        self.deadline = deadline
        self.personInCharge = personInCharge
    }
    
    
}
