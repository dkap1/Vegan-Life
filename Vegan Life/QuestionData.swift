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
enum DietType: Character {
    case good = "😊", bad = "🤒", average = "😬", reallybad = "💩"//very good, excellent, average, poor
    
    var definition: String {
        switch self {
        case .good:
            return "Well Done - Your Diet is Good"
           case .bad:
            return "Oh No - You Don't Have a Healthy Diet"
        case .average:
            return "You Can Do Better"
        case .reallybad:
            return "You Need To Make A Lot Of Changes"
        }
    }
}
