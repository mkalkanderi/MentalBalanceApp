//
//  ViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 1/20/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var sleepGoalLabel: UILabel!
    @IBOutlet weak var workGoalLabel: UILabel!
    @IBOutlet weak var familyGoalLabel: UILabel!
    @IBOutlet weak var healthGoalLabel: UILabel!
    @IBOutlet weak var foodGoalLabel: UILabel!
    @IBOutlet weak var financialGoalLabel: UILabel!
    
    
    var defaults = UserDefaults.standard
    
    
    //MARK:- View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        //checkForSavedGoals()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //checkForSavedGoals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkForSavedGoals()
    }

    

    

    func checkForSavedGoals() {
        sleepGoalLabel.text = defaults.value(forKey: "sleepGoal") as? String ?? "goal is not set yet"
        workGoalLabel.text = defaults.value(forKey: "workGoal") as? String ?? "goal is not set yet"
        familyGoalLabel.text = defaults.value(forKey: "familyGoal") as? String ?? "goal is not set yet"
        healthGoalLabel.text = defaults.value(forKey: "healthGoal") as? String ?? "goal is not set yet"
        foodGoalLabel.text = defaults.value(forKey: "foodGoal") as? String ?? "goal is not set yet"
        financialGoalLabel.text = defaults.value(forKey: "financialGoal") as? String ?? "goal is not set yet"
        
    }

}

