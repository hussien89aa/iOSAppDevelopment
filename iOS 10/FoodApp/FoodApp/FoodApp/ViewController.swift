//
//  ViewController.swift
//  FoodApp
//
//  Created by hussien alrubaye on 11/27/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,
UICollectionViewDataSource{
 var FoodList = Array<FoodItem>()
    @IBOutlet weak var CollectionViewList: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ReadFromPList() ;
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodList.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: FoodList[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dis=segue.destination as?  ViewController2{
         
            if  let Food=sender as? FoodItem {
                dis.SingelItem=Food
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.laName.text = FoodList[indexPath.row].Name!
        cell.laImage.image = UIImage(named: FoodList[indexPath.row].Image!)
        return cell
    }
    
    
    
    
    
    
    
    
    
    func ReadFromPList()   {
   
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let plist=try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dicArray=plist as! [[String:String]]
        for dic in dicArray {
            FoodList.append(FoodItem(Name: dic["Name"]!, Des: dic["Des"]!, Image: dic["Image"]! ))
        }
        
    }


}

