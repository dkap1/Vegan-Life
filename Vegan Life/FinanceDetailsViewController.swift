//
//  FinanceDetailsViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class FinanceDetailsViewController: UIViewController {

    var selectedFinance: FinanceModel?
    
    @IBOutlet weak var financeDetailsName: UILabel!
    
    @IBOutlet weak var financeDetailsPhone: UITextView!
   
    @IBOutlet weak var financeDetailsAddress: UITextView!
    
    @IBOutlet weak var financeDetailsEmail: UILabel!
    
    @IBOutlet weak var financeDetailsCategory: UILabel!
    
    @IBOutlet weak var financeDetailsUrl: UITextView!
    
    
    @IBOutlet weak var financeDetailsDescription: UITextView!
    
    let H = UIScreen.main.bounds.height
    let W = UIScreen.main.bounds.width
    
    
    override func viewDidLoad() {
      
        self.view.backgroundColor = UIColor.init(red:255/255, green: 160/255, blue: 122/255, alpha: 1)
        
        financeDetailsName.text = selectedFinance?.name
        financeDetailsAddress.text = selectedFinance?.address
        financeDetailsPhone.text = selectedFinance?.phoneno
        financeDetailsEmail.text = selectedFinance?.emailaddress
        financeDetailsUrl.text  = selectedFinance?.url
        financeDetailsDescription.text = selectedFinance?.businessdescription
    
        financeDetailsName.backgroundColor = UIColor.init(red:255/255, green: 160/255, blue: 122/255, alpha: 1)
              financeDetailsAddress.backgroundColor = UIColor.init(red:255/255, green: 160/255, blue: 122/255, alpha: 1)
              financeDetailsPhone.backgroundColor =  UIColor.init(red:255/255, green: 160/255, blue: 122/255, alpha: 1)
              financeDetailsEmail.backgroundColor = UIColor.init(red:255/255, green: 160/255, blue: 122/255, alpha: 1)
              financeDetailsUrl.backgroundColor =  UIColor.init(red:255/255, green: 160/255, blue: 122/255, alpha: 1)
              financeDetailsDescription.backgroundColor = UIColor.init(red:255/255, green: 160/255, blue: 122/255, alpha: 1)
          
        financeDetailsName.frame.size.width = W * 1
        financeDetailsName.center.x = W * 0.5
        financeDetailsName.frame.size.height = H * 0.3
        financeDetailsName.center.y = H * 0.2
        
        financeDetailsAddress.frame.size.width = W * 1
        financeDetailsAddress.center.x = W * 0.5
        financeDetailsAddress.frame.size.height = H * 0.1
        financeDetailsAddress.center.y = H * 0.35
        
        financeDetailsPhone.frame.size.width = W * 1
        financeDetailsPhone.center.x = W * 0.5
        financeDetailsPhone.frame.size.height = H * 0.1
        financeDetailsPhone.center.y = H * 0.42
        
        financeDetailsEmail.frame.size.width = W * 1
        financeDetailsEmail.center.x = W * 0.5
        financeDetailsEmail.frame.size.height = H * 0.1
        financeDetailsEmail.center.y = H * 0.5
        
        financeDetailsUrl.frame.size.width = W * 1
        financeDetailsUrl.center.x = W * 0.5
        financeDetailsUrl.frame.size.height = H * 0.05
        financeDetailsUrl.center.y = H * 0.45
        
        financeDetailsDescription.frame.size.width = W * 1
        financeDetailsDescription.center.x = W * 0.5
        financeDetailsDescription.frame.size.height = H * 0.1
        financeDetailsDescription.center.y = H * 0.6
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
