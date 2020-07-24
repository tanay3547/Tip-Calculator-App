//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Tanay Agrawal on 7/24/20.
//  Copyright © 2020 Tanay Agrawwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageController: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
    }
    

    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Float(billAmountTextField.text!) ?? 0
        let tip = bill * tipPercentageController.value
        let total = bill + tip
        let tipPercentage = tipPercentageController.value * 100
        tipPercentageLabel.text = String(format: "%.1f%%", tipPercentage ) 
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

