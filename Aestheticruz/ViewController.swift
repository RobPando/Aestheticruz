//
//  ViewController.swift
//  Aestheticruz
//
//  Created by Roberto Pando on 2/9/16.
//  Copyright © 2016 Aestheticruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var genderController: UISegmentedControl!
    @IBOutlet weak var weightInput: UITextField?
    @IBOutlet weak var heightInput: UITextField?
    @IBOutlet weak var ageInput: UITextField?
    @IBOutlet weak var timesPicker: UIPickerView!
    @IBOutlet weak var goalWeightLabel: UISegmentedControl!
    
    var weekExercise = ["0", "1", "2", "3", "4", "5", "6", "7"]
    var selectedWeek = ""
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if weightInput?.isFirstResponder() == true {
        weightInput?.placeholder = ""
        }
        if heightInput?.isFirstResponder() == true {
            heightInput?.placeholder = ""
        }
        if ageInput?.isFirstResponder() == true {
            ageInput?.placeholder = ""
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       weightInput?.delegate = self
        heightInput?.delegate = self
        ageInput?.delegate = self
    

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekExercise.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekExercise[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedWeek = weekExercise[row]
    }

    // became first responder

   
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "showCalcSheet" {
           
            if (weightInput!.text!.isEmpty){
                let alert = UIAlertController(title: "Requerimiento!", message: "La casilla 'Peso' no puede estar vacia.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                return false
        
            } else if (heightInput!.text!.isEmpty){
                let alert = UIAlertController(title: "Requerimiento!", message: "La casilla 'Estatura' no puede estar vacia.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                return false
                
            } else if (ageInput!.text!.isEmpty){
                let alert = UIAlertController(title: "Requerimiento!", message: "La casilla 'Edad' no puede estar vacia.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                return false
                
            }
            else {
                return true
            }
        }
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCalcSheet" {
                let weight = ((weightInput?.text)! as NSString).doubleValue
                let height = ((heightInput?.text)! as NSString).doubleValue
                let age = ((ageInput?.text)! as NSString).doubleValue
            
                let calcVieControl = segue.destinationViewController as! CalcViewController
                    calcVieControl.weightSegue = weight
                    calcVieControl.heightSegue = height
                    calcVieControl.ageSegue = age
                    calcVieControl.genderSegue = genderController.selectedSegmentIndex
                    calcVieControl.weekSegue = selectedWeek
                    calcVieControl.goalSegue = goalWeightLabel.selectedSegmentIndex
            
        
        }
    }
    
}


