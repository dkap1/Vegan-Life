//
//  LikeAnimator.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 28/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class LikeAnimator {
    
    let container: UIView
    let layoutConstriant: NSLayoutConstraint
    
    init(container: UIView, layoutConstriant: NSLayoutConstraint) {
        
        self.container = container
        self.layoutConstriant = layoutConstriant
        
    }
    
    func animate(completion: @escaping () -> Void) {
        
        layoutConstriant.constant = 100
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 2,
                       options: .curveLinear,
                       animations: {
                        
                        self.container.layoutIfNeeded()
                        
        }) { [weak self] (_) in

            self?.layoutConstriant.constant = 0
                   UIView.animate(withDuration: 0.3, animations: {

                    self?.container.layoutIfNeeded()
                    completion()

                    })
                }
            }
                        
                        
                        
    
        
                      
      
}
