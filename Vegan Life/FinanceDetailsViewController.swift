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
    
    @IBOutlet weak var financeDetailsPhone: UILabel!
   
    @IBOutlet weak var financeDetailsAddress: UILabel!
    
    @IBOutlet weak var financeDetailsEmail: UILabel!
    
    
    @IBOutlet weak var financeDetailsDescription: UILabel!
    
    override func viewDidLoad() {
      
        financeDetailsName.text = selectedFinance?.name
        financeDetailsAddress.text = selectedFinance?.address
        financeDetailsPhone.text = selectedFinance?.phoneno
        financeDetailsEmail.text = selectedFinance?.emailaddress
        financeDetailsDescription.text = selectedFinance?.businessdescription
    
        
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
