import UIKit



class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipeHomeModelProtocol {
   
    
    

     var feedItems: NSArray = NSArray()
     var selectedRecipe: RecipeModel = RecipeModel()
     var filteredRecipe = [RecipeModel]()
  
     let searchController = UISearchController(searchResultsController: nil)
     
    
    @IBOutlet var listRecipeTableView: UITableView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        
        
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
        feedItems = items as! NSMutableArray
           self.listRecipeTableView.reloadData()
           print(items)
       }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return recipes.count
        
           return feedItems.count
       
    }
        
        
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedRecipe = feedItems[indexPath.row] as! RecipeModel
    self.performSegue(withIdentifier: "toRecipe", sender: self)
    
    }
    
 
        

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toRecipe"){
            let VVC = segue.destination as? VideoViewController
            VVC?.selectedRecipe = selectedRecipe
        
        
                }
       
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

