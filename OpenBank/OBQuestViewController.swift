//
//  OBQuestViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 17/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit

class OBQuestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var current: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    var dataSource = [OBQuest]()
    
    var achievedQuests = [OBQuest]()
    
    var progressQuests = [OBQuest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = OBQuest.getTestData()
        
        for quest in dataSource{
            if quest.stage == 3{
                achievedQuests.append(quest)
            }else{
                progressQuests.append(quest)
            }
        }
        
        table.delegate = self
        table.dataSource = self
        table.reloadData()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 1){
            return achievedQuests.count
        }else{
            return progressQuests.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "OBQuestCell") as! OBQuestCell
        var quest:OBQuest
        if(indexPath.section == 0){
            quest = progressQuests[indexPath.row]
        }else{
            quest = achievedQuests[indexPath.row]
        }
        
        cell.name.text = quest.name
        cell.howToAchive.text = quest.howToAchive
        cell.reward.text = "\(quest.reward)"
        
        var progressFloat = Float(quest.progressCurent)/Float(quest.progressMax)
        
        cell.progress.setProgress(progressFloat, animated: true)
        cell.progressLabel.text = "\(quest.progressCurent)/\(quest.progressMax)"
        
        for _ in 0..<quest.stage{
            var view = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
            view.heightAnchor.constraint(equalToConstant: 20).isActive = true
            view.widthAnchor.constraint(equalToConstant: 20).isActive = true
            
            view.backgroundColor = UIColor.yellow
            cell.starStack.addArrangedSubview(view)
        }
        
        for _ in quest.stage..<3{
            var view = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
            view.heightAnchor.constraint(equalToConstant: 20).isActive = true
            view.widthAnchor.constraint(equalToConstant: 20).isActive = true
            view.backgroundColor = UIColor.gray
            cell.starStack.addArrangedSubview(view)
        }


        cell.starStack.spacing = 10;
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0){
            return "Активные"
        }else{
            return "Выполненые"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
}
