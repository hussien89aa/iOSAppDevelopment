//
//  ViewController2ViewController.swift
//  ZooApp
//
//  Created by hussien alrubaye on 11/26/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit
 
class ViewController2ViewController:  UIViewController,UITableViewDataSource,UITableViewDelegate{

   
    
    var notkillerAnimal = Array<Animal>()
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        notkillerAnimal.append(Animal(Name: "baboon", Desc: "live in  big place with tree....", Image: "baboon"))
          notkillerAnimal.append(Animal(Name: "bulldog", Desc: "bulldog live in  big place with tree....", Image: "bulldog"))
          notkillerAnimal.append(Animal(Name: "panda", Desc: "panda live in  big place with tree....", Image: "panda"))
          notkillerAnimal.append(Animal(Name: "swallow_bird", Desc: "swallow_bird live in  big place with tree....", Image: "swallow_bird"))
          notkillerAnimal.append(Animal(Name: "white_tiger", Desc: "white_tiger live in  big place with tree....", Image: "white_tiger"))
          notkillerAnimal.append(Animal(Name: "zebra", Desc: "zebra live in  big place with tree....", Image: "zebra"))
        // Do any additional setup after loading the view, typically from a nib.
        //TableViewList.dataSource=self
        // TableViewList.delegate=self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notkillerAnimal.count
    }
    // 5 time call
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            // cell.textLabel?.text=notkillerAnimal[indexPath.row]
     cell.laName.text=notkillerAnimal[indexPath.row].Name!
        cell.laDes.text =  notkillerAnimal[indexPath.row].Desc!
        cell.laImage.image = UIImage(named: notkillerAnimal[indexPath.row].Image!)
        return cell;
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
