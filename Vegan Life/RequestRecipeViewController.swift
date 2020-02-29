//
//  RequestRecipeViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 28/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class RequestRecipeViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet var Body: UITextView!
    @IBOutlet var Subject: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SendEmail(_ sender: AnyObject) {
        guard MFMailComposeViewController.canSendMail()
            else {
                print("Mail services on this device are unavailable")
                return
        }
        
        var SubjectText = "Recipe Request: "
        SubjectText += Subject.text!
        
        var MessageBody =  Body
        
        var toRecipients = ["danyaaalk@gmail.com"]
        
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(SubjectText)
        mc.setMessageBody(MessageBody!.text, isHTML: false)
        mc.setToRecipients(toRecipients)
        self.present(mc, animated: true, completion: nil)
        
        
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
    
        switch result.rawValue{
            

            
        case MFMailComposeResult.cancelled.rawValue:
            NSLog("Result Cancelled")
        case MFMailComposeResult.saved.rawValue:
            NSLog("Mail Saved")
        case MFMailComposeResult.sent.rawValue:
            NSLog("Mail Sent")
        case MFMailComposeResult.failed.rawValue:
            NSLog("Mail Sent Failure: %@", [error!.localizedDescription])
            
        default:
            break
            
        }
        self.dismiss(animated: true, completion: nil)
    }
}
