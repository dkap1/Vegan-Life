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
    
    @IBOutlet weak var shoppingDetailsAddress: UITextView!
    
    @IBOutlet weak var shoppingDetailsPhone: UITextView!
    
    @IBOutlet weak var shoppingDetailsEmail: UILabel!
    
    @IBOutlet weak var shoppingDetailsCategory: UILabel!
    
    
    @IBOutlet weak var shoppingDetailsDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        
        shoppingDetailsName.text = selectedGrocery?.name
        shoppingDetailsAddress.text = selectedGrocery?.address
        shoppingDetailsPhone.text = selectedGrocery?.phoneno
        shoppingDetailsEmail.text = selectedGrocery?.emailaddress
         shoppingDetailsCategory.text = selectedGrocery?.category
        shoppingDetailsDescription.text = selectedGrocery?.businessdescription
        
        shoppingDetailsName.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsAddress.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsPhone.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsEmail.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
         shoppingDetailsCategory.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsDescription.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        

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
