//
//  ViewController.swift
//  PickerViewAdv
//
//  Created by hussien alrubaye on 11/25/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,
UIPickerViewDataSource{
 var accounts=["admin","user", "manger", "tester"]
     var users=["hussein","jena", "laya", "waeel"]
      var testers=["tester1","tester2", "tester3" ]
    
    @IBOutlet weak var LaDisplay: UILabel!
    @IBOutlet weak var PickerViewAdv: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       PickerViewAdv.dataSource=self
       PickerViewAdv.delegate=self
        PickerView2.dataSource=self
        PickerView2.delegate=self
    }

    @IBOutlet weak var PickerView2: UIPickerView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag==0 {
        return 2
        }else {
              return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
             if pickerView.tag==0 {
        return accounts.count
        }
             else {
                return testers.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
               if pickerView.tag==0 {
        if component==0 {
        return accounts[row]
        }else{
           return users[row]
        }
        }
               else {
                return testers[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //LaDisplay.text=accounts[row]
                if pickerView.tag==0 {
        if component==0 {
       LaDisplay.text = accounts[row]
        }else{
     LaDisplay.text = users[row]
        }
        }
                else {
            LaDisplay.text = testers[row]
        }
    }

}

