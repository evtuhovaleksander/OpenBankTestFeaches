//
//  OBQRCodeGeneratorViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit
import QRCode

class OBQRCodeGeneratorViewController: UIViewController {

    @IBOutlet weak var prefixTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getCode(_ sender: Any) {
        // URL
        
        if let prefix = prefixTextField.text, let url = urlTextField.text{
            let fullUrl = URL(string: prefix.appending(url))
            let qrCode = QRCode(fullUrl!)
            image.image = qrCode?.image
        }
        
    }

   
}
