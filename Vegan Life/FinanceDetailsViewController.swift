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
    
    
    
    @IBOutlet weak var financeDetailsDescription: UITextView!
    
    override func viewDidLoad() {
      
        self.view.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
        
        financeDetailsName.text = selectedFinance?.name
        financeDetailsAddress.text = selectedFinance?.address
        financeDetailsPhone.text = selectedFinance?.phoneno
        financeDetailsEmail.text = selectedFinance?.emailaddress
        financeDetailsCategory.text  = selectedFinance?.category
        financeDetailsDescription.text = selectedFinance?.businessdescription
    
        financeDetailsName.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
              financeDetailsAddress.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
              financeDetailsPhone.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
              financeDetailsEmail.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
              financeDetailsCategory.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
              financeDetailsDescription.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
          
        
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
