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

class RequestRecipeViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextViewDelegate {
    @IBOutlet var Body: UITextView!
    @IBOutlet var Subject: UITextField!
    @IBOutlet weak var emailSubmit: UIButton!
    
    override func viewDidLoad() {
        
        emailSubmit.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
                      emailSubmit.layer.cornerRadius = 25.0
                      emailSubmit.tintColor = UIColor.white
        
        Body.delegate = self
        
        Body.text = "Enter Business Information..."
        Body.textColor = UIColor.lightGray
        
        let colour = UIColor.lightGray.cgColor
               Body.layer.borderColor = colour
               Body.layer.borderWidth = 0.5
               Body.layer.cornerRadius = 5
        
        self.view.backgroundColor = UIColor.init(red:188/255, green: 188/255, blue: 188/255, alpha: 1)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SendEmail(_ sender: AnyObject) {
        guard MFMailComposeViewController.canSendMail()
            else {
                print("Mail services on this device are unavailable")
                return
        }
        
        var SubjectText = "Request To Add Business: "
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
    func textViewDidBeginEditing(_ textView: UITextView) {
             if Body.textColor == UIColor.lightGray {
                Body.text = nil
                Body.textColor = UIColor.black
             }
         
         }
         func textViewDidEndEditing(_ textView: UITextView) {
             if Body.text.isEmpty{
                 Body.text = "Enter Recipe Ingredients"
                Body.textColor = UIColor.lightGray
                 
             }
        
          
         }
    
}
