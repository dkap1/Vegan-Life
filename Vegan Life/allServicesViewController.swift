//
//  allServicesViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class allServicesViewController: UIViewController {

     var selectedService: ServicesModel?
    
    @IBOutlet weak var allServicesName: UILabel!
    
    @IBOutlet weak var allServicesAddress: UILabel!
    
    @IBOutlet weak var allServicesPhone: UILabel!
    
    @IBOutlet weak var allServicesEmail: UILabel!
    
    @IBOutlet weak var allServicesDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allServicesName.text = selectedService?.name
        allServicesAddress.text = selectedService?.address
        allServicesPhone.text = selectedService?.phoneno
        allServicesEmail.text = selectedService?.emailaddress
        allServicesDescription.text = selectedService?.businessdescription
        
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
