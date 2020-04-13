//
//  MoreViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 1/20/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit
import MessageUI

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onReviewButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.apple.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func onEmailButtonPressed(_ sender: Any) {
        //run it on device. simulater is a bit weird with this one...
        showMailComposer()
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            //show alert informing the user.
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["s00038262@auk.edu.kw"])
        composer.setSubject("Regarding the app")
        composer.setMessageBody("I have some points regarding the app", isHTML: false)
        
        present(composer, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

extension MoreViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
        }
        controller.dismiss(animated: true)
    }
}
