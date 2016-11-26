//
//  ViewController2.swift
//  StoryApp
//
//  Created by hussien alrubaye on 11/26/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var OnePerson:Person?
    @IBAction func BuBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var laFoodDes: UITextView!
    @IBOutlet weak var laFoodTitle: UILabel!
    @IBOutlet weak var laFoodImage: UIImageView!
     override func viewDidLoad() {
        super.viewDidLoad()
     
        laFoodTitle.text = OnePerson?.Name!
         laFoodDes.text = OnePerson?.Desc!
         laFoodImage.image  = UIImage(named: (OnePerson?.Image!)!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
