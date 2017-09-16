//
//  OBOrderedServiceViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit

class OBOrderedServiceViewController: UIViewController {

    var service :Service?
    
    @IBOutlet weak var numberInQueue: UILabel!
    
    @IBOutlet weak var serviceLabel: UILabel!

    @IBOutlet weak var queueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ваш талон в электронной очереди"
        queueLabel.text = "Перед вами \((service?.queue)!) человек"
        serviceLabel.text = service?.service
        numberInQueue.text = "о\(Int(arc4random_uniform(100)))"
    }

}
