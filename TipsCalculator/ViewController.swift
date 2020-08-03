//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Eric Nguyen on 8/2/20.
//  Copyright © 2020 Eric Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleControl: UISlider!
    @IBOutlet weak var CustomField: UITextField!
    @IBOutlet weak var totalPerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
       
        let bill = Double(BillField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let selection = tipControl.selectedSegmentIndex
        
        var tip = 0.0
        
        if(selection < 3){
            tip = bill * tipPercentages[selection]
        } else {
            let custom = Int(CustomField.text!) ?? 0
            
            tip = (Double(custom) / 100.0) * bill
        
        }
        
        let total = bill + tip
        
        let numberPeople = Int(peopleControl.value)
               
        peopleLabel.text = "Number of Folks Splitting Bill: " + String(numberPeople)
        TipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format : "$%.2f", total)
        totalPerLabel.text = String(format : "$%.2f", total/Double(numberPeople))
        
    }
    
    
}

