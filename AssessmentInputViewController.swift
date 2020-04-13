//
//  AssessmentInputViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 2/6/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit

class AssessmentInputViewController: UIViewController {
    
    var currentDailyAssessment:dailyAssessment?
    
    //MARK:- IBOutlets
    
    //date 📅
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //mood 🤔
    @IBOutlet weak var depressionSegCtrl: UISegmentedControl!
    @IBOutlet weak var anxietySegCtrl: UISegmentedControl!
    
    //goals 🎯
    @IBOutlet weak var sleepGoalSegCtrl: UISegmentedControl!
    
    @IBOutlet weak var workGoalSegCtrl: UISegmentedControl!
    
    @IBOutlet weak var familyGoalSegCtrl: UISegmentedControl!
    
    @IBOutlet weak var healthGoalSegCtrl: UISegmentedControl!
    
    @IBOutlet weak var foodGoalSegCtrl: UISegmentedControl!
    
    @IBOutlet weak var financialGoalSegCtrl: UISegmentedControl!
    
    //journal 📝
    @IBOutlet weak var journalTextView: UITextView!
    
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let newDailyAssessment = dailyAssessment()
        
//old implentaiton
//        if(currentDailyAssessment == nil) {
//            newDailyAssessment.ID = DBManager.sharedInstance.getDailyAssessmentsFromDB().count
//        }
        
        newDailyAssessment.ID = UUID().uuidString
                
        newDailyAssessment.dateEntered = datePicker.date
        
        newDailyAssessment.depressionScore = Int(depressionSegCtrl.selectedSegmentIndex+1)
        newDailyAssessment.anxietyScore = Int(anxietySegCtrl.selectedSegmentIndex+1)
        
        newDailyAssessment.sleepGoalScore = Int(sleepGoalSegCtrl.selectedSegmentIndex)
        newDailyAssessment.workGoalScore = Int(workGoalSegCtrl.selectedSegmentIndex)
        newDailyAssessment.familyGoalScore = Int(familyGoalSegCtrl.selectedSegmentIndex)
        newDailyAssessment.healthGoalScore = Int(healthGoalSegCtrl.selectedSegmentIndex)
        newDailyAssessment.foodGoalScore = Int(foodGoalSegCtrl.selectedSegmentIndex)
        newDailyAssessment.financialGoalScore = Int(financialGoalSegCtrl.selectedSegmentIndex)
        
        newDailyAssessment.journalEntry = journalTextView.text
        
        DBManager.sharedInstance.addDailyAssessmentData(object: newDailyAssessment)

        self.dismiss(animated: true){}
        }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
