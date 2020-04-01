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
    @IBAction func menuAll(_ sender: Any) {
        self.performSegue(withIdentifier: "allMenu", sender: self)
    }
    
    
    override func viewDidLoad() {
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
