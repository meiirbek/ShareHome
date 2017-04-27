//
//  initialLoginVC.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 3/16/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class initialLoginVC: UIViewController {

    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        UserDefaults.standard.set(loginName.text, forKey: "username")
        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        facebookButtonPressed(button: loginButton)
    }
    
    @IBAction func facebookButtonPressed(button: UIButton) {
        
    }

    

  
}
