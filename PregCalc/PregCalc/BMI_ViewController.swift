//
//  BMI_ViewController.swift
//  PregCalc
//
//  Created by 折戸　征也 on 1/19/16.
//  Copyright © 2016 折戸医院. All rights reserved.
//

import UIKit
//UIPickerViewDelegate,UIPickerViewDataSource
class BMI_ViewController: UIViewController {
    
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var BMI: UILabel!
    
    @IBOutlet weak var h1: UITextField!
    @IBOutlet weak var h2: UITextField!
    @IBOutlet weak var w1: UITextField!
    @IBOutlet weak var w2: UITextField!
    
    @IBOutlet weak var Done: UIButton!
/*    @IBOutlet weak var picker1: UIPickerView!
    let pickerData = [ [ "0","1","2","3","4","5","6","7","8","9" ],[ "0","1","2","3","4","5","6","7","8","9" ] ]
    
    @IBOutlet weak var myLabel: UILabel!
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = pickerData[component]
        return compo.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = pickerData[component][row]
        return item
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = pickerData[component][row]
        let row1 = pickerView.selectedRowInComponent(0)
        let row2 = pickerView.selectedRowInComponent(1)
        myLabel.text = pickerData[component][row]
    }
*/
    
 //   class ViewController: UIViewController
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
 //       var picker1 = UIPickerView()
 //       picker1.delegate = self
 //       picker1.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(_ sender: UIButton){
        let h12 = h1.text
        let h22 = h2.text
        let w12 = w1.text
        let w22 = w2.text

        var h13: Int = 0
        var h23: Int = 0
        var w13: Int = 0
        var w23: Int = 0
        
        if h12 != "" { h13 = Int(h12!)! }
        if h22 != "" { h23 = Int(h22!)! }
        let height = Double(h13*10+h23)/10
        if w12 != "" { w13 = Int(w12!)! }
        if w22 != "" { w23 = Int(w22!)! }
        let weight = Double(w13*10+w23)/10
 
        var BMI_1:Double = 0
        if height != 0 { BMI_1 = weight / height / height * 10000}
        let BMI_2 = round(BMI_1 * 10)
        let BMI_3 = Double(BMI_2 / 10)
//        let BMI_4 = BMI_1 * 10
//        let BMI_5 = (BMI_4 - BMI_3)/10
        BMI.text = "\(BMI_3)"
    }
    
    @IBAction func clear(_ sender: UIButton){ clear_func ()
        }
    
    func clear_func() {
        h1.text = ""
        h2.text = ""
        w1.text = ""
        w2.text = ""
        BMI.text = "_____"
        }
//        @IBOutlet weak var picker: UIPickerView!
//        let menu = [ "0","1","2","3","4","5","6","7","8","9" ]

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
