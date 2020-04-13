//
//  AssessmentDetailViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 2/6/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit

class AssessmentDetailViewController: UIViewController {
    
    var itemIndexPath:Int?
    var currentDailyAssessment:dailyAssessment?
    
    //MARK:- IBOutlets
    @IBOutlet weak var depressionScoreLabel: UILabel!
    @IBOutlet weak var anxietyScoreLabel: UILabel!
    
    @IBOutlet weak var sleepScoreLabel: UILabel!
    @IBOutlet weak var workScoreLabel: UILabel!
    @IBOutlet weak var familyScoreLabel: UILabel!
    @IBOutlet weak var healthScoreLabel: UILabel!
    @IBOutlet weak var foodScoreLabel: UILabel!
    @IBOutlet weak var moneyScoreLabel: UILabel!
    
    @IBOutlet weak var journalLabel: UILabel!
    
    var colorsArray = [#colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1),#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let dailyAssessment = currentDailyAssessment {
            
            depressionScoreLabel.text = String(describing: dailyAssessment.depressionScore)
            if(dailyAssessment.depressionScore > 3){
                depressionScoreLabel.textColor = colorsArray[2]
            } else if(dailyAssessment.depressionScore == 3){
                depressionScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.depressionScore < 3){
                depressionScoreLabel.textColor = colorsArray[0]
            }
            
            
            
            anxietyScoreLabel.text = String(describing: dailyAssessment.anxietyScore)
            if(dailyAssessment.anxietyScore > 3){
                anxietyScoreLabel.textColor = colorsArray[2]
            } else if(dailyAssessment.anxietyScore == 3){
                anxietyScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.anxietyScore < 3){
                anxietyScoreLabel.textColor = colorsArray[0]
            }
            
            
            sleepScoreLabel.text = String(describing: dailyAssessment.sleepGoalScore)
            if(dailyAssessment.sleepGoalScore > 3){
                sleepScoreLabel.textColor = colorsArray[0]
            } else if(dailyAssessment.sleepGoalScore == 3){
                sleepScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.sleepGoalScore < 3){
                sleepScoreLabel.textColor = colorsArray[2]
            }
            
            workScoreLabel.text = String(describing: dailyAssessment.workGoalScore)
            if(dailyAssessment.workGoalScore > 3){
                workScoreLabel.textColor = colorsArray[0]
            } else if(dailyAssessment.workGoalScore == 3){
                workScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.workGoalScore < 3){
                workScoreLabel.textColor = colorsArray[2]
            }
            
            familyScoreLabel.text = String(describing: dailyAssessment.familyGoalScore)
            if(dailyAssessment.familyGoalScore > 3){
                familyScoreLabel.textColor = colorsArray[0]
            } else if(dailyAssessment.familyGoalScore == 3){
                familyScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.familyGoalScore < 3){
                familyScoreLabel.textColor = colorsArray[2]
            }
            
            healthScoreLabel.text = String(describing: dailyAssessment.healthGoalScore)
            if(dailyAssessment.healthGoalScore > 3){
                healthScoreLabel.textColor = colorsArray[0]
            } else if(dailyAssessment.healthGoalScore == 3){
                healthScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.healthGoalScore < 3){
                healthScoreLabel.textColor = colorsArray[2]
            }
            
            foodScoreLabel.text = String(describing: dailyAssessment.foodGoalScore)
            if(dailyAssessment.foodGoalScore > 3){
                foodScoreLabel.textColor = colorsArray[0]
            } else if(dailyAssessment.foodGoalScore == 3){
                foodScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.foodGoalScore < 3){
                foodScoreLabel.textColor = colorsArray[2]
            }
            
            moneyScoreLabel.text = String(describing: dailyAssessment.financialGoalScore)
            if(dailyAssessment.financialGoalScore > 3){
                moneyScoreLabel.textColor = colorsArray[0]
            } else if(dailyAssessment.financialGoalScore == 3){
                moneyScoreLabel.textColor = colorsArray[1]
            } else if(dailyAssessment.financialGoalScore < 3){
                moneyScoreLabel.textColor = colorsArray[2]
            }
            
            
            journalLabel.text = dailyAssessment.journalEntry
        }
        
        print("🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧")
        print("item index path: \(String(describing: itemIndexPath))")
        print("current item id: \(String(describing: currentDailyAssessment?.ID))")
        print("🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧")
        
    }
    
    
    //MARK:- IBAction
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if let dailyAssessment = currentDailyAssessment {
            DBManager.sharedInstance.deleteDailyAsessmentFromDb(object: dailyAssessment)
            self.navigationController?.popViewController(animated: true)
        } else {return}
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



