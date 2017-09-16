//
//  Service.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import Foundation
class Service{
    let service:String
    let queue:Int
    let code:String
    
    init(serviceP:String,queueP:Int,codeP:String){
        self.service = serviceP
        self.queue = queueP
        self.code = codeP
    }
    
    static func getTestData()->[Service]{
        var serviceArray = [Service]()
        
        serviceArray.append(Service(serviceP: "Получение карты", queueP: 10, codeP: "101"))
        serviceArray.append(Service(serviceP: "Заказ карты", queueP: 2, codeP: "102"))
        serviceArray.append(Service(serviceP: "Открытие вклада", queueP: 0, codeP: "103"))
        serviceArray.append(Service(serviceP: "Закрытие вклада", queueP: 1, codeP: "104"))
        return serviceArray
    }
}
