//
//  ViewController.swift
//  SImple-Calc
//
//  Created by Naomi Gallupe on 2021-01-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcField: UILabel!
    @IBOutlet weak var calcResult: UILabel!
    
    var calculations:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
    
    func clearAll(){
        calculations = ""
        calcField.text = ""
        calcResult.text = ""
    }

    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if(!calculations.isEmpty){
            calculations.removeLast()
            calcField.text = calculations
        }
    }
    
    func addToCalc(value: String){
        calculations = calculations + value
        calcField.text = calculations
    }
    
    func specialChar (char: Character) -> Bool {
        if(char == "×"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "-"){
            return true
        }
        return false
    }
    
    func validInput() ->Bool {
        var count = 0
        var previous: Int = -1
        var funcCharIndexes = [Int]()
        for char in calculations {
            if(specialChar(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        for index in funcCharIndexes {
            if (index == 0) {
                return false
            }
            if (previous != -1 ){
                if(index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
            
        }
    }
    
    @IBAction func percentBtn(_ sender: Any) {
        addToCalc(value: "%")
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        addToCalc(value: "/")
    }
    
    @IBAction func multiplyBtn(_ sender: Any) {
        addToCalc(value: "*")
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        addToCalc(value: "-")
    }
    
    @IBAction func addBtn(_ sender: Any) {
        addToCalc(value: "+")
    }
    
    @IBAction func equalsBtn(_ sender: Any) {
        if(validInput())
        {
        let checkPercent = calculations.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultStr = formatResult(result: result)
        calcResult.text = resultStr
        } else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "Unable to perform function", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func dotBtn(_ sender: Any) {
        addToCalc(value: ".")
    }
    
    @IBAction func zeroBtn(_ sender: Any) {
        addToCalc(value: "0")
    }
    
    @IBAction func oneBtn(_ sender: Any) {
        addToCalc(value: "1")
    }
    
    @IBAction func twoBtn(_ sender: Any) {
        addToCalc(value: "2")
    }
    
    @IBAction func threeBtn(_ sender: Any) {
        addToCalc(value: "3")
    }
    
    @IBAction func fourBtn(_ sender: Any) {
        addToCalc(value: "4")
    }
    
    @IBAction func fiveBtn(_ sender: Any) {
        addToCalc(value: "5")
    }
    
    @IBAction func sixBtn(_ sender: Any) {
        addToCalc(value: "6")
    }
    
    @IBAction func sevenBtn(_ sender: Any) {
        addToCalc(value: "7")
    }
    
    @IBAction func eightBtn(_ sender: Any) {
        addToCalc(value: "8")
    }
    
    @IBAction func nineBtn(_ sender: Any) {
        addToCalc(value: "9")
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

