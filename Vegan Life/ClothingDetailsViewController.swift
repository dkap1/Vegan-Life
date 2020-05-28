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
    
    @IBOutlet weak var cdetailsUrl: UITextView!
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
    
        cdetailsName.text = selectedClothing?.name
        cdetailsAddress.text = selectedClothing?.address
        cdetailsPhone.text = selectedClothing?.phoneno
        cdetailsEmail.text = selectedClothing?.emailaddress
        cdetailsUrl.text = selectedClothing?.url
        cdetailsDescription.text = selectedClothing?.businessdescription
 
        
        cdetailsName.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsAddress.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsPhone.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsEmail.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsUrl.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
        cdetailsDescription.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
       
        cdetailsName.frame.size.width = W * 1
        cdetailsName.center.x = W * 0.5
        cdetailsName.frame.size.height = H * 0.3
        cdetailsName.center.y = H * 0.2
              
         cdetailsAddress.frame.size.width = W * 1
         cdetailsAddress.center.x = W * 0.5
         cdetailsAddress.frame.size.height = H * 0.1
         cdetailsAddress.center.y = H * 0.35
              
         cdetailsPhone.frame.size.width = W * 1
         cdetailsPhone.center.x = W * 0.5
         cdetailsPhone.frame.size.height = H * 0.1
         cdetailsPhone.center.y = H * 0.42
              
         cdetailsEmail.frame.size.width = W * 1
         cdetailsEmail.center.x = W * 0.5
         cdetailsEmail.frame.size.height = H * 0.1
         cdetailsEmail.center.y = H * 0.5
              
         cdetailsUrl.frame.size.width = W * 1
         cdetailsUrl.center.x = W * 0.5
         cdetailsUrl.frame.size.height = H * 0.05
         cdetailsUrl.center.y = H * 0.45
              
         cdetailsDescription.frame.size.width = W * 1
         cdetailsDescription.center.x = W * 0.5
         cdetailsDescription.frame.size.height = H * 0.1
         cdetailsDescription.center.y = H * 0.6
        
          
          
        
        
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
