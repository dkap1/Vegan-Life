//
//  BaseView.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 07/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

@IBDesignable class BaseView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.configure()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    func configure() {
        
    }
}
