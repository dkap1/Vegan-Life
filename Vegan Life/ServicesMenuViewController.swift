//
//  ServicesMenuViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class ServicesMenuViewController: UIViewController {

    @IBAction func menuFinance(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "FinanceSegue", sender: self)
    }
    @IBAction func menuClothing(_ sender: Any) {
        self.performSegue(withIdentifier: "ClothingSegue", sender: self)
    }
    @IBAction func menuTravel(_ sender: Any) {
        self.performSegue(withIdentifier: "HolidaySegue", sender: self)
    }
    @IBAction func menuShopping(_ sender: Any) {
        self.performSegue(withIdentifier: "ShoppingSegue", sender: self)
    }
    @IBAction func requestSButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toRequest", sender: self)
    }
    
    
    @IBOutlet weak var financeButton: UIButton!
    
    @IBOutlet weak var clothingButton: UIButton!
    
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var shoppingButton: UIButton!
    
    @IBOutlet weak var requestButton: UIButton!
    
    override func viewDidLoad() {
         self.view.backgroundColor = UIColor.init(red: 202/255, green: 236/255, blue: 84/255, alpha: 1)
        super.viewDidLoad()

        
        financeButton.backgroundColor = UIColor.init(red: 255/255, green: 25/255, blue: 50/255, alpha: 1)
        financeButton.layer.cornerRadius = 25.0
        financeButton.tintColor = UIColor.white
        
        clothingButton.backgroundColor = UIColor.init(red: 249/255, green: 162/255, blue: 0/255, alpha: 1)
        clothingButton.layer.cornerRadius = 25.0
        clothingButton.tintColor = UIColor.white
        
        travelButton.backgroundColor = UIColor.init(red: 128/255, green: 11/255, blue: 86/255, alpha: 1)
        travelButton.layer.cornerRadius = 25.0
        travelButton.tintColor = UIColor.white
        
        shoppingButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        shoppingButton.layer.cornerRadius = 25.0
        shoppingButton.tintColor = UIColor.white
        
        requestButton.backgroundColor = UIColor.init(red:134/255, green: 136/255, blue: 138/255, alpha: 1)
               requestButton.layer.cornerRadius = 25.0
               requestButton.tintColor = UIColor.white
        
        
        
       
        
        
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
