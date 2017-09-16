//
//  OBTipsViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit
import AMPopTip

class OBTipsViewController: UIViewController {
    
    let popTip = PopTip()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func openTip(_ sender: Any) {
        if(popTip.isVisible){
            //popTip.hide()
        }
        popTip.show(text: "Hey! Listen!", direction: .up, maxWidth: 200, in: view, from: button.frame)
    }
    
   
}
