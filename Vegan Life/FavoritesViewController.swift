//
//  FavoritesViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 11/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  


    var favorites  = [RecipeModel]()
    var selectedRecipe: RecipeModel = RecipeModel()
   
    
   
    
    
    
   
    
    
    @IBOutlet weak var listFavTableView: UITableView!
    
    override func viewDidLoad() {
        
        self.listFavTableView.delegate = self
        self.listFavTableView.dataSource = self
       
        listFavTableView.reloadData()
    
        
        super.viewDidLoad()

     
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          favorites.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cellIdentifier: String = "favCell"
      let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
      var recipe: RecipeModel
      let placeholderImage = UIImage(named: "placeholderimg.png")
      cell.imageView?.image = placeholderImage
      recipe = favorites[indexPath.row]
      let url = "https://img.youtube.com/vi/\(recipe.recipekey!)/0.jpg"
      cell.imageView?.downloaded(from: url)
             
    
        cell.textLabel?.text = recipe.recipetitle
    
    
    
        
         return cell
                
              
              }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let remove = UIContextualAction(style: .destructive, title: "Remove") { (action, view, completionHandler) in
        self.favorites.remove(at: indexPath.row)
        self.listFavTableView.reloadData()
                
                completionHandler(true)
                   }
            let removed = UISwipeActionsConfiguration(actions: [remove])
                          return removed
                             

           }
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
      selectedRecipe = favorites[indexPath.row]
      self.performSegue(withIdentifier: "toFavRecipe", sender: self)
        
      }
            

                              
                     
       
      
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if (segue.identifier == "toFavRecipe"){
               let VVC = segue.destination as? VideoViewController
               VVC?.selectedRecipe = selectedRecipe
           
           
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

}



             
           
              
          
               

          
