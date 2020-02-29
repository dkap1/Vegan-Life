//
//  likeRecipe.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 29/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class likeRecipe {
     
    let container: UIView
    let layoutConstraint: NSLayoutConstraint
    
    init(container: UIView, layoutConstraint: NSLayoutConstraint){
        
        self.container = container
        self.layoutConstraint = layoutConstraint
    }
    
    func animate(completion: @escaping () -> Void){
        
        layoutConstraint.constant = 100
        
        UIView.animate(withDuration: 0.7,
                    delay: 0,
                    usingSpringWithDamping: 0.5,
                    initialSpringVelocity: 2,
                    options: .curveLinear,
                    animations: {[weak self] in
                        self?.container.layoutIfNeeded()
        }) { [weak self] (_) in
            
            self?.layoutConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self?.container.layoutIfNeeded()
                completion()
                
                
            })
            
            
            
        }
        
        
        
             
    
    
    
    
    
    
}
}
