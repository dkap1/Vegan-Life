import UIKit
import CoreData


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipeHomeModelProtocol {
   
    
    

     var feedItems = [RecipeModel]()
     var selectedRecipe: RecipeModel = RecipeModel()
     var filteredRecipe = [RecipeModel]()
     var resultSearchController = UISearchController()
     var favorites  = [RecipeModel]()
     var dan = FavoritesViewController()
     var isLiked = false
     var heartButton = RecipeCell()
   
     
    
    
   
     
    
    
    
    
     let searchController = UISearchController(searchResultsController: nil)
     

     
    @IBOutlet var listRecipeTableView: UITableView!
 
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor.init(red: 147/255, green: 179/255, blue: 89/255, alpha: 1)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
               self.listRecipeTableView.delegate = self
               self.listRecipeTableView.dataSource = self
               
               let recipeModel = RecipeHomeModel()
               recipeModel.delegate = self
               recipeModel.downloadItems()
        
       let add = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(self.action(sender:)))
        
        let refresh = UIBarButtonItem.init(barButtonSystemItem: .bookmarks, target: self, action: #selector(self.refresh(sender:)))
        
      
       
    
     navigationItem.rightBarButtonItems = [add, refresh]
         
      
        listRecipeTableView.tableFooterView = UIView()
        setupSearchController()
    
       navigationItem.largeTitleDisplayMode = .always
      

            if let data = UserDefaults.standard.object(forKey: "favorites") as? Data {
            if let storedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? [RecipeModel] {
                favorites = storedData
              
                   
                  
                }

            
            
        }
            
       
       
    }
           

   @objc func action(sender: UIBarButtonItem) {
    let newViewController = storyboard?.instantiateViewController(withIdentifier: "AddRecipeViewController") as! AddRecipeViewController
    self.navigationController?.pushViewController(newViewController, animated: true)
       
    }
  @objc func refresh(sender: UIBarButtonItem) {
  performSegue(withIdentifier: "toFav", sender: self)
    
    
      
 }
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items as! [RecipeModel]
           self.listRecipeTableView.reloadData()
           print(items)
       }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return recipes.count
           if searchController.isActive && searchController.searchBar.text != "" {
                   return filteredRecipe.count
               }
               
               return feedItems.count
           }
      
   
    
        
        
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "recipeCell"
           let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
            myCell.tag = indexPath.row
        var recipe: RecipeModel
        let placeholderImage = UIImage(named: "placeholderimg.png")
        myCell.imageView?.image = placeholderImage
        if searchController.isActive && searchController.searchBar.text != "" {
            recipe = filteredRecipe[indexPath.row]

            let url = "https://img.youtube.com/vi/\(recipe.recipekey!)/0.jpg"
            myCell.imageView?.downloaded(from: url)
        } else {
            recipe = feedItems[indexPath.row]
            let url = "https://img.youtube.com/vi/\(recipe.recipekey!)/0.jpg"
            myCell.imageView?.downloaded(from: url)
        // let item: RecipeModel = feedItems[indexPath.row] as! RecipeModel
        
         
        
        }
           myCell.textLabel!.text = recipe.recipetitle
           
          
        
     
        
  
         
    
     return myCell
       
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    if searchController.isActive && searchController.searchBar.text != "" {
        selectedRecipe = filteredRecipe[indexPath.row]
        }
      else {
        selectedRecipe = feedItems[indexPath.row]
        
        //selectedRecipe = feedItems[indexPath.row] as! RecipeModel'
    
        }
      
        
    self.performSegue(withIdentifier: "toRecipe", sender: self)
      
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if self.searchController.isActive && self.searchController.searchBar.text != "" {
            if favorites.contains(filteredRecipe[indexPath.row]){
        
          return false
            }
        }
        else {
            if favorites.contains(feedItems[indexPath.row]){
                   
                     return false
                       }
        }
        return true
      }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
               let unfavorite =  UIContextualAction(style: .destructive, title: "Unfavorite") { (action, view, completionHandler) in
                if self.searchController.isActive && self.searchController.searchBar.text != "" {
                    if let idx = self.favorites.firstIndex(where: { $0 === self.filteredRecipe[indexPath.row] }) {
                       self.favorites.remove(at: idx)
                       self.save()
                       self.isLiked = false
                       print("Tinki")
                        DispatchQueue.main.async
                        {

                            let alert = UIAlertController(title: "Recipe Removed", message: "\(self.filteredRecipe[indexPath.row].recipetitle!) removed from favorites 💔", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        }
                       completionHandler(true)
                     
                        
                    
                    }
                
                } else {
                    if let idx = self.favorites.firstIndex(where: { $0 === self.feedItems[indexPath.row] }) {
                    self.favorites.remove(at: idx)
                        self.save()
                        self.isLiked = false
                    print("Danyaal")
                        
                    DispatchQueue.main.async
                                           {

                                               let alert = UIAlertController(title: "Recipe Removed", message: "\(self.feedItems[indexPath.row].recipetitle!) removed from favorites 💔", preferredStyle: .alert)
                                           alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                           self.present(alert, animated: true, completion: nil)
                                           }
                     completionHandler(true)
                    
                     }
                    }
               
                
                
            }
              let favorite =  UIContextualAction(style: .destructive, title: "Favourite") { (action, view, completionHandler) in
               if self.searchController.isActive && self.searchController.searchBar.text != "" {
                          self.favorites.append(self.filteredRecipe[indexPath.row])
                                 print(self.favorites)
                self.save()
                                  self.isLiked = true
                DispatchQueue.main.async
                                       {

                                           let alert = UIAlertController(title: "Recipe Added", message: "\(self.filteredRecipe[indexPath.row].recipetitle!) added to favorites ❤️", preferredStyle: .alert)
                                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                       self.present(alert, animated: true, completion: nil)
                                       }
                                  completionHandler(true)
                
                   }
               
           
                         else {
                          self.favorites.append(self.feedItems[indexPath.row])
                                print(self.favorites)
                                self.isLiked = true
                self.save()
                DispatchQueue.main.async
                                       {

                                           let alert = UIAlertController(title: "Recipe Added", message: "\(self.feedItems[indexPath.row].recipetitle!) added to favorites ❤️", preferredStyle: .alert)
                                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                       self.present(alert, animated: true, completion: nil)
                                       }
                                completionHandler(true)
                                
                   
                
                         
                   
                           }
   
               }
                   favorite.backgroundColor = UIColor.lightGray
                   favorite.image = UIImage(systemName: "heart")
                 

      
   
                   
              

                 if self.searchController.isActive && self.searchController.searchBar.text != "" {
                 if let idx = self.favorites.firstIndex(where: { $0 === self.filteredRecipe[indexPath.row] }) {
                    
                 unfavorite.backgroundColor = UIColor.red
                 unfavorite.image = UIImage(systemName: "heart.fill")
                    
                
                    

            let unfav = UISwipeActionsConfiguration(actions: [unfavorite])
                 return unfav
               
                    }
            
                 } else {
                       if favorites.contains(feedItems[indexPath.row]) {
                        if let idx = self.favorites.firstIndex(where: { $0 === self.feedItems[indexPath.row] }) {
                                 unfavorite.backgroundColor = UIColor.red
                                 unfavorite.image = UIImage(systemName: "heart.fill")
                                 let unfav = UISwipeActionsConfiguration(actions: [unfavorite])
                                 return unfav
                        }

                    }
                    
                   
        
            
        }
        if favorites.contains(where: { $0.recipeid == feedItems[indexPath.row].recipeid }) {
           unfavorite.backgroundColor = UIColor.red
           unfavorite.image = UIImage(systemName: "heart.fill")
           let unfav = UISwipeActionsConfiguration(actions: [unfavorite])
           return unfav
                                  } else {
                                       // not
                                  }
        let fav = UISwipeActionsConfiguration(actions: [favorite])
        return fav
                  
              
            
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toRecipe"){
            let VVC = segue.destination as? VideoViewController
            VVC?.selectedRecipe = selectedRecipe
            VVC?.favorites = favorites
        } else {
                if(segue.identifier == "toFav"){
                   let FFC = segue.destination as? FavoritesViewController
                    FFC?.favorites = favorites
                    FFC?.firstVC = self
                }
            }
    
        
    }
    func setupSearchController() {
           definesPresentationContext = true
           searchController.dimsBackgroundDuringPresentation = false
           searchController.searchResultsUpdater = self
           searchController.searchBar.placeholder = "Search by Recipe/Ingredients/Author"
           searchController.hidesNavigationBarDuringPresentation = false
           searchController.automaticallyShowsCancelButton = true
           searchController.searchBar.tintColor = UIColor.init(red: 116/255, green: 131/255, blue: 91/255, alpha: 1)
    
          
           
           listRecipeTableView.tableHeaderView = searchController.searchBar
       }
    func filterRowsForSearchedText(_ searchText: String) {
            filteredRecipe = feedItems.filter({( recipe : RecipeModel) -> Bool in
        return (recipe.recipetitle!.lowercased().contains(searchText.lowercased())||recipe.recipeingredients!.lowercased().contains(searchText.lowercased())||recipe.recipeauthor!.lowercased().contains(searchText.lowercased()))
 
             
        })
            self.listRecipeTableView.reloadData()
    
    }
    func save(){
              let data = NSKeyedArchiver.archivedData(withRootObject: favorites)
                                UserDefaults.standard.set(data, forKey: "favorites")
                                UserDefaults.standard.synchronize()
          }
}
    
   

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async(){
                self.image = image
              
                
        }
        }.resume()
}
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
        }
     
}
extension FirstViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let term = searchController.searchBar.text {
            filterRowsForSearchedText(term)
        }
    }
}


