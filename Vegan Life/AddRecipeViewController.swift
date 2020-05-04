//
//  AddRecipeViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 05/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate{

    @IBOutlet weak var recipetitle: UITextField!
    
    @IBOutlet weak var recipekey: UITextField!
    
    @IBOutlet weak var recipeingredients: UITextView!
    
    
    @IBOutlet weak var recipeauthor: UITextField!
    
    @IBOutlet weak var recipect: UITextField!
    
    @IBOutlet weak var recipeserves: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
     let maxServesLength = 5
     let acceptableNumbers = "0123456789"
    
    func checkYoutube(link: String) -> String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        guard let regExp = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return nil
        }
        let nsLink = link as NSString
        let options = NSRegularExpression.MatchingOptions(rawValue: 0)
        let range = NSRange(location: 0, length: nsLink.length)
        let matches = regExp.matches(in: link as String, options:options, range:range)
        if let firstMatch = matches.first {
            return nsLink.substring(with: firstMatch.range)
        }
        return nil
    }
    
    @IBAction func addRecipe(_ sender: Any) {
      
        if checkYoutube(link: (recipekey.text!)) == nil{
            let alert = UIAlertController(title: "Invalid YouTube Link", message: "Please Try Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let youtubeVideoURL = recipekey.text!
            if let videoKey = URL(string: youtubeVideoURL)?.query?.components(separatedBy: "=").last {
                recipekey.text = videoKey
            }
        }
        if recipetitle.text?.isEmpty == false && recipekey.text?.isEmpty == false
            && recipeauthor.text?.isEmpty == false && recipect.text?.isEmpty == false && recipeserves.text?.isEmpty == false
            && recipeingredients.textColor != UIColor.lightGray{
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://vegan-life.000webhostapp.com/recieve.php")! as URL)
        request.httpMethod = "POST"
            let postString = "a=\(recipetitle.text!)&b=\(recipekey.text!)&c=\(recipeingredients.text!)&d=\(recipeauthor.text!)&e=\(recipect.text!)&f=\(recipeserves.text!)"
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
        else {
            let alert = UIAlertController(title: "Error", message: "Missing values", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                      self.present(alert, animated: true, completion: nil)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          if textField == recipetitle {
          let maxLength = 70
              let currentString: NSString = recipetitle.text! as NSString
              let newString: NSString =
                    currentString.replacingCharacters(in: range, with: string) as NSString
          
          if newString.length > maxLength {
                                     let alert = UIAlertController(title: "Maximum Recipe Title Character Limit Reached", message: "Recipe Title Should Not Be More Than 70 Characters", preferredStyle: .alert)
                                     alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                     self.present(alert, animated: true, completion: nil)
                                     }
          
         // return currentString.length <= maxLength
          }
              if textField == recipeauthor {
                  let maxLength = 20
                             let currentString: NSString = recipeauthor.text! as NSString
                             let newString: NSString =
                                   currentString.replacingCharacters(in: range, with: string) as NSString
                         
                         if newString.length > maxLength {
                                                    let alert = UIAlertController(title: "Maximum Recipe Author Character Limit Reached", message: "Author Should Not Be More Than 20 Characters", preferredStyle: .alert)
                                                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                                    self.present(alert, animated: true, completion: nil)
                                                    }
                         
              
                         //return currentString.length <= maxLength
              
        }
        if textField == recipect {
            let maxLength = 20
                       let currentString: NSString = recipect.text! as NSString
                       let newString: NSString =
                             currentString.replacingCharacters(in: range, with: string) as NSString
                   
                   if newString.length > maxLength {
                                              let alert = UIAlertController(title: "Maximum Recipe Cooking Time Character Limit Reached", message: "Cooking Time Should Not Be More Than 20 Characters", preferredStyle: .alert)
                                              alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                              self.present(alert, animated: true, completion: nil)
                                              }
                   
        
                  // return currentString.length <= maxLength
        }
        if textField == recipeserves {
            let newLength: Int = recipeserves.text!.count + string.count - range.length
                       let numberOnly = NSCharacterSet.init(charactersIn: acceptableNumbers).inverted
                       let strValid = string.rangeOfCharacter(from: numberOnly) == nil
            
           
            
            if strValid && (newLength > maxServesLength){
               let alert = UIAlertController(title: "Maximum Recipe Cooking Time Character Limit Reached", message: "Recipe Serving Should Not Be More Than 5 Characters", preferredStyle: .alert)
                                                            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                                            self.present(alert, animated: true, completion: nil)
                
            }
            
                       if strValid == false {
                          let alert = UIAlertController(title: "Error", message: "This field only accepts numbers", preferredStyle: .alert)
                                                                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                                                       self.present(alert, animated: true, completion: nil)
                           
                       }
            
        return (strValid && (newLength <= maxServesLength))
                
        }
                return true
                   }
        

     
           
      
      
    func textViewDidBeginEditing(_ textView: UITextView) {
           if recipeingredients.textColor == UIColor.lightGray {
               recipeingredients.text = nil
               recipeingredients.textColor = UIColor.black
           }
       
       }
       func textViewDidEndEditing(_ textView: UITextView) {
           if recipeingredients.text.isEmpty{
               recipeingredients.text = "Enter Recipe Ingredients"
               recipeingredients.textColor = UIColor.lightGray
               
           }
      
        
       }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }
   
    
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.init(red: 250/255, green: 220/255, blue: 171/255, alpha: 1)
               submitButton.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
               submitButton.layer.cornerRadius = 25.0
               submitButton.tintColor = UIColor.white
        
        recipeingredients.delegate = self
        recipetitle.delegate = self
        recipekey.delegate = self
        recipeauthor.delegate = self
        recipect.delegate = self
        recipeserves.delegate = self
        
        recipeingredients.text = "Enter Recipe Ingredients"
        recipeingredients.textColor = UIColor.lightGray
        
        let colour = UIColor.lightGray.cgColor
        recipeingredients.layer.borderColor = colour
        recipeingredients.layer.borderWidth = 0.5
        recipeingredients.layer.cornerRadius = 5
        
     
        self.view.backgroundColor = UIColor.init(red: 250/255, green: 220/255, blue: 171/255, alpha: 1)
        
        recipeserves.keyboardType = .numberPad
        
        
        
              
        
    }
   
}

