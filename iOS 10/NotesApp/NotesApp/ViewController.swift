//
//  ViewController.swift
//  NotesApp
//
//  Created by hussien alrubaye on 1/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDetails: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func BuSave(_ sender: Any) {
        // save in  nites entity
   let newNote = MyNotes(context: context)
        newNote.title=txtTitle.text
        newNote.details=txtDetails.text
        newNote.date_save=NSDate()
        do{
        ad.saveContext()
            print("saved")
            txtTitle.text=""
            txtDetails.text=""
        }
        catch{
            print("error")
        }
        
    }
}

