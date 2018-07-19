//
//  ViewController.swift
//  Calculator
//
//  Created by 성곤 김 on 2018. 7. 8..
//  Copyright © 2018년 SeongKon Kim. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    
    private var previousTag : Int = 0; private var operatorChk : Bool = false
    var result: String = ""
    private var dotChk: Bool = false
    
    var test : String = ""
    var test1 : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabel.isHidden = false
        answerLabel.isHidden = true
        numberLabel.text = "0"
        progressLabel.text = ""
        answerLabel.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        numberLabel.isHidden = false
        answerLabel.isHidden = true
        numberLabelNumberUpdate(_sender : sender)
        progressLabelNumbeUpdate(_sender: sender)
        result = Calculate.arithmetic(formula: progressLabel.text!, tag: sender.tag)
        answerLabel.text = result
        previousTag = sender.tag
       
    }
    
    
    @IBAction func dotPressed(_ sender: UIButton) {
        
    }
    @IBAction func arithmeticPressed(_ sender: UIButton) {
//        print("previousTag = \(previousTag)")
//        print("sender.tag = \(sender.tag) \n")
//
        //check if progressLabel is not empty
        if(progressLabel.text != ""){
            progressLabelOperatorUpdate(_sender : sender)
        }
        operatorChk = true
        numberLabel.isHidden = true
        answerLabel.isHidden = false
        previousTag = sender.tag
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
        labelSignUpdate()
        previousTag = sender.tag
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        progressLabel.text = ""
        numberLabel.text = "0"
        previousTag = 0
        answerLabel.text = ""
        numberLabel.isHidden = false
        answerLabel.isHidden = true
        dotChk = false;
        result = ""
    }
    
    //check if user pressed the same operator multiple times
    //if user pressed the operator and changed, delete the previous operator and replace with the new operator
    //ouput on progressLabel but not on numberLabel
    
    
    //press once clear num2 presss twice clear all
    
    private func labelSignUpdate(){
        //numberLabel
        let startIndex = numberLabel.text?.startIndex
        if(numberLabel.text![startIndex!] > "0" && numberLabel.text![startIndex!] <= "9"){
            numberLabel.text = "-" + numberLabel.text!
            //progressLabel
            progressLabel.text = String(progressLabel.text!.dropLast((numberLabel.text?.count)! - 1))
            progressLabel.text = progressLabel.text! + numberLabel.text!
        }else if(numberLabel.text![startIndex!] == "-"){
            progressLabel.text = String(progressLabel.text!.dropLast((numberLabel.text?.count)!))
            numberLabel.text = String(numberLabel.text!.dropFirst())
            progressLabel.text = progressLabel.text! + numberLabel.text!
        }
    }
    private func numberLabelNumberUpdate(_sender:UIButton){
        if(operatorChk == false){
            if(numberLabel.text == "0"){
                numberLabel.text = String(_sender.tag)
            }else{
                numberLabel.text = numberLabel.text! + String(_sender.tag)
            }
        }else{
            numberLabel.text = String(_sender.tag)
            operatorChk = false
        }
    }
    
    //empty string: cannot use 0 as first number
    private func progressLabelNumbeUpdate(_sender: UIButton){
        if(progressLabel.text == "" && _sender.tag != 0){
            progressLabel.text = progressLabel.text! + String(_sender.tag)
        }else if progressLabel.text != ""{
            progressLabel.text = progressLabel.text! + String(_sender.tag)
        }
    }
    
    private func progressLabelOperatorUpdate(_sender : UIButton){
        
        //take out the last character and add the new operator
        if previousTag >= 12 && previousTag <= 18{
            progressLabel.text = String((progressLabel.text?.dropLast())!)
            progressLabel.text = progressLabel.text! + _sender.currentTitle!
            
        }else if previousTag != _sender.tag{
            progressLabel.text = progressLabel.text! + _sender.currentTitle!
        }
    }
    
    
    
    private func addDouble(previousNumber : String, currentNumber : String) -> String{
        let num1 : Double = Double(previousNumber)!
        let num2 : Double = Double(currentNumber)!
        numberLabel.isHidden = true
        
        let result : Double = num1 + num2
        return String(result)
    }
    
}

