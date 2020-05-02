//
//  VideoViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 22/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
import Social

class VideoViewController: UIViewController {
   
       var selectedRecipe: RecipeModel?
       var favorites  = [RecipeModel]()
 
  
    


   // var recipe: Recipe = Recipe()
    
   
    
    
    
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var recipeVideoTitle: UILabel!
    @IBOutlet weak var recipeIngredients: UITextView!
    @IBOutlet weak var recipeLiked: UIButton!
    @IBOutlet weak var rpcookingtime: UILabel!
    @IBOutlet weak var rpserving: UILabel!
    @IBOutlet weak var rpauthor: UILabel!
    var activityItems: [Any] = []
    

    override func viewDidLoad() {
    self.view.backgroundColor = UIColor.init(red: 147/255, green: 179/255, blue: 89/255, alpha: 1)
        recipeIngredients.backgroundColor = UIColor.init(red: 147/255, green: 179/255, blue: 89/255, alpha: 1)
        super.viewDidLoad()
        
       
       

      //         recipeVideoTitle.text = recipe.Title
     //   getVideo(videoKey: recipe.Key)
        
//        recipeVideoTitle.text = selectedRecipe?.recipetitle
        getVideo(videoKey: selectedRecipe!.recipekey!)
        recipeIngredients.text = selectedRecipe?.recipeingredients
        rpcookingtime.text = selectedRecipe?.recipecookingtime
        rpserving.text = selectedRecipe?.recipeserving
        rpauthor.text = selectedRecipe?.recipeauthor

        
        
         navigationItem.title = selectedRecipe?.recipetitle
      //   navigationController?.navigationBar.prefersLargeTitles = true
         
        if favorites.contains(selectedRecipe!){
            recipeLiked.isHidden = false
            
        }else {
                self.recipeLiked.isHidden = true
            }
        }
        
        // Do any additional setup after loading the view.
    
    
    func getVideo(videoKey: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        videoWebView.loadRequest(URLRequest(url: url!))
        
    }
    @IBAction func shareButton(_ sender: Any) {
        
        var recipeMessage = "Hey, check out this recipe for \(selectedRecipe!.recipetitle!)"
        var recipeMessage1 = "I found it on the VeganLife iOS app."
        var url = URL(string: "https://www.youtube.com/embed/\(selectedRecipe!.recipekey!)")
               activityItems.append(recipeMessage)
               activityItems.append(recipeMessage1)
               activityItems.append(url)
        


        let activityController = UIActivityViewController(activityItems: activityItems,
        applicationActivities: nil)
  
            
         present(activityController, animated: true, completion: nil)
           }
    
}
            
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  

