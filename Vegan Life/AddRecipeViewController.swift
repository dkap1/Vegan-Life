//
//  AddRecipeViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 05/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var danyaal: UIPickerView!
    
    @IBOutlet weak var gfpicker: UIPickerView!
    
    @IBOutlet weak var categorypicker: UIPickerView!
    
    @IBOutlet weak var nutsLabel: UILabel!
    
    @IBOutlet weak var glutenLabel: UILabel!
    
    @IBOutlet weak var recipetitle: UITextField!
    
    @IBOutlet weak var recipekey: UITextField!
    
    @IBOutlet weak var recipeingredients: UITextView!
    
    
    @IBOutlet weak var recipeauthor: UITextField!
    
    @IBOutlet weak var recipect: UITextField!
    
    @IBOutlet weak var recipeserves: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nutsTF: UITextField!
    
    @IBOutlet weak var gfTF: UITextField!
   
    @IBOutlet weak var categoriesTF: UITextField!
    
    @IBOutlet weak var nutsSwitch: UISwitch!
    
    @IBOutlet weak var glutenSwitch: UISwitch!
    
    @IBOutlet weak var mealTypeLabel: UILabel!
    
    
    let maxServesLength = 5
     let acceptableNumbers = "0123456789"
     let nuts = ["yes", "no"]
     let gf = ["yes", "no"]
     let category = ["Brunch", "Lunch", "Dinner", "Drinks", "Snacks", "Sweets"]
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height

    
    
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
        
       
        
        if nutsSwitch.isOn {
            nutsTF.text = "yes"
        }
        else {
            nutsTF.text = "no"
        }
        
        if glutenSwitch.isOn {
            gfTF.text = "yes"
        }
        else {
            gfTF.text = "no"
        }
        
        if checkYoutube(link: (recipekey.text!)) == nil{
            let alert = UIAlertController(title: "Invalid YouTube Link", message: "Please Try Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            recipekey.text = nil
        }
        else {
            let youtubeVideoURL = recipekey.text!
            if let videoKey = URL(string: youtubeVideoURL)?.query?.components(separatedBy: "=").last {
                recipekey.text = videoKey
            }
        }
        if recipetitle.text?.isEmpty == false && recipekey.text?.isEmpty == false &&
            recipeauthor.text?.isEmpty == false && recipect.text?.isEmpty == false && recipeserves.text?.isEmpty == false
            && recipeingredients.textColor != UIColor.lightGray{
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://vegan-life.000webhostapp.com/recieve.php")! as URL)
        request.httpMethod = "POST"
            let postString = "a=\(recipetitle.text!)&b=\(recipekey.text!)&c=\(recipeingredients.text!)&d=\(recipeauthor.text!)&e=\(recipect.text!)&f=\(recipeserves.text!)&g=\(nutsTF.text!)&h=\(gfTF.text!)&i=\(categoriesTF.text!)"
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
        
        
        
        nutsLabel.text = "Nuts"
        glutenLabel.text = "Gluten"
        mealTypeLabel.text = "Meal Type"
        
        
        print(categoriesTF.text)
        
        self.view.backgroundColor = UIColor.init(red: 250/255, green: 220/255, blue: 171/255, alpha: 1)
               submitButton.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
               submitButton.layer.cornerRadius = 25.0
               submitButton.tintColor = UIColor.white
        
        //recipeingredients.delegate = self
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
        
       
        //danyaal.delegate = self
        //danyaal.dataSource = self
        
       // gfpicker.delegate = self
        //gfpicker.dataSource = self
        
        categorypicker.delegate = self
        categorypicker.dataSource = self
        
        
        recipetitle.frame.size.width = W * 0.9
        recipetitle.center.x = W * 0.5
        recipetitle.frame.size.height = H * 0.05
        recipetitle.center.y = H * 0.2
        
        recipekey.frame.size.width = W * 0.9
        recipekey.center.x = W * 0.5
        recipekey.frame.size.height = H * 0.05
        recipekey.center.y = H * 0.25
        
        recipeauthor.frame.size.width = W * 0.9
        recipeauthor.center.x = W * 0.5
        recipeauthor.frame.size.height = H * 0.05
        recipeauthor.center.y = H * 0.3
        
        recipect.frame.size.width = W * 0.9
        recipect.center.x = W * 0.5
        recipect.frame.size.height = H * 0.05
        recipect.center.y = H * 0.35
        
        recipeserves.frame.size.width = W * 0.9
        recipeserves.center.x = W * 0.5
        recipeserves.frame.size.height = H * 0.05
        recipeserves.center.y = H * 0.4
        
//        danyaal.frame.size.width = W * 0.4
   //     danyaal.center.x = W * 0.5
   //     danyaal.frame.size.height = H * 0.1
   //     danyaal.center.y = H * 0.45
        
   //    gfpicker.frame.size.width = W * 0.4
   //     gfpicker.center.x = W * 0.5
   //     gfpicker.frame.size.height = H * 0.1
        //     gfpicker.center.y = H * 0.52
        
        categorypicker.frame.size.width = W * 0.4
        categorypicker.center.x = W * 0.5
        categorypicker.frame.size.height = H * 0.1
        categorypicker.center.y = H * 0.52
        
        mealTypeLabel.frame.size.width = W * 0.5
        mealTypeLabel.center.x = W * 0.4
        mealTypeLabel.frame.size.height = H * 0.5
        mealTypeLabel.center.y = H * 0.52
        
        recipeingredients.frame.size.width = W * 0.9
        recipeingredients.center.x = W * 0.5
        recipeingredients.frame.size.height = H * 0.21
        recipeingredients.center.y = H * 0.69
        
        submitButton.frame.size.width = W * 0.85
        submitButton.center.x = W * 0.50
        submitButton.frame.size.height = H * 0.09
        submitButton.center.y = H * 0.85
              
        nutsLabel.frame.size.width = W * 0.5
        nutsLabel.center.x = W * 0.35
        nutsLabel.frame.size.height = H * 0.5
        nutsLabel.center.y = H * 0.45
        
        glutenLabel.frame.size.width = W * 0.5
        glutenLabel.center.x = W * 0.85
        glutenLabel.frame.size.height = H * 0.5
        glutenLabel.center.y = H * 0.45
        
        nutsSwitch.frame.size.width = W * 0.5
        nutsSwitch.center.x = W * 0.37
        nutsSwitch.frame.size.height = H * 0.5
        nutsSwitch.center.y = H * 0.45
        
        glutenSwitch.frame.size.width = W * 0.5
        glutenSwitch.center.x = W * 0.87
        glutenSwitch.frame.size.height = H * 0.5
        glutenSwitch.center.y = H * 0.45
              
        
       
        recipeingredients.delegate = self
              
        
    
        
    }

   func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
   }



   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {



       if pickerView == danyaal {
           return nuts.count

    } else if pickerView == gfpicker{
         return gf.count
    }
       else if pickerView == categorypicker{
        return category.count
    }

       return 1
   }

   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {


       if pickerView == danyaal {
           return nuts[row]

       } else if pickerView == gfpicker{
            return gf[row]
       }
       else if pickerView == categorypicker{
        return category[row]
    }
       return ""
   }
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         categoriesTF.text = category[row] as String
    }
    
    @objc func keyboardWillHide() {
      self.view.frame.origin.y = 0
  }

    @objc func keyboardWillChange(notification: NSNotification) {

      if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
          if recipeingredients.isFirstResponder {
              self.view.frame.origin.y = -keyboardSize.height
            
            
            
          }
      }
  }
  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)

      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  
}
