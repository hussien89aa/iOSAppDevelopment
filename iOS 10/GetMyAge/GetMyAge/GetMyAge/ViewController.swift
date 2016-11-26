//
//  ViewController.swift
//  GetMyAge
//
//  Created by hussien alrubaye on 11/25/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LaDisplay: UILabel!
    @IBOutlet weak var DatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buGetAge(_ sender: Any) {
       let CurrentDate = Date()
       let UserDOB=DatePicker.date
        let calender = Calendar.current
        let component=calender.dateComponents( [Calendar.Component.day], from:UserDOB, to:CurrentDate)
        var Years:Int=Int(component.day!/356)
        var Months:Int=(component.day!-(Years*356))/30
        var Days:Int=component.day!-((Months*30) + (Years*356))
        LaDisplay.text="Your age is \(Years) Years, and \(Months)Months, and \(Days)Days"
   
    }

}

