//
//  FutureCalc.swift
//  CompoundCalc
//
//  Created by IACD-022 on 2022/04/11.
//

import UIKit

class FutureCalc: UIViewController {

    @IBOutlet weak var presentValue: UITextField!
    
    @IBOutlet weak var numYears: UIStepper!
    
    @IBOutlet weak var yearsLabel: UILabel!
    
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FV"
        
        yearsLabel.text = "\(numYears.value) year(s)"        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeYearsLabel(_ sender: UIStepper) {
        yearsLabel.text = "\(Int(numYears.value)) year(s)"
        CalcFutureVal(presentValue)
    }
    
    
    @IBAction func CalcFutureVal(_ sender: UITextField) {
        var fv = 0.0
        let pv = Double(presentValue.text ?? "0.0") ?? 0.0
        let years = numYears.value
        let capturedRate = Double(rate.text ?? "0.0") ?? 0.0
        
        fv = pv * pow(1 + (capturedRate / 100), years)
        answer.text = String(round(fv * 100) / 100.0)
        
    }
    
}
