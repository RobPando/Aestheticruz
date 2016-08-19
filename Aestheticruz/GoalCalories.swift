//
//  GoalCalories.swift
//  Aestheticruz
//
//  Created by Roberto Pando on 2/13/16.
//  Copyright © 2016 Aestheticruz. All rights reserved.
//

import Foundation

class GoalCalories: CalcViewController {
    
    func goalCalories(goal: Int, calories: Int) -> Int {
        
        if goal == 0 {
            return calories - 500
        }
        else {
            return calories + 400
        }
    }
}