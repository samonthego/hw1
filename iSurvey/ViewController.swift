//
//  ViewController.swift
//  iSurvey
//
//  Created by Samuel MCDONALD on 1/10/17.
//  Copyright © 2017 Samuel MCDONALD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var surveyNameLabel        :UILabel!
    @IBOutlet var userFirstNameTextField :UITextField!
    @IBOutlet var zipcodeTextField       :UITextField!
    @IBOutlet var servesAlcoholSwitch    :UISwitch!
    @IBOutlet var serviceRatingSlider    :UISlider!
    @IBOutlet var decorRatingSegControl  :UISegmentedControl!
    
    //MARK: - Interactivity Methods
    
    @IBAction func pressed(Button: UIButton){
        guard let name = userFirstNameTextField.text else {
            return
        }
        surveyNameLabel.text = "\(name) Favorite Restaurant"
    }
    
    @IBAction func valueChanged(aSwitch: UISwitch){
        print ("Is On? \(aSwitch.isOn)")
    }
    
    @IBAction func valueChanged(stepper: UIStepper){
        print("stepper is  \(stepper)")
    }
    
    @IBAction func valueChanged(slider: UISlider){
        print ("slider is \(slider)")
    }
    
    @IBAction func valueChanged(segControl: UISegmentedControl){
        print(" ")
    }
    @IBAction func valueChanged(datePicker: UIDatePicker){
        print("Date; \(datePicker.date)")
    }
    
    //MARK: - PickerView Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
    }
    
    func pickerView(_ pickerView: UIPickerView,titleForRow row: Int, forComponent component:Int)->String? {
        if component == 0 {
            return colorArray[row]
        } else if component == 1 {
            return clothesArray[row]
        }
        return"???"
        }
    }
    
    
    //MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == zipcodeTextField{
            let numsCharSet = CharacterSet(charactersIn: "1234567890").inverted
            let filtered = string.components(separatedBy: numsCharSet).joined()
            if string != filtered {
                return false
            }}
        return true
    }
    
    //MARK: - Life Cycle Methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userFirstNameTextField.delegate = self
        servesAlcoholSwitch.isOn = false
        userRatingService.value = 1
        serviceRatingSlider.value = 0
        decorRatingSegControl.selectedSegmentIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

