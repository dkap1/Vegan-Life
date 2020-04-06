//
//  AddRecipeViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 05/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var recipetitle: UITextField!
    
    @IBOutlet weak var recipekey: UITextField!
    
    @IBOutlet weak var recipeingredients: UITextView!
    

    
    @IBAction func addRecipe(_ sender: Any) {
      
        let request = NSMutableURLRequest(url: NSURL(string: "https://vegan-life.000webhostapp.com/recieve.php")! as URL)
        request.httpMethod = "POST"
            let postString = "a=\(recipetitle.text!)&b=\(recipekey.text!)&c=\(recipeingredients.text!)"
            request.httpBody = postString.data(using: String.Encoding.utf8)

        let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in

                if error != nil {
                    print("error=\(error)")
                    return
                }
            DispatchQueue.main.async
            {

            let alert = UIAlertController(title: "Recipe Added", message: "Thank you for sharing.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }

                print("response = \(response)")

            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(responseString)")
            }
            task.resume()
    }
    
    func textView(_ textView: UITextView, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 250
        let currentString: NSString = recipeingredients!.text as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
return newString.length <= maxLength
    DispatchQueue.main.async{
        let alert = UIAlertController(title: "Error", message: "Error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        }
    }
    
    override func viewDidLoad() {
       // recipeingredients.delegate = self
        
    }
}
