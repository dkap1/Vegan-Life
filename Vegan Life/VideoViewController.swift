//
//  VideoViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 22/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
import Social

class VideoViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
   
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
    
    @IBOutlet weak var clock: UIImageView!
    @IBOutlet weak var fork: UIImageView!
    @IBOutlet weak var chef: UIImageView!
    
    @IBOutlet weak var rpgf: UIImageView!
    @IBOutlet weak var rpnuts: UIImageView!
    @IBOutlet weak var shareRpButton: UIButton!
    var activityItems: [Any] = []
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height

    override func viewDidLoad() {
       //videoWebView?.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
    self.view.backgroundColor = UIColor.init(red: 147/255, green: 179/255, blue: 89/255, alpha: 1)
        recipeIngredients.backgroundColor = UIColor.init(red: 147/255, green: 179/255, blue: 89/255, alpha: 1)
        super.viewDidLoad()
        
        self.videoWebView.isMultipleTouchEnabled = true
       
       
        shareRpButton.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        shareRpButton.layer.cornerRadius = 25.0
        shareRpButton.tintColor = UIColor.white
        
        
        videoWebView.frame.size.width = W * 1
        videoWebView.center.x = W * 0.50
        videoWebView.backgroundColor = UIColor.init(red: 147/255, green: 179/255, blue: 89/255, alpha: 1)
        videoWebView.frame.size.height = H * 0.35
        videoWebView.center.y = H * 0.25

        
        rpauthor.frame.size.width = W * 0.4
        rpauthor.center.x = W * 0.26
        rpauthor.frame.size.height = H * 0.35
        rpauthor.center.y = H * 0.45
        
        rpserving.frame.size.width = W * 0.30
        rpserving.center.x = W * 0.22
        rpserving.frame.size.height = H * 0.36
        rpserving.center.y = H * 0.48
        
        rpcookingtime.frame.size.width = W * 0.30
        rpcookingtime.center.x = W * 0.22
        rpcookingtime.frame.size.height = H * 0.37
        rpcookingtime.center.y = H * 0.51
        
        recipeIngredients.frame.size.width = W * 1
        recipeIngredients.center.x = W * 0.50
        recipeIngredients.frame.size.height = H * 0.20
        recipeIngredients.center.y = H * 0.65
        
        shareRpButton.frame.size.width = W * 0.85
        shareRpButton.center.x = W * 0.50
        shareRpButton.frame.size.height = H * 0.09
        shareRpButton.center.y = H * 0.85
        
        chef.frame.size.width = W * 0.05
        chef.center.x = W * 0.03
        chef.frame.size.height = H * 0.05
        chef.center.y = H * 0.45
        
        fork.frame.size.width = W * 0.05
        fork.center.x = W * 0.03
        fork.frame.size.height = H * 0.05
        fork.center.y = H * 0.48
        
        
        clock.frame.size.width = W * 0.05
        clock.center.x = W * 0.03
        clock.frame.size.height = H * 0.05
        clock.center.y = H * 0.51
        
        
       
        
      //         recipeVideoTitle.text = recipe.Title
     //   getVideo(videoKey: recipe.Key)
        
//        recipeVideoTitle.text = selectedRecipe?.recipetitle
        getVideo(videoKey: selectedRecipe!.recipekey!)
        recipeIngredients.text = selectedRecipe?.recipeingredients
       rpcookingtime.text = selectedRecipe?.recipecookingtime
       rpserving.text = selectedRecipe?.recipeserving
       rpauthor.text = selectedRecipe?.recipeauthor

        if selectedRecipe?.recipenuts == "yes"{
            rpnuts.isHidden = false
            rpnuts.frame.size.width = W * 0.05
            rpnuts.center.x = W * 0.9
            rpnuts.frame.size.height = H * 0.05
            rpnuts.center.y = H * 0.48
            
        }
        if selectedRecipe?.recipegf == "yes"{
            rpgf.isHidden = false
            rpgf.frame.size.width = W * 0.05
            rpgf.center.x = W * 0.9
            rpgf.frame.size.height = H * 0.05
            rpgf.center.y = H * 0.52
            
        }
        
         navigationItem.title = selectedRecipe?.recipetitle
      //   navigationController?.navigationBar.prefersLargeTitles = true
         
        if favorites.contains(where: { $0.recipeid == selectedRecipe?.recipeid }) {
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
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
      scrollView.pinchGestureRecognizer?.isEnabled = true
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
  

