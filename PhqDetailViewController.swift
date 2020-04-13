//
//  PhqDetailViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 2/10/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit

class PhqDetailViewController: UIViewController {
    
    var currentPhqAssessment:phqAssessment?
    var colorsArray = [#colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1),#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)]

    
    //MARK:- IBOutlets
    
    //PHQ Outlets
    @IBOutlet weak var phqBigScoreLabel: UILabel!
    @IBOutlet weak var phqDiogLabel: UILabel!
    
    @IBOutlet weak var phq1Score: UILabel!
    @IBOutlet weak var phq2Score: UILabel!
    @IBOutlet weak var phq3Score: UILabel!
    @IBOutlet weak var phq4Score: UILabel!
    @IBOutlet weak var phq5Score: UILabel!
    @IBOutlet weak var phq6Score: UILabel!
    @IBOutlet weak var phq7Score: UILabel!
    @IBOutlet weak var phq8Score: UILabel!
    @IBOutlet weak var phq9Score: UILabel!
    
    //GAD Outlets
    @IBOutlet weak var gadBigScoreLabel: UILabel!
    @IBOutlet weak var gadDiogLabel: UILabel!
    
    @IBOutlet weak var gad1Score: UILabel!
    @IBOutlet weak var gad2Score: UILabel!
    @IBOutlet weak var gad3Score: UILabel!
    @IBOutlet weak var gad4Score: UILabel!
    @IBOutlet weak var gad5Score: UILabel!
    @IBOutlet weak var gad6Score: UILabel!
    @IBOutlet weak var gad7Score: UILabel!
    
    @IBOutlet weak var notesLabel: UILabel!
    
    
    
    
    
    //MARK:- View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        calcPhqScore(phqAssessment: currentPhqAssessment!)
        calcGadScore(phqAssessment: currentPhqAssessment!)
        notesLabel.text = currentPhqAssessment?.notesEntry
        
    }
    
    //MARK:- IBAction
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if let phqAssessment = currentPhqAssessment {
            DBManager.sharedInstance.deletePhqAsessmentFromDb(object: phqAssessment)
            self.navigationController?.popViewController(animated: true)
        } else {return}
    }
    
    //MARK:- Stat Functions
    func calcPhqScore(phqAssessment: phqAssessment){
        var phqScore = phqAssessment.phq1Score + phqAssessment.phq2Score + phqAssessment.phq3Score + phqAssessment.phq4Score + phqAssessment.phq5Score + phqAssessment.phq6Score + phqAssessment.phq7Score + phqAssessment.phq8Score + phqAssessment.phq9Score
        
        
        //header date
        phqBigScoreLabel.text = String(phqScore)
        if (phqScore < 5) {
            phqDiogLabel.text = "Minimal or no depression"
            phqDiogLabel.textColor = colorsArray[0]
            phqBigScoreLabel.textColor = colorsArray[0]
            
        } else if (phqScore < 10) {
            phqDiogLabel.text = "Mild depression"
            
        } else if (phqScore < 15) {
            phqDiogLabel.text = "Moderate depression"
            
        } else if (phqScore < 20) {
            phqDiogLabel.text = "Moderatley severe depression"
            
        } else if (phqScore >= 20) {
            phqDiogLabel.text = "Severe depression"
        }
        
        //score detail data
        phq1Score.text = String(phqAssessment.phq1Score)
        phq2Score.text = String(phqAssessment.phq2Score)
        phq3Score.text = String(phqAssessment.phq3Score)
        phq4Score.text = String(phqAssessment.phq4Score)
        phq5Score.text = String(phqAssessment.phq5Score)
        phq6Score.text = String(phqAssessment.phq6Score)
        phq7Score.text = String(phqAssessment.phq7Score)
        phq8Score.text = String(phqAssessment.phq8Score)
        phq9Score.text = String(phqAssessment.phq9Score)
    }
    
    func calcGadScore(phqAssessment: phqAssessment){
        var gadScore = phqAssessment.gad1Score + phqAssessment.gad2Score + phqAssessment.gad3Score + phqAssessment.gad4Score + phqAssessment.gad5Score + phqAssessment.gad6Score + phqAssessment.gad7Score
        
        
        //header date
        gadBigScoreLabel.text = String(gadScore)
        if (gadScore < 5) {
            gadDiogLabel.text = "Minimal or no anxiety"
            gadDiogLabel.textColor = colorsArray[0]
            gadBigScoreLabel.textColor = colorsArray[0]
            
        } else if (gadScore < 10) {
            gadDiogLabel.text = "Mild anxiety"
            
        } else if (gadScore < 15) {
            gadDiogLabel.text = "Moderate depression"
            
        } else if (gadScore >= 15) {
            gadDiogLabel.text = "Severe anxiety"
        }
        
        //score detail data
        gad1Score.text = String(phqAssessment.gad1Score)
        gad2Score.text = String(phqAssessment.gad2Score)
        gad3Score.text = String(phqAssessment.gad3Score)
        gad4Score.text = String(phqAssessment.gad4Score)
        gad5Score.text = String(phqAssessment.gad5Score)
        gad6Score.text = String(phqAssessment.gad6Score)
        gad7Score.text = String(phqAssessment.gad7Score)
    }
    
}








/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
