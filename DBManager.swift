//
//  DBManager.swift
//  MentalBalanceApp
//
//  Created by Developer on 2/5/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit
import RealmSwift

//entities (dailyAssessment - weeklyAssessment)

//MARK:- daily assessment defention

class dailyAssessment: Object {
    
    @objc dynamic var ID = UUID().uuidString
    @objc dynamic var dateEntered = Date()
    
    @objc dynamic var depressionScore = 0
    @objc dynamic var anxietyScore = 0

    @objc dynamic var sleepGoalScore = 0
    @objc dynamic var workGoalScore = 0
    @objc dynamic var familyGoalScore = 0
    @objc dynamic var healthGoalScore = 0
    @objc dynamic var foodGoalScore = 0
    @objc dynamic var financialGoalScore = 0
    
    @objc dynamic var journalEntry = ""
    
    override class func primaryKey() -> String? {
        return "ID"
    }
}

//MARK:- PHQ assessment defintion
class phqAssessment: Object {
    
    @objc dynamic var ID = UUID().uuidString
    @objc dynamic var dateEntered = Date()
    
    //PHQ-9 Questions
    @objc dynamic var phq1Question = "Little interest or pleasure in doing things?"
    @objc dynamic var phq1Score = 0
    @objc dynamic var phq1Symptoms = "Low intrest or pleasure"
    
    @objc dynamic var phq2Question = "Feeling down, depressed, or hopeless?"
    @objc dynamic var phq2Score = 0
    @objc dynamic var phq2Symptoms = "Feeling down, hopeless"
    
    @objc dynamic var phq3Question = "Trouble falling or staying asleep, or sleeping too much?"
    @objc dynamic var phq3Score = 0
    @objc dynamic var phq3Symptoms = "Trouble sleeping"
    
    @objc dynamic var phq4Question = "Feeling tired or having little energy?"
    @objc dynamic var phq4Score = 0
    @objc dynamic var phq4Symptoms = "Tired or little energy"
    
    @objc dynamic var phq5Question = "Poor appetite or overeating?"
    @objc dynamic var phq5Score = 0
    @objc dynamic var phq5Symptoms = "Poor appetite/overeating"
    
    @objc dynamic var phq6Question = "Feeling bad about yourself — or that you are a failure or have let yourself or your family down?"
    @objc dynamic var phq6Score = 0
    @objc dynamic var phq6Symptoms = "Guilt"
    
    @objc dynamic var phq7Question = "Trouble concentrating on things, such as reading the newspaper or watching television?"
    @objc dynamic var phq7Score = 0
    @objc dynamic var phq7Symptoms = "Trouble concentrating "
    
    @objc dynamic var phq8Question = "Moving or speaking so slowly that other people could have noticed? Or so fidgety or restless that you have been moving a lot more than usual?"
    @objc dynamic var phq8Score = 0
    @objc dynamic var phq8Symptoms = "Moving slowly/restless"
    
    @objc dynamic var phq9Question = "Thoughts that you would be better off dead, or thoughts of hurting yourself in some way?"
    @objc dynamic var phq9Score = 0
    @objc dynamic var phq9Symptoms = "Suicidel thoughts"
    
    //GAD-7 Questions
    @objc dynamic var gad1Question = "Feeling nervous, anxious, or on edge"
    @objc dynamic var gad1Score = 0
    @objc dynamic var gad1Symptoms = "Nervous, anxious, on edge"
    
    @objc dynamic var gad2Question = "Not being able to stop or control worrying"
    @objc dynamic var gad2Score = 0
    @objc dynamic var gad2Symptoms = "Uncontrollable worry"
    
    @objc dynamic var gad3Question = "Worrying too much about different things"
    @objc dynamic var gad3Score = 0
    @objc dynamic var gad3Symptoms = "Worry about different things"
    
    @objc dynamic var gad4Question = "Trouble relaxing"
    @objc dynamic var gad4Score = 0
    @objc dynamic var gad4Symptoms = "Trouble relaxing"
    
    @objc dynamic var gad5Question = "Being so restless that it's hard to sit still"
    @objc dynamic var gad5Score = 0
    @objc dynamic var gad5Symptoms = ""
    
    @objc dynamic var gad6Question = "Becoming easily annoyed or irritable"
    @objc dynamic var gad6Score = 0
    @objc dynamic var gad6Symptoms = "Irritable"
    
    @objc dynamic var gad7Question = "Feeling afraid as if something awful might happen"
    @objc dynamic var gad7Score = 0
    @objc dynamic var gad7Symptoms = "Afraid something aweful might happen"
    
    @objc dynamic var notesEntry = ""
    
    //UUID
    override class func primaryKey() -> String? {
        return "ID"
    }
}


//MARK:- DBManager defintion
class DBManager {
    
    //MARK: DB class var and init
    
    private var database:Realm
    static let sharedInstance = DBManager()
    
    
    
    private init() {
        database = try! Realm()
        print(database.configuration.fileURL)
    }
    
    

    //MARK:- CRUD func
    
    //Read👁---------------------------------------------
    
    func getPhqFromDB() -> Results<phqAssessment> {

        let phqResults: Results<phqAssessment> = database.objects(phqAssessment.self).sorted(byKeyPath: "dateEntered", ascending: false)
        print("👍🏼 Returned phq assess 👍🏼")
        return phqResults
    }
    
    func getDailyAssessmentsFromDB() -> Results<dailyAssessment> {
        
        let dailyAssessmentsResults: Results<dailyAssessment> = database.objects(dailyAssessment.self).sorted(byKeyPath: "dateEntered", ascending: false)
        print("📝 Returned Results 📝")
        return dailyAssessmentsResults
    }
    
    //Write✏️---------------------------------------------
    
    func addPhqAssessment(object: phqAssessment) {
        
        try! database.write {
            database.add(object, update: .all)
            print("👍🏼 Added new weekly assess 👍🏼")
        }
    }
    
    
    func addDailyAssessmentData(object: dailyAssessment) {
        
        try! database.write {
            database.add(object, update: .all)
            print("✅ Added new object ✅")
        }
    }
    
    /*Update♻️---------------------------------------------
    to be implented*/
    
    //Delete❌---------------------------------------------
    
    func deletePhqAsessmentFromDb(object: phqAssessment) {
        try! database.write {
            database.delete(object)
        }
    }
    
    func deleteDailyAsessmentFromDb(object: dailyAssessment) {
        try! database.write {
            database.delete(object)
        }
    }
    
    //DELETE'EM ALL!!!
    func deleteAllDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
}

