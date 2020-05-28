//
//  FavoritesViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 11/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit




class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
  

    var favorites  = [RecipeModel]()
    var selectedRecipe: RecipeModel = RecipeModel()
    var firstVC: FirstViewController?
  
    var textView = UITextView(frame: CGRect.zero)
           
    
  
   
    
    
    
    @IBOutlet weak var listFavTableView: UITableView!
    
    override func viewDidLoad() {
        
              
      
        self.listFavTableView.delegate = self
        self.listFavTableView.dataSource = self
     
        textView.delegate = self
    
        self.view.backgroundColor = UIColor.init(red:243/255, green: 107/255, blue: 140/255, alpha: 1)
        self.listFavTableView.backgroundColor = UIColor.init(red: 243/255, green: 107/255, blue: 140/255, alpha: 1)
        
  
    
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
        cell.backgroundColor = UIColor.init(red: 243/255, green:107/255, blue: 140/255, alpha: 1)
        
        
    
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
        

       
            self.textView.translatesAutoresizingMaskIntoConstraints = false
            self.textView.returnKeyType =  UIReturnKeyType.done
         
         

            let leadConstraint = NSLayoutConstraint(item: alert.view, attribute: .leading, relatedBy: .equal, toItem: self.textView, attribute: .leading, multiplier: 1.0, constant: -8.0)
            let trailConstraint = NSLayoutConstraint(item: alert.view, attribute: .trailing, relatedBy: .equal, toItem: self.textView, attribute: .trailing, multiplier: 1.0, constant: 8.0)

            let topConstraint = NSLayoutConstraint(item: alert.view, attribute: .top, relatedBy: .equal, toItem: self.textView, attribute: .top, multiplier: 1.0, constant: -64.0)
            let bottomConstraint = NSLayoutConstraint(item: alert.view, attribute: .bottom, relatedBy: .equal, toItem: self.textView, attribute: .bottom, multiplier: 1.0, constant: 64.0)
            alert.view.addSubview(self.textView)
            self.textView.text = self.favorites[indexPath.row].recipeingredients
         NSLayoutConstraint.activate([leadConstraint, trailConstraint, topConstraint, bottomConstraint])
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
         
           // self.firstVC?.favorites.remove(at: indexPath.row)
            
           // self.favorites[indexPath.row].recipeingredients = textView.text
           

            if self.favorites.contains(self.favorites[indexPath.row]){
                self.favorites[indexPath.row].recipeingredients = self.textView.text
                self.firstVC?.listRecipeTableView.reloadData()
                
                self.save()
                
                                          
                              
                              
                              }
                            
            
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: false)
                })
                let deleteAction = UITableViewRowAction(style: .default, title: "Remove", handler: { (action, indexPath) in
                    
                    let alert = UIAlertController(title: "Recipe Removed", message: "\(self.favorites[indexPath.row].recipetitle!) has been removed from your Favourites 💔", preferredStyle: .alert)
                                                      alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                                      self.present(alert, animated: true, completion: nil)
                    
                    
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
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
          override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)

              NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

              NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
          }

    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
          }

    @objc func keyboardWillChange(notification: NSNotification) {

              if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                  if textView.isFirstResponder {
                      self.view.frame.origin.y = -keyboardSize.height
                  }
              }
          }
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)

          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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

             
           
              
          
               

          
