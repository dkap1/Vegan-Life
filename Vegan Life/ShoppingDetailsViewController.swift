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
    
    @IBOutlet weak var shoppingDetailsUrl: UITextView!
    
    
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        
        shoppingDetailsName.text = selectedGrocery?.name
        shoppingDetailsAddress.text = selectedGrocery?.address
        shoppingDetailsPhone.text = selectedGrocery?.phoneno
        shoppingDetailsEmail.text = selectedGrocery?.emailaddress
         shoppingDetailsUrl.text = selectedGrocery?.url
        shoppingDetailsDescription.text = selectedGrocery?.businessdescription
        
        shoppingDetailsName.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsAddress.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsPhone.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsEmail.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
         shoppingDetailsUrl.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        shoppingDetailsDescription.backgroundColor = UIColor.init(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        
       shoppingDetailsName.frame.size.width = W * 1
       shoppingDetailsName.center.x = W * 0.5
       shoppingDetailsName.frame.size.height = H * 0.3
       shoppingDetailsName.center.y = H * 0.2
       
       shoppingDetailsAddress.frame.size.width = W * 1
       shoppingDetailsAddress.center.x = W * 0.5
       shoppingDetailsAddress.frame.size.height = H * 0.1
       shoppingDetailsAddress.center.y = H * 0.35
       
       shoppingDetailsPhone.frame.size.width = W * 1
       shoppingDetailsPhone.center.x = W * 0.5
       shoppingDetailsPhone.frame.size.height = H * 0.1
       shoppingDetailsPhone.center.y = H * 0.42
       
       shoppingDetailsEmail.frame.size.width = W * 1
       shoppingDetailsEmail.center.x = W * 0.5
       shoppingDetailsEmail.frame.size.height = H * 0.1
       shoppingDetailsEmail.center.y = H * 0.5
       
       shoppingDetailsUrl.frame.size.width = W * 1
       shoppingDetailsUrl.center.x = W * 0.5
       shoppingDetailsUrl.frame.size.height = H * 0.05
       shoppingDetailsUrl.center.y = H * 0.45
       
       shoppingDetailsDescription.frame.size.width = W * 1
       shoppingDetailsDescription.center.x = W * 0.5
       shoppingDetailsDescription.frame.size.height = H * 0.1
       shoppingDetailsDescription.center.y = H * 0.6
                  
                  
                  
        
        
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
