//
//  ChimManager.swift
//  Chimer
//
//  Created by Daniel R on 6/6/14.
//  Copyright (c) 2014 Dan Ramteke Consulting, Inc. All rights reserved.
//

import Foundation
import UIKit

class ChimeManager {
 
    let application: UIApplication
    
    init(application: UIApplication){
        self.application = application
    }
    
    func applicationDidFinishLaunching(application: UIApplication) {
        scheduleChimes()
    }
    
    func cancelChimes() {
        application.cancelAllLocalNotifications()
    }
    
    func scheduleChimes() {
        cancelChimes()
        
        println("scheduling")
        
        let calender = NSCalendar.currentCalendar()
        let now = NSDate()

        
        for i in 0..<24 {
            scheduleNotificationWith(dateForHour(i), filename: "\(i).aiff")
        }
    }
    
    func dateForHour(hour: Int) -> NSDate {
        return NSCalendar.currentCalendar().dateBySettingHour(hour, minute: 0, second: 0, ofDate: NSDate(),
            options: NSCalendarOptions.MatchNextTime)
    }
    
    
    
    func scheduleNotificationWith(startDate:NSDate, filename:NSString) {
        application.scheduleLocalNotification(tap(UILocalNotification()) { notification in
            notification.fireDate = startDate
            notification.repeatInterval = .CalendarUnitDay
            //            notification.alertBody = "Ding!"
            notification.soundName = filename
            
        })
        println("scheduled \(startDate)")
    }
    
    func applicationWillResignActive(application: UIApplication) {

    }
    
    func applicationDidEnterBackground(application: UIApplication) {

    }
    
    func applicationWillEnterForeground(application: UIApplication) {

    }
    
    func applicationDidBecomeActive(application: UIApplication) {

    }
    
    func applicationWillTerminate(application: UIApplication) {

    }
}
