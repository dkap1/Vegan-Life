import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

     var recipes:[Recipe] = []
     var recipe:Recipe = Recipe()
     


    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let recipe1 = Recipe()
        recipe1.Key = "sI8gmbIXTb8"
        recipe1.Title = "Sweet & Sour Tofu"
        recipes.append(recipe1)
        
        let recipe2 = Recipe()
        recipe2.Key = "WXRwH6pNANk"
        recipe2.Title = "Kebab"
        recipes.append(recipe2)
        
        let recipe3 = Recipe()
        recipe3.Key = "ZOGSejnBObc"
        recipe3.Title = "Pizza"
        recipes.append(recipe3)
        
        let recipe4 = Recipe()
        recipe4.Key = "5wdyRA3KeMo"
        recipe4.Title = "Curry"
        recipes.append(recipe4)
        
        let recipe5 = Recipe()
        recipe5.Key = "KRuxfBl_9M8"
        recipe5.Title = "Scones"
        recipes.append(recipe5)
        
        let recipe6 = Recipe()
        recipe6.Key = "kYbm0rShLo4"
        recipe6.Title = "Pasta"
        recipes.append(recipe6)
            
        let recipe7 = Recipe()
        recipe7.Key = "ZCK6RZH2fgI"
        recipe7.Title = "Mac 'N' Cheese"
        recipes.append(recipe7)
        
        let recipe8 = Recipe()
        recipe8.Key = "YpRmZWB4_KQ"
        recipe8.Title = "Tiramisu"
        recipes.append(recipe8)
        
        let recipe9 = Recipe()
        recipe9.Key = "5fsMGIRbNak"
        recipe9.Title = "Fried Chicken Burger"
        recipes.append(recipe9)
        
        let recipe10 = Recipe()
        recipe10.Key = "jsgPy-K8ogk"
        recipe10.Title = "Shepards Pie"
        recipes.append(recipe10)
    
        
                
            
        }
        


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! RecipeCell
        
        cell.recipeTitleVideo.text = recipes[indexPath.row].Title
        let url = "https://img.youtube.com/vi/\(recipes[indexPath.row].Key)/0.jpg"
        cell.recipeImageView.downloaded(from: url)
       
   //      cell.heartButton.tag = indexPath.row
    //     cell.heartButton.addTarget(RecipeCell(), action: "heartClick", for: UIControl.Event.touchUpInside)
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vi = recipes[indexPath.row]
        self.recipe = vi
        
        performSegue(withIdentifier: "toRecipe", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecipe" {
            
            let vc = segue.destination as! VideoViewController
            vc.recipe = self.recipe
        }
    }
}
    
    
   

    class Recipe{
        
        var Key:String = " "
        var Title:String = " "
        var image = UIImage(contentsOfFile: "")
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
