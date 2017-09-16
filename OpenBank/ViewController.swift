//
//  ViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 13/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var eventStore = EKEventStore()
        
        eventStore.requestAccess(to: EKEntityType.reminder, completion:
            {(granted, error) in
                if !granted {
                    print("Access to store not granted")
                }
        })
        
        let reminder = EKReminder(eventStore: eventStore)
        
        reminder.title = "Go to the store and buy milk"
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        
        do {
            try eventStore.save(reminder,
                                commit: true)
        } catch let error {
            print("Reminder failed with error \(error.localizedDescription)")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

