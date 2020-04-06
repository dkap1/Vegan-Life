//
//  ClothingDetailsViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class ClothingDetailsViewController: UIViewController {
    
    var selectedClothing: ModelClothing!
    
    @IBOutlet weak var cdetailsName: UILabel!
    
    @IBOutlet weak var cdetailsAddress: UILabel!
    
    @IBOutlet weak var cdetailsPhone: UILabel!
    
    @IBOutlet weak var cdetailsEmail: UILabel!
    
    @IBOutlet weak var cdetailsCategory: UILabel!
    
    @IBOutlet weak var cdetailsDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cdetailsName.text = selectedClothing?.name
        cdetailsAddress.text = selectedClothing?.address
        cdetailsPhone.text = selectedClothing?.phoneno
        cdetailsEmail.text = selectedClothing?.emailaddress
        cdetailsCategory.text = selectedClothing?.category
        cdetailsDescription.text = selectedClothing?.businessdescription

       
        
        
        
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
