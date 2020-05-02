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
    
    @IBOutlet weak var cdetailsAddress: UITextView!
    
    @IBOutlet weak var cdetailsPhone: UITextView!
    
    @IBOutlet weak var cdetailsEmail: UILabel!
    
    @IBOutlet weak var cdetailsCategory: UILabel!
    
    @IBOutlet weak var cdetailsDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
    
        cdetailsName.text = selectedClothing?.name
        cdetailsAddress.text = selectedClothing?.address
        cdetailsPhone.text = selectedClothing?.phoneno
        cdetailsEmail.text = selectedClothing?.emailaddress
        cdetailsCategory.text = selectedClothing?.category
        cdetailsDescription.text = selectedClothing?.businessdescription
 
        
        cdetailsName.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsAddress.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsPhone.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsEmail.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsCategory.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsDescription.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
       
        
        
        
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
