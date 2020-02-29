//
//  DanyaalKapadiaTableViewCell.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 29/02/2020.
//
//  RecipeCell.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 22/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class Recipecell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleVideo: UILabel!
    @IBOutlet weak var heartButton: UIButton!
  
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
    
    @IBAction func heartClick(_ sender: UIButton) {
        if heartButton.tag == 0{
            heartButton.setImage(UIImage(named: "heart" ), for: .normal)
            heartButton.tag = 1
        
    }
    else
    {
       
        heartButton.setImage(UIImage(named: "heart.fill" ), for: .normal)
        heartButton.tag = 0
                }
            }
   
        }

