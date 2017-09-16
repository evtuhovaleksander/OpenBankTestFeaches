//
//  TouchIDViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 15/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit

import LocalAuthentication

class TouchIDViewController: UIViewController {
    @IBAction func logInAction(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        // 1. Create a authentication context
        let authenticationContext = LAContext()
        var error:NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            
            showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
            
        }
        
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Only awesome people are allowed",
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    
                    // Fingerprint recognized
                    // Go to view controller
                    self.navigateToAuthenticatedViewController()
                    
                }else {
                    
                    // Check if there is an error
                    if let error = error {
                        self.showAlertViewAfterEvaluatingPolicyWithMessage(error.localizedDescription)
                    }
                    
                }
                
        })
        
    }
    

    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        
        showAlertWithTitle("Error", message: "This device does not have a TouchID sensor.")
        
    }
    

    func showAlertViewAfterEvaluatingPolicyWithMessage( _ message:String ){
        
        showAlertWithTitle("Error", message: message)
        
    }
    

    func showAlertWithTitle( _ title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async { () -> Void in
            
            self.present(alertVC, animated: true, completion: nil)
            
        }
        
    }
    
    
    func navigateToAuthenticatedViewController(){
        showAlertWithTitle("ok", message: "sucsess autentification")
    }
    
}


