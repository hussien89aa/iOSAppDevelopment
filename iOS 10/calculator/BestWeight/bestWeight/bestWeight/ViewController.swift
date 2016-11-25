//
//  ViewController.swift
//  bestWeight
//
//  Created by hussien alrubaye on 11/25/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate {

       var Rateing=["Good","Bad"]
    var gender=["male","Feamle"]
    
    @IBOutlet weak var PickerGender: UIPickerView!
    @IBOutlet weak var laDisplayBestWeight: UILabel!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PickerGender.dataSource=self
        PickerGender.delegate=self
   
        
    }
    
    @IBOutlet weak var laSelectedGender: UILabel!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    var SelectedGener=0
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                SelectedGener=row
               // if component==0 {
        return gender[row]
       // }
          //      else {
         //        return Rateing[row]
       // }
      //  pickerView.tag==0
     //  pickerView.tag==0
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        laSelectedGender.text=gender[row];
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buGetBestWeight(_ sender: Any) {
        // calcaute best weight
        let age:Int=Int(txtAge.text!)!
        let  height:Int=Int(txtHeight.text!)!
        
        var BestWeigth = height*10 - (age/5)
        if SelectedGener==0 {
            // male
            BestWeigth+=10
        }
        else{
             BestWeigth-=10
        }
       laDisplayBestWeight.text="Best weight \(BestWeigth)"
        
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       self.view.endEditing(true)
        return true
    }
    
}

