import UIKit
import CoreData


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipeHomeModelProtocol, UISearchBarDelegate, UISearchResultsUpdating {
   
    @IBOutlet weak var recipeTitle: UILabel!
    
    

     var feedItems = [RecipeModel]()
     var selectedRecipe: RecipeModel = RecipeModel()
     var filteredRecipe = [RecipeModel]()
     var resultSearchController = UISearchController()
     var favorites  = [RecipeModel]()
     var dan = FavoritesViewController()
     var isLiked = false
     var heartButton = RecipeCell()
    
     let searchController = UISearchController(searchResultsController: nil)
  
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    

     
    @IBOutlet var listRecipeTableView: UITableView!
 
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor.systemGreen
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.listRecipeTableView.backgroundColor = UIColor.systemGreen
        
               self.listRecipeTableView.delegate = self
               self.listRecipeTableView.dataSource = self
               
               let recipeModel = RecipeHomeModel()
               recipeModel.delegate = self
               recipeModel.downloadItems()
        
       let add = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(self.action(sender:)))
        
        let refresh = UIBarButtonItem.init(barButtonSystemItem: .bookmarks, target: self, action: #selector(self.refresh(sender:)))
        
      

    
     navigationItem.rightBarButtonItems = [add, refresh]
         
       navigationItem.largeTitleDisplayMode = .always
      
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = searchController
                      
       // listRecipeTableView.tableHeaderView = searchController.searchBar
        
        searchController.searchBar.scopeButtonTitles = ["All","Brunch", "Lunch","Dinner", "Drinks", "Snacks", "Sweets"]
        searchController.searchBar.delegate = self
        searchController.searchBar.setScopeBarButtonTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 11.0)!], for: .normal)
       
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Search by Recipe/Ingredients/Author"
        
        
          self.listRecipeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "recipeCell")
        
            if let data = UserDefaults.standard.object(forKey: "favorites") as? Data {
            if let storedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? [RecipeModel] {
                favorites = storedData
              
                   
                  
                }

            
            
        }
          
    }
    func applySearch(searchText: String, scope: String = "All"){
           if searchController.searchBar.text! == "" {
               filteredRecipe = feedItems.filter{ feedItems in
                let RecipeCat = (scope == "All") || (feedItems.recipecategory == scope)
                   return RecipeCat
           
            }
           } else {
                   filteredRecipe = feedItems.filter{ feedItems in
                       let RecipeCat = (scope == "All") || (feedItems.recipecategory == scope)
                       return RecipeCat && feedItems.recipetitle!.lowercased().contains(searchText.lowercased()) || feedItems.recipeingredients!.lowercased().contains(searchText.lowercased()) || feedItems.recipeauthor!.lowercased().contains(searchText.lowercased())
                   }
               }
           self.listRecipeTableView.reloadData()
           
       }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let selectedScope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        applySearch(searchText: searchController.searchBar.text!,scope: selectedScope)
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        applySearch(searchText: searchController.searchBar.text!,scope: searchBar.scopeButtonTitles![selectedScope])
        
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
        return filteredRecipe.count
           }
      
   
    
        
        
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "recipeCell"
           let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
            myCell.tag = indexPath.row
        var recipe: RecipeModel
        let placeholderImage = UIImage(named: "placeholderimg.png")
        myCell.imageView?.image = placeholderImage
      // if searchController.isActive && searchController.searchBar.text != "" {
           recipe = filteredRecipe[indexPath.row]

        
         //  let url = "https://img.youtube.com/vi/\(recipe.recipekey!)/0.jpg"
            //  myCell.imageView?.downloaded(from: url)
    //  } else {
       //     recipe = feedItems[indexPath.row]
            let url = "https://img.youtube.com/vi/\(recipe.recipekey!)/0.jpg"
            myCell.imageView?.downloaded(from: url)
        // let item: RecipeModel = feedItems[indexPath.row] as! RecipeModel
        
         
        
       // }
           myCell.textLabel!.text = recipe.recipetitle
          myCell.textLabel!.font = UIFont.systemFont(ofSize: 15)
           myCell.backgroundColor = UIColor.systemGreen
           
  
        
     
        
  
         
    
     return myCell
       
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        selectedRecipe = filteredRecipe[indexPath.row]
        self.performSegue(withIdentifier: "toRecipe", sender: self)
     
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       if searchController.searchBar.text! == "" {
            if favorites.contains(filteredRecipe[indexPath.row]){
            return false
            }
        }
            if favorites.contains(filteredRecipe[indexPath.row]){
            return false
                       }
            if favorites.contains(where: { $0.recipeid == filteredRecipe[indexPath.row].recipeid }) {
            return false
        }
        return true
      }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
              let favorite =  UIContextualAction(style: .destructive, title: "Favourite") { (action, view, completionHandler) in
               if self.searchController.searchBar.text != "" {
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
                          self.favorites.append(self.filteredRecipe[indexPath.row])
                                print(self.favorites)
                                self.isLiked = true
                self.save()
                DispatchQueue.main.async
                                       {

                                           let alert = UIAlertController(title: "Recipe Added", message: "\(self.filteredRecipe[indexPath.row].recipetitle!) added to favorites ❤️", preferredStyle: .alert)
                                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                       self.present(alert, animated: true, completion: nil)
                                       }
                                completionHandler(true)
                                
                   
                
                         
                   
                           }
   
               }
                   favorite.backgroundColor = UIColor.lightGray
                   favorite.image = UIImage(systemName: "heart")
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
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
        }
     
}



