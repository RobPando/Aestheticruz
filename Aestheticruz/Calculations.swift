//
//  Calculations.swift
//  Aestheticruz
//
//  Created by Roberto Pando on 2/11/16.
//  Copyright © 2016 Aestheticruz. All rights reserved.
//

import Foundation

class Calculation: CalcViewController {
    
    
    
    
    func calorieCalculation(gender: Int, weight: Double, height: Double, age: Double) -> Double {
        
        if  gender == 0 {
            
       
            return (66 + (13.7 * weight) + (5 * height) - (6.8 * age))
                                    }
        else {
            
            return 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age)
                }
    
            
                                                                                    }
    
}
