//
//  GoalsViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 1/20/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit
class GoalsViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- IBOutlets
    @IBOutlet weak var sleepGoalTextField: UITextField!
    @IBOutlet weak var workGoalTextField: UITextField!
    @IBOutlet weak var familyGoalTextField: UITextField!
    @IBOutlet weak var healthGoalTextField: UITextField!
    @IBOutlet weak var foodGoalTextField: UITextField!
    @IBOutlet weak var financialGoalTextField: UITextField!

    let defaults = UserDefaults.standard
    
    //use this variable to let the home VC know if there is goals or not
    var isGoalsSaved = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sleepGoalTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func onSaveButtonPressed(_ sender: Any) {
        print("🔵 save button pressed 🔵")
        saveGoals()
    }
    
    
    
    //adjust the function according to the goals you have
    func saveGoals() {
        
        print(defaults.value(forKey: "sleepGoal"))
        
        defaults.set(sleepGoalTextField.text!, forKey: "sleepGoal")
        defaults.set(workGoalTextField.text!, forKey: "workGoal")
        defaults.set(familyGoalTextField.text!, forKey: "familyGoal")
        defaults.set(healthGoalTextField.text!, forKey: "healthGoal")
        defaults.set(foodGoalTextField.text!, forKey: "foodGoal")
        defaults.set(financialGoalTextField.text!, forKey: "financialGoal")
        print("✅ defaults saved! ✅")
    }
    
    
    @IBAction func onDoneButtonPressed(_ sender: Any) {
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
