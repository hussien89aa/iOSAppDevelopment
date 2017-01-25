//
//  VCAddStore.swift
//  StoreApp
//
//  Created by hussien alrubaye on 1/25/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class VCAddStore: UIViewController {

    @IBOutlet weak var txtStoreName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func BuSave(_ sender: Any) {
        let store=StoreType(context: context)
        store.name=txtStoreName.text
        do{
            ad.saveContext()
            txtStoreName.text=""
            print("saved")
        }catch{
            print("cannot save")
        }
    }
   

    @IBAction func BuBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
}
