//
//  ShoppingDetailsViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class ShoppingDetailsViewController: UIViewController {

     var selectedGrocery: GroceryModel?
    
    @IBOutlet weak var shoppingDetailsName: UILabel!
    
    @IBOutlet weak var shoppingDetailsAddress: UILabel!
    
    @IBOutlet weak var shoppingDetailsPhone: UILabel!
    
    @IBOutlet weak var shoppingDetailsEmail: UILabel!
    
    @IBOutlet weak var shoppingDetailsDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingDetailsName.text = selectedGrocery?.name
        shoppingDetailsAddress.text = selectedGrocery?.address
        shoppingDetailsPhone.text = selectedGrocery?.phoneno
        shoppingDetailsEmail.text = selectedGrocery?.emailaddress
        shoppingDetailsDescription.text = selectedGrocery?.businessdescription
        
        

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
