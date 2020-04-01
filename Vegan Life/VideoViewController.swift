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

    


    var recipe:Recipe = Recipe()
    var recipeMessage1 = "Hey, check out this recipe!"
    var recipeMessage2 = "I found it on the VeganLife iOS app."
   
    
    
    
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var recipeVideoTitle: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeVideoTitle.text = recipe.Title
        getVideo(videoKey: recipe.Key)
        

        
        
        
        // Do any additional setup after loading the view.
    }
    
    func getVideo(videoKey: String) {
        
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        videoWebView.loadRequest(URLRequest(url: url!))
        
    }
    @IBAction func shareButton(_ sender: Any) {

        let activityController = UIActivityViewController(activityItems: [String("Hey, check out this recipes I found on the VeganLife iOS app:"), recipe.Title, URL(string: "https://www.youtube.com/embed/\(recipe.Key)")],
            applicationActivities: nil)
            
         present(activityController, animated: true, completion: nil)
           }
            
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
}
