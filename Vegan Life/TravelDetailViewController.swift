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
    
    @IBOutlet weak var travelDetailsAddress: UILabel!
    
    @IBOutlet weak var travelDetailsPhone: UILabel!
    
    @IBOutlet weak var travelDetailsEmail: UILabel!
    
    @IBOutlet weak var travelDetailsDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        travelDetailsName.text = selectedHoliday?.name
        
        travelDetailsAddress.text = selectedHoliday?.address
        
        travelDetailsPhone.text = selectedHoliday?.phoneno
        
        travelDetailsEmail.text = selectedHoliday?.emailaddress
        
        travelDetailsDescription.text = selectedHoliday?.businessdescription
        
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
