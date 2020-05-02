//
//  TravelDetailViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class TravelDetailViewController: UIViewController {
   var selectedHoliday: HolidayModel?
    
    @IBOutlet var travelDetailsName: UILabel!
    
    @IBOutlet weak var travelDetailsAddress: UITextView!
    
    @IBOutlet weak var travelDetailsPhone: UITextView!
    
    @IBOutlet weak var travelDetailsEmail: UILabel!
    
    @IBOutlet weak var travelDetailsCategory: UILabel!
    
    @IBOutlet weak var travelDetailsDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)

        travelDetailsName.text = selectedHoliday?.name
        
        travelDetailsAddress.text = selectedHoliday?.address
        
        travelDetailsPhone.text = selectedHoliday?.phoneno
        
        travelDetailsEmail.text = selectedHoliday?.emailaddress
        
        travelDetailsCategory.text = selectedHoliday?.category
        
        travelDetailsDescription.text = selectedHoliday?.businessdescription
        
        travelDetailsName.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsAddress.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsPhone.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsEmail.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsCategory.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsDescription.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
     
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
