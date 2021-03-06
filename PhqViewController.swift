//
//  PhqViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 2/10/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit

class PhqViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var myTableView: UITableView!

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    //MARK:- IBActions
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let destVC = self.storyboard?.instantiateViewController(identifier: "PhqInputViewController") as! PhqInputViewController
        
        //destVC.currentPhqAssessment = nil
        
        self.navigationController?.pushViewController(destVC, animated: true)
        
        
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

extension PhqViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getPhqFromDB().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath) 
        
        let index = Int(indexPath.row)
        
        let phqAssessment = DBManager.sharedInstance.getPhqFromDB()[index] as phqAssessment
        
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        
        cell.textLabel?.text = dateFormatter.string(from: phqAssessment.dateEntered)
        cell.detailTextLabel?.text = phqAssessment.notesEntry
        cell.detailTextLabel?.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row > -1) {
            let destVC = self.storyboard?.instantiateViewController(withIdentifier: "PhqDetailViewController") as! PhqDetailViewController
            
            let index = Int(indexPath.row)
            
            let phqAssessment = DBManager.sharedInstance.getPhqFromDB()[index] as phqAssessment
            
            destVC.currentPhqAssessment = phqAssessment
            
            self.navigationController?.pushViewController(destVC, animated: true)
        }
    }
    
    
}
