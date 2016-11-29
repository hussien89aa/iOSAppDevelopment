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
        let url:String="http://swift3foodapp.alruabye.net/MobileWebService3.asmx/GetNewsNow?UserID=21153&StratFrom=1&EndTo=20&SubNesourceID=0&NewsID=0&Type=0&q=%40"
        ReadFromURL(url: url) ;
        
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
       // cell.laImage.image = UIImage(named: FoodList[indexPath.row].Image!)
        cell.SetImage(url:FoodList[indexPath.row].Image!)
        return cell
    }
    
    
    
    
    
    
    
    
    
    func ReadFromURL(url:String)   {
   
        //paralel process
        DispatchQueue.global().async {
            
            do{
                // load json server
                let AppURL=URL(string: url)!
                let data=try Data(contentsOf: AppURL)
                let json=try JSONSerialization.jsonObject(with: data ) as! [String:Any]
                let FoodList=json["newData"] as! [[String:String]]
               
                
                // access to UI
                DispatchQueue.global().sync {
                    for food in FoodList{
                        self.FoodList.append(FoodItem(Name: food["NewsTitle"]!, Des: food["NewsTitle"]!, Image: food["PicturLink"]! ))
                    }
                    self.CollectionViewList.reloadData();
                    
                 //   self.laReulst.text="Sunset at:\(astronomy["sunset"]!)"
                }
                
            }
            catch {
                print("cannot load from server")
            }
        }
        
    }


}

