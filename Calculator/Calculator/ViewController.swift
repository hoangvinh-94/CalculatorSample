//
//  ViewController.swift
//  Calculator
//
//  Created by healer on 4/19/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelResult: UILabel!
    var opertion = 0
    var previousNumber:Double = 0
    var currentNumber:Double = 0
    var temp = ""
    var haveOperation = false
    var point = false
    var headboardClicked = false
    var flag = false
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if(sender.tag == 11 && labelResult.text != "" && !point){
            labelResult.text! += "."
            point = true
            temp += "."
        }
        else if (sender.tag != 11){
            if(haveOperation){
                temp = ""
                labelResult.text! += String(sender.tag)
                temp += String(sender.tag)
                currentNumber = Double (temp)!
                haveOperation = false
            }
            else{
                labelResult.text! += String(sender.tag)
                temp += String(sender.tag)
                currentNumber = Double (temp)!
            }
            point = false
        }
    }

    @IBAction func operations(_ sender: UIButton) {
        if(labelResult.text != "" && !flag){
            flag = true
            if(headboardClicked){
                previousNumber = Double(labelResult.text!)!
                headboardClicked = false
            }
            else{
                 previousNumber = currentNumber
            }
           
            switch(sender.tag){
            case 14:
                    labelResult.text! += "+"
                    
            break
            case 15: labelResult.text! += "-"
            break
            case 16: labelResult.text! += "/"
            break
            case 17: labelResult.text! += "*"
            break
            case 13: labelResult.text! = String(Double (labelResult.text!)!/100)
                flag = false
            break
            case 12:
                let a = Double (labelResult.text!)! * (-1)
                labelResult.text = String(a)
                flag = false
            break
            default:
                break
        }
            opertion = sender.tag
            haveOperation = true
            point = true
            
        }
        
    }

    @IBAction func controller(_ sender: UIButton) {
        if(sender.tag == 10){
            switch(opertion){
            case 14:
                labelResult.text = String(previousNumber + currentNumber)
            break
            case 15:
                labelResult.text = String(previousNumber - currentNumber)
            break
            case 16:
                labelResult.text = String(previousNumber / currentNumber)
            break
            case 17:
                labelResult.text = String(previousNumber * currentNumber)
                break
            default:
            break
            }
            headboardClicked = true
            point = false
            flag = false
        }
        if(sender.tag == 20){
            labelResult.text = ""
            previousNumber = 0
            currentNumber = 0
            haveOperation = false
            opertion = 0
            temp = ""
            point = false
            flag = false
        }
    }
}

