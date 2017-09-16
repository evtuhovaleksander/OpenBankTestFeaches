//
//  BankATM.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import Foundation
class BankATM{
    var distance:Int?
    var timetable:String?
    var adress:String?
    
    init(distanceP:Int,timetableP:String,adressP:String){
        self.distance=distanceP
        self.adress=adressP
        self.timetable = timetableP
    }
    
    static func getTestData()->[BankATM]{
        var testData = [BankATM]()
        testData.append(BankATM(distanceP:1,timetableP:"1",adressP:"2"))
        testData.append(BankATM(distanceP:1,timetableP:"3",adressP:"4"))
        return testData
    }
}

class BankOutlet:BankATM{
    var workload:Int?
    var services:[Service]?
    
    init(distanceP:Int,timetableP:String,adressP:String,workloadP:Int){
        super.init(distanceP: distanceP, timetableP: timetableP, adressP: adressP)
        self.workload = workloadP
        self.services = Service.getTestData()
    }
    
    static func getTestData()->[BankOutlet]{
        var testData = [BankOutlet]()
        testData.append(BankOutlet(distanceP:1,timetableP:"1",adressP:"2",workloadP:1))
        testData.append(BankOutlet(distanceP:0,timetableP:"3",adressP:"4",workloadP:1))

        return testData
    }
}
