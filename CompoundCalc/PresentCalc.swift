//
//  PresentCalc.swift
//  CompoundCalc
//
//  Created by IACD-022 on 2022/04/11.
//

import UIKit

class PresentCalc: UIViewController {
    
    @IBOutlet weak var numYears: UIStepper!
    
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var futureValue: UITextField!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var rate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PV"
        
    }
    
    @IBAction func changeYearsLabel(_ sender: UIStepper) {
        yearsLabel.text = "\(Int(numYears.value)) year(s)"
        CalcPresentVal(futureValue)
    }
    
    @IBAction func CalcPresentVal(_ sender: UITextField) {
        var pv = 0.0
        let fv = Double(futureValue.text ?? "0.0") ?? 0.0
        let years = numYears.value
        let capturedRate = Double(rate.text ?? "0.0") ?? 0.0
        
        pv = fv / pow(1 + (capturedRate / 100), years)
        answer.text = String(round(pv * 100) / 100.0)
        
    }
    
    
}
