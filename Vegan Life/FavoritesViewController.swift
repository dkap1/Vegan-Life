//
//  FavoritesViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 11/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit




class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    var favorites  = [RecipeModel]()
    var selectedRecipe: RecipeModel = RecipeModel()
    var firstVC: FirstViewController?
  
    

   
    
    
    
    @IBOutlet weak var listFavTableView: UITableView!
    
    override func viewDidLoad() {
        
        self.listFavTableView.delegate = self
        self.listFavTableView.dataSource = self
       
        
    
    
  
    
        if let data = UserDefaults.standard.object(forKey: "favorites") as? Data {
        if let storedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? [RecipeModel] {

            favorites = storedData
            listFavTableView.reloadData()
            
        }
    }
        
        
        print(firstVC?.favorites)
        print("danyaal")
        print(favorites)
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          favorites.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cellIdentifier: String = "favCell"
      let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
   //   var recipe: RecipeModel
      let placeholderImage = UIImage(named: "placeholderimg.png")
      cell.imageView?.image = placeholderImage
     var recipe = favorites[indexPath.row]
      let url = "https://img.youtube.com/vi/\(recipe.recipekey!)/0.jpg"
      cell.imageView?.downloaded(from: url)
             
        
    
        cell.textLabel?.text = recipe.recipetitle
        
       
   
   
        
         return cell
                
              
              }
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
      selectedRecipe = favorites[indexPath.row]
      self.performSegue(withIdentifier: "toFavRecipe", sender: self)
        
      }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
        
            let alert = UIAlertController(title: "Edit \(self.favorites[indexPath.row].recipetitle!) Ingredients", message: "\n\n\n\n\n\n\n\n", preferredStyle: .alert)
         alert.view.autoresizesSubviews = true

         let textView = UITextView(frame: CGRect.zero)
         textView.translatesAutoresizingMaskIntoConstraints = false

         let leadConstraint = NSLayoutConstraint(item: alert.view, attribute: .leading, relatedBy: .equal, toItem: textView, attribute: .leading, multiplier: 1.0, constant: -8.0)
         let trailConstraint = NSLayoutConstraint(item: alert.view, attribute: .trailing, relatedBy: .equal, toItem: textView, attribute: .trailing, multiplier: 1.0, constant: 8.0)

         let topConstraint = NSLayoutConstraint(item: alert.view, attribute: .top, relatedBy: .equal, toItem: textView, attribute: .top, multiplier: 1.0, constant: -64.0)
         let bottomConstraint = NSLayoutConstraint(item: alert.view, attribute: .bottom, relatedBy: .equal, toItem: textView, attribute: .bottom, multiplier: 1.0, constant: 64.0)
         alert.view.addSubview(textView)
            textView.text = self.favorites[indexPath.row].recipeingredients
         NSLayoutConstraint.activate([leadConstraint, trailConstraint, topConstraint, bottomConstraint])
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
         
           // self.firstVC?.favorites.remove(at: indexPath.row)
            
           // self.favorites[indexPath.row].recipeingredients = textView.text
           

            if self.favorites.contains(self.favorites[indexPath.row]){
                                  self.favorites[indexPath.row].recipeingredients = textView.text
                self.firstVC?.listRecipeTableView.reloadData()
                
                self.save()
                
                                          
                              
                              
                              }
                            
                             
            
            
            
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: false)
                })
                let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
                    
                    if self.favorites.contains(self.favorites[indexPath.row]){
                        self.favorites.remove(at: indexPath.row)
                        self.firstVC?.favorites.remove(at: indexPath.row)
                        self.listFavTableView.reloadData()
                    
                    
                    }
                    else {
                        self.favorites.append(self.favorites[indexPath.row])
                    }
                    let data = NSKeyedArchiver.archivedData(withRootObject: self.favorites)
                                                   UserDefaults.standard.set(data, forKey: "favorites")
                                                   UserDefaults.standard.synchronize()
                    
                    
                  
                
                   
                   
                })
                return [deleteAction, editAction]
            
    }
    func save(){
        let data = NSKeyedArchiver.archivedData(withRootObject: favorites)
                          UserDefaults.standard.set(data, forKey: "favorites")
                          UserDefaults.standard.synchronize()
    }
            
           
        
        

        
    
    
    
    
                               

       
      
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if (segue.identifier == "toFavRecipe"){
               let VVC = segue.destination as? VideoViewController
               VVC?.selectedRecipe = selectedRecipe
               VVC?.favorites = favorites
           
           
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



             
           
              
          
               

          
