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
    
    
    var responses: [Answer]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
