//
//  QuestionData.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 05/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: DietType
}
enum DietType: String {
    case good = "Good", bad = "Bad", average = "Average", reallybad = "Poor"//very good, excellent, average, poor
    
    var definition: String {
        switch self {
        case .good:
            return "Mantain your healthy vegan diet by eating at least 5 portions of a variety of fruit and vegetables each day \n Base meals on starchy carbohydrates (eg potoatoes, bread) \n Have some dairy alternatives such as soya drinks and yoghurt \n Eat beans, pulses and other proteins \n Choose unsaturated oils and spreads and make sure you eat these in small amounts \n Drink plenty of fluids"
           case .bad:
            return "Improve your Vegan diet by eating at least 5 portions of a variety of fruit and vegetables each day \n Base meals on starchy carbohydrates (eg potoatoes, bread) \n Have some dairy alternatives such as soya drinks and yoghurt \n Eat beans, pulses and other proteins \n Choose unsaturated oils and spreads and make sure you eat these in small amounts \n Drink plenty of fluids"
        case .average:
            return "Make sure you are eating at least 5 portions of a variety of fruit and vegetables each day \n Base meals on starchy carbohydrates (eg potoatoes, bread) \n Have some dairy alternatives such as soya drinks and yoghurt \n Eat beans, pulses and other proteins \n Choose unsaturated oils and spreads and make sure you eat these in small amounts \n Drink plenty of fluids"
        case .reallybad:
            return "You should be eating at least 5 portions of a variety of fruit and vegetables each day \n Base meals on starchy carbohydrates (eg potoatoes, bread) \n Have some dairy alternatives such as soya drinks and yoghurt \n Eat beans, pulses and other proteins \n Choose unsaturated oils and spreads and make sure you eat these in small amounts \n Drink plenty of fluids"
        }
    }
    
}
