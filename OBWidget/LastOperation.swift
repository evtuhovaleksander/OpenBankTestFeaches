//
//  LastOperation.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import Foundation
class LastOperation {
    var info:String?
    var sum:String?
    var date:String?
    var income:Bool?
    
    init(infoP:String,sumP:String,dateP:String,incomeP:Bool) {
        self.info = infoP
        self.sum = sumP
        self.date = dateP
        self.income = incomeP
    }
    
    static func getTestData()->[LastOperation]{
        var array = [LastOperation]()
        array.append(LastOperation(infoP: "1",sumP: "2",dateP: "3",incomeP: true))
        array.append(LastOperation(infoP: "3",sumP: "4",dateP: "5",incomeP: false))
        array.append(LastOperation(infoP: "3",sumP: "1",dateP: "2",incomeP: true))
        return array
    }
}
