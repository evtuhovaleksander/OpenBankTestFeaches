//
//  OBQuest.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 17/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import Foundation
class OBQuest{
    var name : String
    var howToAchive : String
    var reward : Int
    var stage : Int
    var progressMax : Int
    var progressCurent : Int
    
    init(nameP : String, howToAchiveP : String, rewardP : Int, stageP : Int, progressMaxP : Int, progressCurentP : Int){
        self.name = nameP
        self.howToAchive = howToAchiveP
        self.reward = rewardP
        self.stage = stageP
        self.progressMax = progressMaxP
        self.progressCurent = progressCurentP
    }
    
    static func getTestData()->[OBQuest]{
        var quests = [OBQuest]()
        
        quests.append(OBQuest(nameP: "name1", howToAchiveP: "do name 1", rewardP: 5, stageP: 0, progressMaxP: 5, progressCurentP: 1))
        quests.append(OBQuest(nameP: "name2", howToAchiveP: "do name 2", rewardP: 6, stageP: 1, progressMaxP: 10, progressCurentP: 1))
        quests.append(OBQuest(nameP: "name1", howToAchiveP: "do name 1", rewardP: 100, stageP: 2, progressMaxP: 10, progressCurentP: 10))
        quests.append(OBQuest(nameP: "name2", howToAchiveP: "do name 3", rewardP: 13, stageP: 3, progressMaxP: 10, progressCurentP: 10))
        return quests
    }
}
