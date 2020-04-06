import UIKit
import SQLite3


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipeHomeModelProtocol {
   
     var recipes:[Recipe] = []
     var recipe:Recipe = Recipe()
     var favourites: [Recipe] = []
     var favourite:Recipe = Recipe()
     var feedItems: NSArray = NSArray()
     var selectedRecipe: RecipeModel = RecipeModel()
     
     
    var db: OpaquePointer?
    
    @IBOutlet var listRecipeTableView: UITableView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory,
                in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("veganlife.sqllite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("Could not create table")
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Recipes( id INTEGER PRIMARY KEY AUTOINCREMENT, recipekey TEXT, title TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Could not create table")
            return
        }
        
        print("Everything is fine")
        
        
               self.listRecipeTableView.delegate = self
               self.listRecipeTableView.dataSource = self
               
               let recipeModel = RecipeHomeModel()
               recipeModel.delegate = self
               recipeModel.downloadItems()
        
       let add = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(self.action(sender:)))
       let refresh = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(self.refresh(sender:)))
       
        navigationItem.rightBarButtonItems = [add, refresh]
    
           }
   @objc func action(sender: UIBarButtonItem) {
    let newViewController = storyboard?.instantiateViewController(withIdentifier: "AddRecipeViewController") as! AddRecipeViewController
    self.navigationController?.pushViewController(newViewController, animated: true)
       
    }
    @objc func refresh(sender: UIBarButtonItem) {
        
       }
    
    func itemsDownloaded(items: NSArray) {
           feedItems = items
           self.listRecipeTableView.reloadData()
           print(items)
       }
        


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return recipes.count
        return feedItems.count
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          //   let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! RecipeCell
        
      //  cell.recipeTitleVideo.text = recipes[indexPath.row].Title
     //   let url = "https://img.youtube.com/vi/\(recipes[indexPath.row].Key)/0.jpg"
   //     cell.recipeImageView.downloaded(from: url)
      
      //  cell.buttonPressed = {
     //      let favouriteRecipe = Recipe()
   //         favouriteRecipe.Key = self.recipes[indexPath.row].Key
  //          favouriteRecipe.Title = self.recipes[indexPath.row].Title
   //         self.favourites.append(favouriteRecipe)
   //         print(self.favourites)
  //      }
       
        
   //      cell.heartButton.tag = indexPath.row
    //     cell.heartButton.addTarget(RecipeCell(), action: "heartClick", for: UIControl.Event.touchUpInside)
        let cellIdentifier: String = "recipeCell"
           let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
           let item: RecipeModel = feedItems[indexPath.row] as! RecipeModel
           myCell.textLabel!.text = item.recipetitle
        
     DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let url = "https://img.youtube.com/vi/\(item.recipekey!)/0.jpg"
              myCell.imageView?.downloaded(from: url)
               self.listRecipeTableView.reloadData()
     }
    
            
      
        
        
        
        return myCell
   //     return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     //   let vi = recipes[indexPath.row]
      //  self.recipe = vi
    selectedRecipe = feedItems[indexPath.row] as! RecipeModel
    self.performSegue(withIdentifier: "toRecipe", sender: self)
       
     //   performSegue(withIdentifier: "toRecipe", sender: nil)
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   if segue.identifier == "toRecipe" {
            
        //    let vc = segue.destination as! VideoViewController
     //       vc.recipe = self.recipe
     //   }
  //  }
        if (segue.identifier == "toRecipe"){
            let VVC = segue.destination as? VideoViewController
            VVC?.selectedRecipe = selectedRecipe
        
        
}
       
}
   

    class Recipe{
        
        var Key:String = " "
        var Title:String = " "
        var image = UIImage(contentsOfFile: "")
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
