//
//  LocationView.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 07/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

@IBDesignable class LocationView: BaseView {
    
    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow: (() -> Void)?
    
    
    @IBAction func allowAction(_ sender: UIButton){
     didTapAllow?()
    }
    
    @IBAction func denyAction(_ sender: UIButton){
        
    }

    
}
