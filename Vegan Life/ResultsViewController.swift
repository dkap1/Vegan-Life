//
//  ResultsViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 05/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!

    @IBOutlet weak var resultEmoji: UILabel!

    
    var responses: [Answer]!
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultAnswerLabel.frame.size.width = W * 0.5
        resultAnswerLabel.center.x = W * 0.5
        resultAnswerLabel.frame.size.height = H * 0.1
        resultAnswerLabel.center.y = H * 0.2
        
        resultEmoji.frame.size.width = W * 0.5
        resultEmoji.center.x = W * 0.51
        resultEmoji.frame.size.height = H * 0.1
        resultEmoji.center.y = H * 0.3
        
        resultDefinitionLabel.frame.size.width = W * 0.9
        resultDefinitionLabel.center.x = W * 0.5
        resultDefinitionLabel.frame.size.height = H * 0.5
        
        resultDefinitionLabel.center.y = H * 0.55
        
        
        self.view.backgroundColor = UIColor.systemTeal
        
        // Do any additional setup after loading the view.
        calculateDietResult()
        navigationItem.hidesBackButton = true
        
        
        
    }
    func calculateDietResult() {
       var frequencyOfAnswers: [DietType: Int] = [:]
        let responseTypes = responses.map{ $0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? +0) + 1
        }
        
        let freuqentAnswersSorted = frequencyOfAnswers.sorted(by: {
        (pair1,pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = freuqentAnswersSorted.first!.key
        
        resultAnswerLabel.text = "\(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        if resultAnswerLabel.text == "Poor!"{
            resultEmoji.text = "💩"
            self.view.backgroundColor = UIColor.systemRed
          
        }
        else {
            if resultAnswerLabel.text == "Bad!"{
                resultEmoji.text = "🤒"
                self.view.backgroundColor = UIColor.systemOrange
                
            }
            else {
                if resultAnswerLabel.text == "Average!"{
                    resultEmoji.text = "😬"
                    self.view.backgroundColor = UIColor.systemYellow
                   
                }
                else {
                    if resultAnswerLabel.text == "Good!"{
                        resultEmoji.text = "😊"
                        self.view.backgroundColor = UIColor.systemGreen
                        
                    }
                }
            }
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
