//
//  PhqInputViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 2/10/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit

class PhqInputViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var phq1SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq2SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq3SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq4SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq5SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq6SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq7SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq8SegCtrl: UISegmentedControl!
    @IBOutlet weak var phq9SegCtrl: UISegmentedControl!
    
    @IBOutlet weak var gad1SegCtrl: UISegmentedControl!
    @IBOutlet weak var gad2SegCtrl: UISegmentedControl!
    @IBOutlet weak var gad3SegCtrl: UISegmentedControl!
    @IBOutlet weak var gad4SegCtrl: UISegmentedControl!
    @IBOutlet weak var gad5SegCtrl: UISegmentedControl!
    @IBOutlet weak var gad6SegCtrl: UISegmentedControl!
    @IBOutlet weak var gad7SegCtrl: UISegmentedControl!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    
    //MARK:- View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    //MARK:- IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        let newPhqAssessment = phqAssessment()
        
        newPhqAssessment.ID = UUID().uuidString
        
        newPhqAssessment.dateEntered = datePicker.date
        
        newPhqAssessment.phq1Score = Int(phq1SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq2Score = Int(phq2SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq3Score = Int(phq3SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq4Score = Int(phq4SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq5Score = Int(phq5SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq6Score = Int(phq6SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq7Score = Int(phq7SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq8Score = Int(phq8SegCtrl.selectedSegmentIndex)
        newPhqAssessment.phq9Score = Int(phq9SegCtrl.selectedSegmentIndex)
        
        newPhqAssessment.gad1Score = Int(gad1SegCtrl.selectedSegmentIndex)
        newPhqAssessment.gad2Score = Int(gad2SegCtrl.selectedSegmentIndex)
        newPhqAssessment.gad3Score = Int(gad3SegCtrl.selectedSegmentIndex)
        newPhqAssessment.gad4Score = Int(gad4SegCtrl.selectedSegmentIndex)
        newPhqAssessment.gad5Score = Int(gad5SegCtrl.selectedSegmentIndex)
        newPhqAssessment.gad6Score = Int(gad6SegCtrl.selectedSegmentIndex)
        newPhqAssessment.gad7Score = Int(gad7SegCtrl.selectedSegmentIndex)
        
        newPhqAssessment.notesEntry = notesTextView.text

        DBManager.sharedInstance.addPhqAssessment(object: newPhqAssessment)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
