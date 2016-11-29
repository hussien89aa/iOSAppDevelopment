//
//  ViewController.swift
//  SunSetApp
//
//  Created by hussien alrubaye on 11/29/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var laReulst: UILabel!
    @IBOutlet weak var laCity: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    @IBAction func buGetSunSet(_ sender: Any) {
        
        let url="https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22\(laCity.text!)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
        LoadURL(url: url)
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func LoadURL(url:String){
       
        //paralel process
        DispatchQueue.global().async {
          
        do{
            // load json server
            let AppURL=URL(string: url)!
            let data=try Data(contentsOf: AppURL)
            let json=try JSONSerialization.jsonObject(with: data ) as! [String:Any]
            let query=json["query"] as!  [String:Any]
             let results=query["results"] as!  [String:Any]
               let channel=results["channel"] as!  [String:Any]
             let astronomy=channel["astronomy"] as!  [String:Any]
            //print(astronomy["sunset"]!)
            // access to UI
            DispatchQueue.global().sync {
           self.laReulst.text="Sunset at:\(astronomy["sunset"]!)"
            }
           
        }
        catch {
            print("cannot load from server")
        }
             }
        
    }
    
  
}

