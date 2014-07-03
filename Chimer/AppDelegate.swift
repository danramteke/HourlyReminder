//
//  AppDelegate.swift
//  Chimer
//
//  Created by Daniel R on 6/6/14.
//  Copyright (c) 2014 Dan Ramteke Consulting, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    var manager:ChimeManager?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
//        let ios8 = NSOperatingSystemVersion(majorVersion: 8, minorVersion: 0, patchVersion: 0)
//        if (NSProcessInfo().isOperatingSystemAtLeastVersion(ios8)) {
//            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound, categories: nil))
//        }
        ChimerNotificationRegistrationHelper.registerForSoundLocalNotifications()

        
        
        manager = ChimeManager(application:application)
        
        manager?.applicationDidFinishLaunching(application)
        (window?.rootViewController as ViewController).manager = manager
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        manager?.applicationWillResignActive(application)
    }

    func applicationDidEnterBackground(application: UIApplication) {
        manager?.applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        manager?.applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        manager?.applicationDidBecomeActive(application)
    }

    func applicationWillTerminate(application: UIApplication) {
        manager?.applicationWillTerminate(application)
    }


    func application(application: UIApplication!,
        didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings!){
            println("registered for: \(notificationSettings)")
    }
    
    func application(application:UIApplication,
        didReceiveLocalNotification notification:UILocalNotification){
        println("received local: \(notification)")
        (window?.rootViewController as ViewController).localNotificationArrived(notification)
    }
}

