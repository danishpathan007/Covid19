//
//  AppDelegate.swift
//  Covid19
//
//  Created by Danish Khan on 30/04/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var standard: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let app = UIApplication.shared

        //create new uiBackgroundTask
        var bgTask = app.beginBackgroundTask(expirationHandler: {
            //app.endBackgroundTask(bgTask)
           // bgTask = .invalid
        })

        //and create new timer with async call:
        DispatchQueue.global(qos: .default).async(execute: {
            //run function methodRunAfterBackground
            let t = Timer.scheduledTimer(
                timeInterval: 10,
                target: self,
                selector: #selector(self.methodRunAfterBackground),
                userInfo: nil,
                repeats: false)
            RunLoop.current.add(t, forMode: .default)
            RunLoop.current.run()
        })
    }
    
    @objc func methodRunAfterBackground() {
        
    }
    
}


