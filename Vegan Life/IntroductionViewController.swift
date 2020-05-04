//
//  IntroductionViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 05/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.systemTeal
        beginButton.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        beginButton.layer.cornerRadius = 25.0
        beginButton.tintColor = UIColor.white
        
        
        super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    

}
