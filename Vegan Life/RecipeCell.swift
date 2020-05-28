//
//  RecipeCell.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 22/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

protocol RecipeCellDelegate {
   func favoriteButtonTapped()
}

class RecipeCell: UITableViewCell{

     var buttonPressed : (() -> ()) = {}
     var delegate: RecipeCellDelegate?
    
    let H = UIScreen.main.bounds.height
    let W = UIScreen.main.bounds.width
    
     
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleVideo: UILabel!
    
    
    
    
    @IBOutlet weak var heartButton: UIButton!
  
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        delegate?.favoriteButtonTapped()
    }
    
    
    
   

    
    
    
    
    @IBAction func tapLike(_ sender: UIButton) {
    
      if heartButton.tag == 0{
              heartButton.setImage(UIImage(named: "heart1" ), for: .normal)
              heartButton.tag = 1
             // buttonPressed()
            
      
               
           }
           
          
      
      else
      {
          
          heartButton.setImage(UIImage(named: "heart2" ), for: .normal)
            heartButton.tag = 0
            
         
                  }
              }
 
    

     
          }



