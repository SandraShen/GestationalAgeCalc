//
//  LMP_ViewController.swift
//  PregCalc
//
//  Created by 折戸　征也 on 12/14/15.
//  Copyright © 2015 折戸医院. All rights reserved.
//

import UIKit

class LMP_ViewController: UIViewController {
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var GA_Label: UILabel!
    @IBOutlet weak var LMP: UIDatePicker!  // LMP.date
//    @IBOutlet weak var RD: UIDatePicker!  // RD.date
    @IBOutlet weak var EDD_Label: UILabel!
    @IBOutlet weak var TodayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clear_func()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(_ sender: UIButton){
        let LMP2 = LMP.date
        let RD2 = Date() //RD.date
        let preg1 = ( RD2.timeIntervalSince1970 - LMP2.timeIntervalSince1970 )/60/60/24
        let preg2 = round ( preg1 )
        let preg3:Int = Int( preg2 )
        let weeks2:Int = Int(preg3/7)
        let days2:Int = Int(preg3 - weeks2 * 7)
        GA_Label.text = "\(weeks2) 週 \(days2) 日  ／  \(preg3+1)日目"
        
     //   let EDDtemp = LMP2.timeIntervalSince1970 + 280*60*60*24
        let DaysToAdd = 280
        var newDateComponents = DateComponents()
        newDateComponents.day = DaysToAdd
        var calculatedEDD = Date()
        calculatedEDD = (Calendar.current as NSCalendar).date(byAdding: newDateComponents, to: LMP.date, options: NSCalendar.Options.init(rawValue: 0))!

        let calendar = Calendar.current
        let EDDComponents = (calendar as NSCalendar).components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year], from: calculatedEDD)
        
        EDD_Label.text = "\(EDDComponents.year) 年 \(EDDComponents.month) 月 \(EDDComponents.day) 日"
        
    }
    
    @IBAction func clear(_ sender: UIButton){
        clear_func ()
        
    }
    
    func clear_func() {
        LMP.date = Date()
        //RD.date = NSDate()
        //RD = Reference Date
        GA_Label.text = "■■■■■■"
        EDD_Label.text = "■■■■■■■■■■"
        let Aujourdhui = Date()
        let Aujourdhui_calendar = Calendar.current
        let Aujourdhui_components = (Aujourdhui_calendar as NSCalendar).components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year], from: Aujourdhui)
        let Aujourdhui_year = Aujourdhui_components.year
        let Aujourdhui_month = Aujourdhui_components.month
        let Aujourdhui_day = Aujourdhui_components.day
        
        TodayLabel.text = "\(Aujourdhui_year)年\(Aujourdhui_month)月\(Aujourdhui_day)日"

        
/*
        NSDate *DIES = [NSDate date];
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy/MM/dd";
        NSString *str = [fmt stringFromDate:DIES];
        _checkDIES.text = str;
        _DatePickerDIES.date = DIES;
        _checkLMP.text = str;
        _DatePickerLMP.date = DIES;
        _checkEDD.text = str;
        _DatePickerEDD.date = DIES;
*/
        


    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
