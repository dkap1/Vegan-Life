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

class RequestRecipeViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet var Body: UITextView!
    @IBOutlet var Subject: UITextField!
    @IBOutlet weak var emailSubmit: UIButton!
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height

    
    override func viewDidLoad() {
        
        emailSubmit.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
                      emailSubmit.layer.cornerRadius = 25.0
                      emailSubmit.tintColor = UIColor.white
        emailSubmit.frame.size.width = W * 0.85
        emailSubmit.center.x = W * 0.5
        emailSubmit.frame.size.height = H * 0.09
        emailSubmit.center.y = H * 0.85
        
        
                    
                    
        
        
        Body.delegate = self
        Subject.delegate = self
        
        
        Body.text = "Enter Business Information..."
        Body.textColor = UIColor.lightGray
        
        let colour = UIColor.lightGray.cgColor
               Body.layer.borderColor = colour
               Body.layer.borderWidth = 0.5
               Body.layer.cornerRadius = 5
        
        self.view.backgroundColor = UIColor.init(red:188/255, green: 188/255, blue: 188/255, alpha: 1)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            Subject.frame.size.width = W * 0.9
            Subject.center.x = W * 0.5
            Subject.frame.size.height = H * 0.05
            Subject.center.y = H * 0.2
        
            Body.frame.size.width = W * 0.9
            Body.center.x = W * 0.5
            Body.frame.size.height = H * 0.5
            Body.center.y = H * 0.5
        
        
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
                 Body.text = "Enter Business Information"
                Body.textColor = UIColor.lightGray
                 
             }
        
          
         }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

     
    
}
