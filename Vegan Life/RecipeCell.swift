//
//  RecipeCell.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 22/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell{

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleVideo: UILabel!

    @IBOutlet weak var heartButton: UIButton!

        
        
    
    
    
    
    
    @IBAction func tapLike(_ sender: UIButton) {
    
      if heartButton.tag == 0{
              heartButton.setImage(UIImage(named: "heart1" ), for: .normal)
              heartButton.tag = 1
          
      }
      else
      {
          
          heartButton.setImage(UIImage(named: "heart2" ), for: .normal)
            heartButton.tag = 0
         
                  }
              }
 
         
     
          }


