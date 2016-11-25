//
//  ViewController.swift
//  calculator
//
//  Created by hussien alrubaye on 11/22/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var laDisplay: UILabel!
    @IBOutlet weak var laNumber1: UITextField!
  
    @IBOutlet weak var laNumber2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buClick(_ sender: Any) {
       // when button click
        let n1:Double = Double( laNumber1.text!)!
        let n2:Double  = Double( laNumber2.text!)!
        let sum =  n1 + n2
        laDisplay.text = "sum=\(sum)"
      
    }
}

