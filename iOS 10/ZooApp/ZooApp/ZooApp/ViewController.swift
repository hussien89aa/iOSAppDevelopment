//
//  ViewController.swift
//  ZooApp
//
//  Created by hussien alrubaye on 11/26/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var notkillerAnimal=["Monkey","Donkey","Elephant","Deer","Cow"]
     var  killerAnimal=["Bear","Tigger","Loain","Fox","Shark"]
    var Sections=[ "Not Killer","Killer"]
    @IBOutlet weak var TableViewList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //TableViewList.dataSource=self
       // TableViewList.delegate=self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notkillerAnimal.count
    }
    // 5 time call
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section==0 {
           cell.textLabel?.text=notkillerAnimal[indexPath.row]
        }else{
              cell.textLabel?.text=killerAnimal[indexPath.row]
        }
      
        
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(notkillerAnimal[indexPath.row])
        notkillerAnimal.append("new animal")
        TableViewList.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

