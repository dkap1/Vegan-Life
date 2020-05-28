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
    
    @IBOutlet weak var healthTitle: UILabel!
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height

    @IBOutlet weak var doctorLabel: UILabel!
    
    @IBOutlet weak var hospitalLabel: UILabel!
    
    @IBOutlet weak var leafLabel: UILabel!
    
    @IBOutlet weak var pillLabel: UILabel!
    
    @IBOutlet weak var buttonStack: UIStackView!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.systemTeal
        beginButton.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        beginButton.layer.cornerRadius = 25.0
        beginButton.tintColor = UIColor.white
        
                    
        healthTitle.frame.size.width = W * 0.9
        healthTitle.center.x = W * 0.55
        healthTitle.frame.size.height = H * 0.5
        healthTitle.center.y = H * 0.2
                               
        beginButton.frame.size.width = W * 0.9
        beginButton.center.x = W * 0.50
        beginButton.frame.size.height = H * 0.1
        beginButton.center.y = H * 0.5
        
        doctorLabel.frame.size.width = W * 0.2
        doctorLabel.center.x = W * 0.22
        doctorLabel.frame.size.height = H * 0.2
        doctorLabel.center.y = H * 0.8
        
        hospitalLabel.frame.size.width = W * 0.2
        hospitalLabel.center.x = W * 0.44
        hospitalLabel.frame.size.height = H * 0.2
        hospitalLabel.center.y = H * 0.8
        
        leafLabel.frame.size.width = W * 0.2
        leafLabel.center.x = W * 0.66
        leafLabel.frame.size.height = H * 0.2
        leafLabel.center.y = H * 0.8
        
        pillLabel.frame.size.width = W * 0.2
        pillLabel.center.x = W * 0.88
        pillLabel.frame.size.height = H * 0.2
        pillLabel.center.y = H * 0.8
        
        
        
 
        
        super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    

}
