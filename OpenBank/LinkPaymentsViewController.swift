//
//  LinkPaymentsViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 13/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//



////https://github.com/RNCryptor/RNCryptor
//// Encryption
//let data: NSData = ...
//let password = "Secret password"
//let ciphertext = RNCryptor.encrypt(data: data, withPassword: password)
//
//// Decryption
//do {
//    let originalData = try RNCryptor.decrypt(data: ciphertext, withPassword: password)
//    // ...
//} catch {
//    print(error)
//}

import UIKit
import RNCryptor

class LinkPaymentsViewController: UIViewController {
    var encodedData:String?
    enum dictKeys:String{
        case fromUserID = "fromUserID"
        case fromProductID = "fromProductID"
        case toUserID = "1"
        case toProductID = "2"
        case sum = "3"
    }
    @IBOutlet weak var fromUserID: UITextField!
    
    @IBOutlet weak var fromProductID: UITextField!
    
    @IBOutlet weak var toUserID: UITextField!
    
    @IBOutlet weak var toProductID: UITextField!
    
    @IBOutlet weak var sum: UITextField!
    
    @IBOutlet weak var outText: UITextField!
    
    @IBOutlet weak var inText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if((encodedData) != nil){
            inText.text = encodedData
            decode(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func encode(_ sender: Any) {
        var text2 = "dwdwdwdw"
        var path = "bank://\(text2)"
        var url = NSURL.init(fileURLWithPath: path)
        if(UIApplication.shared.canOpenURL(url as URL)){
            UIApplication.shared.open(url as URL)
        }
        else{
        
        }
        
        
        
        
        
        
        
        var d  = Data(base64Encoded: "test")
        var dd = d?.base64EncodedString()
        print(dd!)
        
        var parameterDictionary = Dictionary<String, Any>();
        let text = fromUserID.text!
        parameterDictionary[dictKeys.fromUserID.rawValue] = text
        let data = NSKeyedArchiver.archivedData(withRootObject: parameterDictionary)

        let password = "Secret password"
        let ciphertext = RNCryptor.encrypt(data: data, withPassword: password)
        outText.text = ciphertext.base64EncodedString()

    }
    
    @IBAction func decode(_ sender: Any) {
        var data = Data(base64Encoded: (inText.text)!)                // Decryption
        do {
            let password = "Secret password"
            let originalData = try RNCryptor.decrypt(data: data!, withPassword: password)
            let parameterDictionary: Dictionary? = NSKeyedUnarchiver.unarchiveObject(with: originalData) as? Dictionary<String,Any>
            fromUserID.text = parameterDictionary?[dictKeys.fromUserID.rawValue] as? String
        } catch {
            print(error)
        }

    }
    


}
