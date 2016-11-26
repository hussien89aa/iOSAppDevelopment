//
//  ViewController.swift
//  StoryApp
//
//  Created by hussien alrubaye on 11/26/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,
UICollectionViewDataSource{
    @IBOutlet weak var CollectionViewList: UICollectionView!
  var PersonsList = Array<Person>()
    override func viewDidLoad() {
        super.viewDidLoad()
         readPropertyList()
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PersonsList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell:CollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.laFoodImage.image=UIImage(named: PersonsList[indexPath.row].Image!)
         cell.laFoodName.text=PersonsList[indexPath.row].Name!
        return cell
    }
    var SelectPerson:Person?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      SelectPerson=PersonsList[indexPath.row]
        performSegue(withIdentifier: "ViewController2", sender: PersonsList[indexPath.row])
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let dis = segue.destination as? ViewController2 {
                if let p=sender as? Person {
                    dis.OnePerson=p
                }
            }
      
        
    }
    // View controller layerd
    //load from file
    func readPropertyList() {
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dictArray = plist as! [[String:String]]
        for dic in dictArray {
            //    print(dic["Name"]!)
                PersonsList.append(Person(Name: dic["Name"]!, Desc:dic["Des"]!, Image: dic["Image"]!))
        }
    }
    

}

