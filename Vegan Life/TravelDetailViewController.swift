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
    
    @IBOutlet weak var travelDetailsUrl: UITextView!
    
    
    @IBOutlet weak var travelDetailsDescription: UITextView!
    
    let H = UIScreen.main.bounds.height
    let W = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)

        travelDetailsName.text = selectedHoliday?.name
        
        travelDetailsAddress.text = selectedHoliday?.address
        
        travelDetailsPhone.text = selectedHoliday?.phoneno
        
        travelDetailsEmail.text = selectedHoliday?.emailaddress
        
        travelDetailsUrl.text = selectedHoliday?.url
        
        travelDetailsDescription.text = selectedHoliday?.businessdescription
        
        travelDetailsName.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsAddress.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsPhone.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsEmail.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsUrl.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
        travelDetailsDescription.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
       travelDetailsName.frame.size.width = W * 1
       travelDetailsName.center.x = W * 0.5
       travelDetailsName.frame.size.height = H * 0.3
       travelDetailsName.center.y = H * 0.2
       
       travelDetailsAddress.frame.size.width = W * 1
       travelDetailsAddress.center.x = W * 0.5
       travelDetailsAddress.frame.size.height = H * 0.1
       travelDetailsAddress.center.y = H * 0.35
       
       travelDetailsPhone.frame.size.width = W * 1
       travelDetailsPhone.center.x = W * 0.5
       travelDetailsPhone.frame.size.height = H * 0.1
       travelDetailsPhone.center.y = H * 0.42
       
       travelDetailsEmail.frame.size.width = W * 1
       travelDetailsEmail.center.x = W * 0.5
       travelDetailsEmail.frame.size.height = H * 0.1
       travelDetailsEmail.center.y = H * 0.5
       
       travelDetailsUrl.frame.size.width = W * 1
       travelDetailsUrl.center.x = W * 0.5
       travelDetailsUrl.frame.size.height = H * 0.05
       travelDetailsUrl.center.y = H * 0.45
       
       travelDetailsDescription.frame.size.width = W * 1
       travelDetailsDescription.center.x = W * 0.5
       travelDetailsDescription.frame.size.height = H * 0.1
       travelDetailsDescription.center.y = H * 0.6
                 
                 
                 
                 
        
   
        
        
        
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
