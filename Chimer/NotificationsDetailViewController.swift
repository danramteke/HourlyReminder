//
//  NotificationsDetailViewController.swift
//  Chimer
//
//  Created by Daniel R on 6/6/14.
//  Copyright (c) 2014 Dan Ramteke Consulting, Inc. All rights reserved.
//

import Foundation
import UIKit

class NotificationsDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBAction func doneTapped(sender : AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var notifications:Array<UILocalNotification> = UIApplication.sharedApplication().scheduledLocalNotifications as Array<UILocalNotification>
        let texts = notifications.map {
            (var notification:UILocalNotification) -> String in
            return notification.fireDate.description
        }
//        println(texts)
        //let joiner:String = "\n"
        //let joinedText: String = texts.join(joiner)
        //self.textView.text = joinedText
    }
    func tableView( tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell {
        
        let text = UIApplication.sharedApplication().scheduledLocalNotifications[indexPath.row].fireDate.description
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("NotificationCell") as UITableViewCell
        (cell.viewWithTag(1) as UILabel).text = text
        return cell;
    }
    
    func tableView(tableView: UITableView!,
        numberOfRowsInSection section: Int) -> Int {
            return UIApplication.sharedApplication().scheduledLocalNotifications.count
    }
}
