//
//  CalcViewController.swift
//  Aestheticruz
//
//  Created by Roberto Pando on 2/11/16.
//  Copyright © 2016 Aestheticruz. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    @IBOutlet weak var mantainCalorieLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var caloriesGoalLabel: UILabel!
    
    
    var weightSegue: Double = 0
    var heightSegue: Double = 0
    var ageSegue: Double = 0
    var genderSegue: Int = 0
    var weekSegue: String = ""
    var goalSegue: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let calorieMant = Calculation().calorieCalculation(genderSegue, weight: weightSegue, height: heightSegue, age: ageSegue)
        var realCalorieMant = Int(calorieMant * 1.2)
        switch weekSegue {
            case "0":
            realCalorieMant = Int(calorieMant * 1.2)
            case "1", "2":
            realCalorieMant = Int(calorieMant * 1.3)
            case "3","4":
            realCalorieMant = Int(calorieMant * 1.4)
            case "5","6":
            realCalorieMant = Int(calorieMant * 1.5)
            case "7":
            realCalorieMant = Int(calorieMant * 1.6)
        default:
            break
            
        }
        let goalCalculations = GoalCalories().goalCalories(goalSegue, calories: realCalorieMant)
        
        
        switch goalSegue {
        case 0:
            caloriesGoalLabel.text = String(goalCalculations)
            goalLabel.text = "Calorias para bajar de peso:"
            

        case 1:
            caloriesGoalLabel.text = String(goalCalculations)
            goalLabel.text = "Calorias para subir de peso:"

        default:
            break
        }
        
        mantainCalorieLabel.text = String(realCalorieMant)
        let protein = Int(weightSegue * 2.4)
        proteinLabel.text = String(protein)
        let fat = Int(weightSegue * 0.7)
        fatLabel.text = String(fat)
        let carbs = (goalCalculations - ((protein * 4) + (fat * 9)))
        carbsLabel.text = String(carbs/4)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
