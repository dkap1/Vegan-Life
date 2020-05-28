//
//  QuestionViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 05/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    
    
    var questions: [Question] = [
    
        Question(text: "Assuming You Eat 21 Meals Per Week - How Many Meals Per Week Are Home Cooked?",
                 type: .single,
                 answers: [
                    Answer(text: "Less than 7", type: .reallybad),
                    Answer(text: "7 to 10", type: .bad),
                    Answer(text: "11 to 14 ", type: .average),
                    Answer(text: "15 to 21", type: .good),
                  
                    
                    
                    
                    ]),
                    
            Question(text: "What Beverage Do You Drink Most Often Each Day?",
                         type: .single,
                         answers: [
                            Answer(text: "Alcohol (Beer/Wine)", type: .reallybad),
                            Answer(text: "Cofee/Caffeinated tea/energy drinks/sodas", type: .bad),
                            Answer(text: "Herbal Tea/non-dairy milks(soy, rice, almond, etc)", type: .average),
                            Answer(text: "Water - (pure, unsweetened, maybe with lemon)", type: .good),
                           
                            
                            ]),
            Question(text: "How Many Times Each Week Do You Eat A Large Salad As The Main Dish (For Lunch or Dinner)?",
                            type: .single,
                            answers: [
                            Answer(text: "Never", type: .reallybad),
                            Answer(text: "1 to 3 meals per week", type: .bad),
                            Answer(text: "4 to 7 meals per week", type: .average),
                            Answer(text: "8+ meals per week", type: .good),
                            
                                            
                                            
                                            ]),
            Question(text: "How many servings (about the size of your fist) of dark leafy greens (spinach , kale, arugula, etc) do you eat each day?",
                                       type: .single,
                                       answers: [
                                       Answer(text: "Never", type: .reallybad),
                                       Answer(text: "1 serving or less", type: .bad),
                                       Answer(text: "2 serving per day", type: .average),
                                       Answer(text: "3+ servings per day", type: .good),
                                                       
                                                       
                                                       ]),
            Question(text: "How many servings of fresh fruit do you eat each day?",
                                                 type: .single,
                                                 answers: [
                                                 Answer(text: "Never", type: .reallybad),
                                                 Answer(text: "1 peice/serving per day", type: .bad),
                                                 Answer(text: "2 peices/servings per day", type: .average),
                                                 Answer(text: "3+ pieces/servings each day", type: .good),
                                                ]),
                                                 
            Question(text: "When You Eat Grain or Starchy Carbohydrates, Which Do You Most Often Eat? ?",
             type: .single,
             answers: [
             Answer(text: "None - I Avoid Carbs", type: .reallybad),
             Answer(text: "Cookies/Cakes/French Fries", type: .bad),
             Answer(text: "Sweet Potatoes", type: .average),
             Answer(text: "Whole Grains (Quinoa, Brown Rice etc)", type: .good),
                 ]),
            Question(text: "How often do you eat legumes (beans, lentils etc)?",
                                                          type: .single,
                                                          answers: [
                                                          Answer(text: "None - I never eat them", type: .reallybad),
                                                          Answer(text: "A few times per month", type: .bad),
                                                          Answer(text: "Once A Week", type: .average),
                                                          Answer(text: "Daily or Almost Daily", type: .good),
                                                         ]),
            Question(text: "How much processed vegan foods do you have in your diet?",
            type: .single,
            answers: [
            Answer(text: "I eat non-dairy cheeses, veggie burgers & sausages", type: .reallybad),
            Answer(text: "I eat a combination of non-dairy cheeses and processed food", type: .bad),
            Answer(text: "I eat some processed food (tofu, tempeh, and/or miso)", type: .average),
            Answer(text: "I never eat any processed meat-alternative foods at all", type: .good),
            
            ]),
                                                                                                       
            Question(text: "How much and what kinds of fats do you eat most of the time?",
            type: .single,
            answers: [
            Answer(text: "I avoid as much sources of fat as possible in my diet", type: .reallybad),
            Answer(text: "I avoid eating trans fats but eat fried food/vegetable oils", type: .bad),
            Answer(text: "I focus on healthy fats (avocados/seeds/nuts/coconut oil) in my diet", type: .average),
            Answer(text: "I eat healthy fats and keep them to a minimum", type: .good),
                                                                            
                                                                            ]),
            Question(text: "Do you take any supplements with your Vegan Diet",
            type: .single,
            answers: [
            Answer(text: "I don't take any supplements", type: .reallybad),
            Answer(text: "I sometimes take either Vitamin D/B12 supplements most/all days", type: .bad),
            Answer(text: "I sometimes take both Vitamin B12/D supplements most/all days", type: .average),
            Answer(text: "I take both Vitamin D/B12 supplements most/all days ", type: .good),
                                                                            
                                                                            ]),
                                                            
                                            
            ]
        
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    
    
    override func viewDidLoad() {
        
        questionLabel.frame.size.width = W * 0.9
        questionLabel.center.x = W * 0.5
        questionLabel.frame.size.height = H * 0.1
        questionLabel.center.y = H * 0.2
        
        
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemTeal
        singleButton1.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
              singleButton1.layer.cornerRadius = 25.0
              singleButton1.tintColor = UIColor.white
        singleButton1.frame.size.width = W * 0.9
        singleButton1.center.x = W * 0.5
        singleButton1.frame.size.height = H * 0.1
        singleButton1.center.y = H * 0.3

        singleButton2.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
                     singleButton2.layer.cornerRadius = 25.0
                     singleButton2.tintColor = UIColor.white
        singleButton2.frame.size.width = W * 0.9
        singleButton2.center.x = W * 0.5
        singleButton2.frame.size.height = H * 0.1
        singleButton2.center.y = H * 0.45


        singleButton3.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
                     singleButton3.layer.cornerRadius = 25.0
                     singleButton3.tintColor = UIColor.white
        singleButton3.frame.size.width = W * 0.9
        singleButton3.center.x = W * 0.5
        singleButton3.frame.size.height = H * 0.1
        singleButton3.center.y = H * 0.6


        singleButton4.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
                     singleButton4.layer.cornerRadius = 25.0
                     singleButton4.tintColor = UIColor.white
        singleButton4.frame.size.width = W * 0.9
        singleButton4.center.x = W * 0.5
        singleButton4.frame.size.height = H * 0.1
        singleButton4.center.y = H * 0.75

        
        
        
        
        
        // Do any additional setup after loading the view.
        updateUI()
        
    }
    func updateUI() {
       // singleStackView .isHidden = true
        multipleStackView .isHidden = true
        rangedStackView .isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type
        {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
            
       
        }
        
    }
    
    func updateSingleStack(using answers: [Answer]){
        // singleStackView .isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]){
         multipleStackView .isHidden = false
         
         multiSwitch1.isOn = false
         multiSwitch2.isOn = false
         multiSwitch3.isOn = false
         multiSwitch4.isOn = false
        
         multiLabel1.text = answers[0].text
         multiLabel2.text = answers[1].text
         multiLabel3.text = answers[2].text
         multiLabel4.text = answers[3].text
        
    }
    func updateRangedStack(using answers: [Answer]){
         rangedStackView.isHidden = false
         rangedSlider.setValue(0.5, animated: false)
        
         rangedLabel1.text = answers.first?.text
         rangedLabel2.text = answers.last?.text
    
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
        
    }
    @IBAction func multipleAnswerButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
                   answersChosen.append(currentAnswers[1])
               }
        if multiSwitch3.isOn {
                   answersChosen.append(currentAnswers[2])
               }
        if multiSwitch4.isOn {
                   answersChosen.append(currentAnswers[3])
               }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        
          let currentAnswers = questions[questionIndex].answers
        
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    
    func nextQuestion() {
        
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }else{
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue"{
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen 
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
