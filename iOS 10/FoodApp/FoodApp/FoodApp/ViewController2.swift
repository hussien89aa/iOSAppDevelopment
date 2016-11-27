//
//  ViewController2.swift
//  FoodApp
//
//  Created by hussien alrubaye on 11/27/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var  SingelItem:FoodItem?
    @IBOutlet weak var laName: UILabel!
    
    @IBOutlet weak var laDes: UITextView!
    @IBOutlet weak var laImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        laName.text = SingelItem?.Name!
        laDes.text = SingelItem?.Des!
        laImage.image = UIImage(named: (SingelItem?.Image!)!)
        // Do any additional setup after loading the view.
    }

    @IBAction func buDismiss(_ sender: Any) {
        
       dismiss(animated: true, completion: nil)
    }
  

}
