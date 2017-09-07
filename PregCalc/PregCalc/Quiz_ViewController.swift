//
//  Quiz_ViewController.swift
//  PregCalc
//
//  Created by 折戸　征也 on 1/19/16.
//  Copyright © 2016 折戸医院. All rights reserved.
//

import UIKit

class Quiz_ViewController: UIViewController {
    @IBOutlet weak var n1: UILabel!
    @IBOutlet weak var n2: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var solution: UILabel!
    @IBOutlet weak var next: UIButton!

    @IBOutlet weak var label_d1: UITextField!
    @IBOutlet weak var label_symbol: UILabel!
    
    @IBOutlet weak var label_d2: UITextField!
    
    @IBOutlet weak var d1: UIStepper!
    @IBOutlet weak var symbol: UIStepper!
    @IBOutlet weak var d2: UIStepper!

    var d_d1: Int = 1
    var s_symbol: Int = 1
    var d_d2: Int = 1
    var n_n1: Int = 0
    var n_n2: Int = 0
    var s_solution: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func next(_ sender: UIButton){
        let d12 = Double(d_d1)
        let d22 = Double(d_d2)
//        let d_d13 = pow(10,d_d12)
//        let d_d23 = pow(10,d_d22)
//        let d_d14 = Int(d_d13)
//        let n21 = (arc4random() % pow(10,d_d22) )
 
        let n11 = Int(drand48()*(pow(10,d12)-1)+1)
        let n12 = Int(drand48()*(pow(10,d22)-1)+1)

        switch s_symbol {
            case 1:
            n_n1 = n11
            n_n2 = n12
            s_solution = n_n1 + n_n2
            case 2:
            n_n1 = n11 + n12
            n_n2 = n12
            s_solution = n11
            case 3:
            n_n1 = n11
            n_n2 = n12
            s_solution = n_n1 * n_n2
            case 4:
            n_n1 = n11 * n12
            n_n2 = n12
            s_solution = n11
        default: break
        }
        n1.text = "\(n_n1)"
        n2.text = "\(n_n2)"
        solution.text = "____"
    }

    @IBAction func answer(_ sender: UIButton){
//        let n11 = n1.text
//        let n21 = n2.text
//        if n11 != "__" {
//        let n12 = Int(n11!)!
//        let n22 = Int(n21!)!
        
/*        let weight4 = Int(weight3!)!
        let height4 = Int(height3!)!
        let weight5 = Double(weight4)
        let height5 = Double(height4)
*/
    solution.text = "\(s_solution)"

    }

    @IBAction func stepperValueChanged_d1(_ sender: UIStepper) {
        label_d1.text = Int(sender.value).description
        let temp = Int(sender.value).description
        d_d1 = Int(temp)!
    }
    @IBAction func stepperValueChanged_symbol(_ sender: UIStepper) {
        let symbol = Int(sender.value).description
        s_symbol = Int(symbol)!
        switch s_symbol {
        case 1: label_symbol.text = "+"
        case 2: label_symbol.text = "-"
        case 3: label_symbol.text = "✖️"
        case 4: label_symbol.text = "➗"
        default:break
        }
    }
    @IBAction func stepperValueChanged_d2(_ sender: UIStepper) {
        label_d2.text = Int(sender.value).description
        let temp = Int(sender.value).description
        d_d2 = Int(temp)!
    }
    
/*
    @IBAction func stepperAction(sender: AnyObject) {
    var stepper:Int
        level.text = "\(Int(stepper.value))"
        
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
