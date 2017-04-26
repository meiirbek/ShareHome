//
//  AppDelegate.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 3/14/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import UIKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let APP_ID = "19E73C32-D357-313A-FF64-12612084E000"
    let SECRET_KEY = "3EBF3C7D-B0BE-84BD-FF0A-695F6A372200"
    let VERSION_NUM = "v1"
    
    var backendless = Backendless.sharedInstance()

    var window: UIWindow?
    
    func application(application: UIApplication,
                     openURL url: NSURL,
                     sourceApplication: String?,
                     annotation: AnyObject) -> Bool {
        let result = FBSDKApplicationDelegate.sharedInstance().application(application,
                                                                           open: url as URL!,
                                                                           sourceApplication: sourceApplication,
                                                                           annotation: annotation)
        if result {
            
            let token = FBSDKAccessToken.current()
            let fieldsMapping = [
                "id" : "facebookId",
                "name" : "name",
                "birthday": "birthday",
                "first_name": "fb_first_name",
                "last_name" : "fb_last_name",
                "gender": "gender",
                "email": "email"
            ]
            
            backendless?.userService.login(
                withFacebookSDK: token,
                fieldsMapping: fieldsMapping,
                response: { (user: BackendlessUser?) -> Void in
                    print("user: \(user)")
                },
                error: { (fault: Fault?) -> Void in
                    print("Server reported an error: \(fault)")
            })
        }
        
        return result
    }
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        backendless?.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        // If you plan to use Backendless Media Service, uncomment the following line (iOS ONLY!)
        // backendless.mediaService = MediaService()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        
        
        if(UserDefaults.standard.value(forKey: "username") as? String) == nil {
            //show the onboarding screen
            vc = storyboard.instantiateViewController(withIdentifier: "initialLoginVC" )
        } else {
            //show the main screen
            vc = storyboard.instantiateInitialViewController()!
            
        }
        
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        
        
        
        return FBSDKApplicationDelegate.sharedInstance().application(application,
                                                                     didFinishLaunchingWithOptions: launchOptions)    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

