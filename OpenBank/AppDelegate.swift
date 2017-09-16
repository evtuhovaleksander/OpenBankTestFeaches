
//  AppDelegate.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 13/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit

import CoreFoundation
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if(!(launchOptions != nil)){
            
        }
        
        
        
        
        
        
        // Configure SpeechKit lib, this method should be called _before_ any SpeechKit functions.
        // Generate your own app key for this purpose.
        YSKSpeechKit.sharedInstance().configure(withAPIKey: "90df92d4-7e7c-4828-8baa-92fc506c0d02");
        
        // [OPTIONAL] Set SpeechKit log level, for more options see YSKLogLevel enum.
        YSKSpeechKit.sharedInstance().setLogLevel(YSKLogLevel(YSKLogLevelWarn));
        
        // [OPTIONAL] Set YSKSpeechKit parameters, for all parameters and possible values see documentation.
        YSKSpeechKit.sharedInstance().setParameter(YSKDisableAntimat, withValue: "false");
        
        //window = UIWindow(frame: UIScreen.main.bounds);
        
        //let phraseSpotterModelConfigDir = Bundle.main.resourcePath?.appending("/phrase_spotter_model")
                

        
        
        
        
        
        
        
        /*
        UIBackgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask(expirationHandler: ()->Void in )
        self.backgroundTaskIdentifier =
            [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
                
                [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
                }];
        self.registerAppforDetectLockState;
        */
        
        /*
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), nil, <#T##callBack: CFNotificationCallback!##CFNotificationCallback!##(CFNotificationCenter?, UnsafeMutableRawPointer?, CFNotificationName?, UnsafeRawPointer?, CFDictionary?) -> Void#>, <#T##name: CFString!##CFString!#>, <#T##object: UnsafeRawPointer!##UnsafeRawPointer!#>, <#T##suspensionBehavior: CFNotificationSuspensionBehavior##CFNotificationSuspensionBehavior#>)
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
            NULL, // observer
            displayStatusChanged, // callback
            CFSTR("com.apple.iokit.hid.displayStatus"), // event name
            NULL, // object
            CFNotificationSuspensionBehaviorDeliverImmediately);
        
        */
        
        /*
         CFNotificationCenterAddObserver(notificationCenter, nil,
         { (noti: CFNotificationCenter!, aPtr: UnsafeMutablePointer<Void>, aStr: CFString!, bPtr: UnsafePointer<Void>, aDict: CFDictionary!) -> () in
         print("got notification") }, cfstr, nil, CFNotificationSuspensionBehavior.DeliverImmediately)*/
        
        


        
        registerforDeviceLockNotification()
        return true
    }
    
    func registerforDeviceLockNotification() {
        //Screen lock notifications
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),     //center
            Unmanaged.passUnretained(self).toOpaque(),     // observer
            displayStatusChangedCallback,     // callback
            "com.apple.springboard.lockcomplete" as CFString,     // event name
            nil,     // object
            .deliverImmediately)
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),     //center
            Unmanaged.passUnretained(self).toOpaque(),     // observer
            displayStatusChangedCallback,     // callback
            "com.apple.springboard.lockstate" as CFString,    // event name
            nil,     // object
            .deliverImmediately)
    }
    
    private let displayStatusChangedCallback: CFNotificationCallback = { _, cfObserver, cfName, _, _ in
        guard let lockState = cfName?.rawValue as String? else {
            return
        }
        
        print("frfrfrfrfrf")
    }
    
    private func displayStatusChanged(_ lockState: String) {
        // the "com.apple.springboard.lockcomplete" notification will always come after the "com.apple.springboard.lockstate" notification
        print("Darwin notification NAME = \(lockState)")
        if (lockState == "com.apple.springboard.lockcomplete") {
            print("DEVICE LOCKED")
        } else {
            print("LOCK STATUS CHANGED")
        }
    }


    
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

    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LinkPayments") as! LinkPaymentsViewController
        let array = url.absoluteString.components(separatedBy: "bank://")
        viewController.encodedData = array[1];
        self.window?.rootViewController = viewController
        
        return true
    }
    
    

/*
    func registerAppforDetectLockState() {
    
    notify_register_dispatch("com.apple.springboard.lockstate", &notify_token,dispatch_get_main_queue(), ^(int token) {
    
    uint64_t state = UINT64_MAX;
    notify_get_state(token, &state);
    
    if(state == 0) {
    NSLog(@"unlock device");
    } else {
    NSLog(@"lock device");
    }
    
    NSLog(@"com.apple.springboard.lockstate = %llu", state);
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.repeatInterval = NSCalendarUnitDay;/
    [notification setAlertBody:@"Hello world!! I come becoz you lock/unlock your device :)"];
    notification.alertAction = @"View";
    notification.alertAction = @"Yes";
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    notification.soundName = UILocalNotificationDefaultSoundName;
    [notification setTimeZone:[NSTimeZone  defaultTimeZone]];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    
    });
    }
    
   */
    
    

}

