//
//  ViewController.swift
//  Calculator
//
//  Created by Rishabh Bhandari on 30/05/19.
//  Copyright © 2019 Rishabh Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var previousNumber :Double = 0
    var performingMath: Bool = false
    var operation:Int = 0
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath {
            
            numberLabel.text = String(sender.tag-1)
            performingMath = false
        }
        else {
            
            numberLabel.text = numberLabel.text! + String(sender.tag-1)
            
            //previousNumber = Double(numberLabel.text!)!
        
        }
        
    }
    
    
    @IBAction func operation(_ sender: UIButton) {
        
        if sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(numberLabel.text!)!
            print(previousNumber)
            
            if sender.tag == 12 {
                
                numberLabel.text = "/"
                operation = 12
            }
            if sender.tag == 13 {
                
                numberLabel.text = "x"
                operation = 13
            }
            if sender.tag == 14 {
                
                numberLabel.text = "-"
                operation = 14
            }
            if sender.tag == 15 {
                
                numberLabel.text = "+"
                operation = 15
            }
            
            performingMath = true
            
        }
        
        else if sender.tag == 16 {
            
            if operation == 15 {
                numberLabel.text = String(Double(numberLabel.text!)!+previousNumber)
                previousNumber = 0
                performingMath = true
            }
            else if operation == 14 {
                numberLabel.text = String(previousNumber-Double(numberLabel.text!)!)
                previousNumber = 0
                performingMath = true
            }
            else if operation == 13 {
                numberLabel.text = String(previousNumber*Double(numberLabel.text!)!)
                previousNumber = 0
                performingMath = true
            }
            else if operation == 12 {
                numberLabel.text = String(previousNumber/Double(numberLabel.text!)!)
                previousNumber = 0
                performingMath = true
            }
        }
        
        else if sender.tag == 11 {
            
            previousNumber = 0
            numberLabel.text = ""
            operation = 0
        }
    
    
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

