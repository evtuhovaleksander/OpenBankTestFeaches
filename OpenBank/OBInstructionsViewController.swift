//
//  OBInstructionsViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit
import Instructions

class OBInstructionsViewController: UIViewController,CoachMarksControllerDataSource, CoachMarksControllerDelegate{
    
    let coachMarksController = CoachMarksController()
    
    @IBAction func lauch(_ sender: Any) {
    }
    
    @IBOutlet weak var l1: UILabel!
    
    @IBOutlet weak var l2: UILabel!
    
    @IBOutlet weak var l3: UILabel!
    
    var dataSource : Array<[Any]> = Array<[Any]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coachMarksController.dataSource = self
        dataSource = [[self.l1,"1"],[self.l2,"2"]]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.coachMarksController.start(on: self)
    }
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return dataSource.count
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController,
                              coachMarkAt index: Int) -> CoachMark {
        //return coachMarksController.helper.makeCoachMark(for: l1)
        return coachMarksController.helper.makeCoachMark(for: dataSource[index][0]as?UIView)
    }

    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation)
        
        coachViews.bodyView.hintLabel.text = dataSource[index][1]as?String
        coachViews.bodyView.nextLabel.text = "Next.."
        
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }

}
