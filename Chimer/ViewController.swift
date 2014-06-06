//
//  ViewController.swift
//  Chimer
//
//  Created by Daniel R on 6/6/14.
//  Copyright (c) 2014 Dan Ramteke Consulting, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var manager: ChimeManager? {
        didSet{
            println("manager set in viewcontroller")
        }
    }
    
    func localNotificationArrived(notification:UILocalNotification) {
        
    }

    @IBAction func switched(sender : UISwitch) {
        if sender.on {
            manager?.scheduleChimes()
        } else {
            manager?.cancelChimes()
        }
        
    }

}

