//
//  AddItem.swift
//  StoreApp
//
//  Created by hussien alrubaye on 1/25/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import CoreData
class AddItem: UIViewController, UIPickerViewDelegate
,UIPickerViewDataSource,
UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var pvSotreType: UIPickerView!
    @IBOutlet weak var ivToolImage: UIImageView!
    @IBOutlet weak var txtToolName: UITextField!
    var ListStoreType=[StoreType]()
    var EditOrDeleteItem:Items?
    var imagePicker:UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
 pvSotreType.dataSource=self
        pvSotreType.delegate=self
        imagePicker=UIImagePickerController()
        imagePicker.delegate=self
        LoadStoes()
        if EditOrDeleteItem != nil {
            LoadForEdit()
        }
    }
// start picker view implement
    func LoadStoes() {
        let fecthRequest:NSFetchRequest<StoreType>=
        StoreType.fetchRequest()
        do{
          ListStoreType=try context.fetch(fecthRequest)
        }catch{
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ListStoreType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     let store=ListStoreType[row]
        return store.name
    }
    // end picker view implement
    

    
    @IBAction func BuBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // implment image picker
    @IBAction func BuSelectImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            ivToolImage.image=image
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
      // end implment image picker
    
    @IBAction func BuSave(_ sender: Any) {
      
        let newItem:Items!
        if EditOrDeleteItem == nil {
           newItem=Items(context: context)
        }else{
           newItem=EditOrDeleteItem
        }
            
        
        newItem.item_name=txtToolName.text
        newItem.date_add=NSDate()
        newItem.image=ivToolImage.image
        newItem.toStore=ListStoreType[pvSotreType.selectedRow(inComponent: 0)]
        do{
            ad.saveContext()
            txtToolName.text=""
            print("saved")
        }catch
        {
        print("Error")
        }
    }
    
    func   LoadForEdit() {
        if let item = EditOrDeleteItem{
           txtToolName.text=item.item_name
           ivToolImage.image=item.image as? UIImage
            
            if let store=item.toStore {
                var index=0
                while index<ListStoreType.count {
                    let row=ListStoreType[index]
                    if row.name==store.name{
                        pvSotreType.selectRow(index, inComponent: 0, animated: false)
                    }
                    index=index+1
                }
            }
        }
       
    }
    
    
    @IBAction func BuDelete(_ sender: Any) {
        if EditOrDeleteItem != nil{
            context.delete(EditOrDeleteItem! )
            ad.saveContext()
          _ =  navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
 
}
