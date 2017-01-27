//
//  ViewController.swift
//  ChatApp
//
//  Created by hussien alrubaye on 1/27/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController,
UITableViewDelegate,UITableViewDataSource
,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
 let UserName="Hussein" // TODO: will update soon
    @IBOutlet weak var txtText: UITextField!
    var ref=FIRDatabaseReference.init()
    var ListMessages=Array<Message>()
    var imagePicker:UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
      UserLogin()
        
        // database  instance
        self.ref=FIRDatabase.database().reference()
        
        tableView.dataSource=self
        tableView.delegate=self
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 250;
     LoadMessages()
        //
        imagePicker=UIImagePickerController()
        imagePicker.delegate=self
    }

   
    func UserLogin(){
        FIRAuth.auth()?.signInAnonymously(){ (user,error) in
            let isAnonymous=user!.isAnonymous
            if isAnonymous==true{
                let uid=user!.uid
                print( "uid:\(uid)")
            }
        }
    }

    @IBAction func buSend(_ sender: Any) {
               //self.ref.child("messages").child("UserName").setValue(UserName)
        // self.ref.child("messages").child("text").setValue(txtText.text)
        AddSnap(pImagPath: "no_image")
    }
    
    func AddSnap(pImagPath:String){
        let msg=[
            "UserName":UserName,
            "text":txtText.text,
            "postDate": FIRServerValue.timestamp(),
            "ImagePath":pImagPath
            ] as [String:Any]
        let FirebaseMessage=self.ref.child("messages").childByAutoId()
        FirebaseMessage.setValue(msg)
        txtText.text=""

    }
    
    // tbale ivee implement
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListMessages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let oneMessage=ListMessages[indexPath.row]
        
        if oneMessage.ImagePath == "no_image" {
          
        let cell:TableViewCell=tableView.dequeueReusableCell(withIdentifier: "cellText", for: indexPath) as! TableViewCell
        cell.setText(msg: oneMessage)
            self.SetStyleCell(cell:cell)
        return cell
        }
        else{
            //cellTextWithImage
            let cell:TableViewCell=tableView.dequeueReusableCell(withIdentifier: "cellTextWithImage", for: indexPath) as! TableViewCell
            cell.setTextWithImage (msg:  oneMessage)
            self.SetStyleCell(cell:cell)
            return cell
        }
    }
    // set style for the cell
    func SetStyleCell(cell:TableViewCell){
     
        cell.layer.cornerRadius=5 //set corner adius here
        cell.layer.borderColor =  UIColor.lightGray.cgColor // set cell border color here
        cell.layer.borderWidth = 3 // set border width here
    }
    
    func LoadMessages(){
        self.ref.child("messages").queryOrdered(byChild: "postDate").observe(.value, with: { (snapshot) in
            
            self.ListMessages.removeAll()
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    if let postDict = snap.value as? [String: AnyObject] {
                        //  let msgData = postDict as?  [String: AnyObject]
                        
                        self.setMessage(msgId: snap.key, msgData: postDict)
                        
                    }
                }
            }
            self.tableView.reloadData()
            // self.scrollToBottom()
            
        })
        

    }
    func scrollToBottom(){
        DispatchQueue.global(qos: .background).async {
            let indexPath = IndexPath(row: self.ListMessages.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func setMessage(msgId: String, msgData: [String: AnyObject]) {
        var text:String!
        var UserName:String!
        var PostDate:String!
        var ImagePath:String!
        if let UserName1 = msgData["UserName"] as? String {
            UserName = UserName1
        }
       
        
        if let postDate1 = msgData["postDate"] as? String {
            PostDate = postDate1
            
        }
        else{
            PostDate="no_date"}
        
        if let text1  = msgData["text"] as? String {
            text  = text1
        }
        else{
            text=" "}
        if let ImagePath1 = msgData["ImagePath"] as? String {
            ImagePath = ImagePath1
        }
        else{
            ImagePath = "no_image"}
        
        self.ListMessages.append(Message(text: text!, UserName: UserName!, PostDate: PostDate!, ImagePath: ImagePath!))
    }


    @IBAction func BuLoadImages(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
          //  picker is selected
            
            //load image to firebase
            //load images
            let storageRef = FIRStorage.storage().reference(forURL: "gs://demoyoutubeios.appspot.com")
            // Points to "images"
            // let imagesRef = storageRef.child("images")
            
            var data = NSData()
            data = UIImageJPEGRepresentation(image, 0.8)! as NSData
            let dateformat=DateFormatter()
            dateformat.dateFormat="MM_DD_yy_h_mm_a"
            let imageName=dateformat.string(from: NSDate() as Date )
            let ImagePah="images/\(imageName).jpg"
            // Create storage reference
            let mountainsRef = storageRef.child(ImagePah)
            
            // Create file metadata including the content type
            let metadata = FIRStorageMetadata()
            metadata.contentType = "image/jpeg"
            
            // Upload data and metadata
            mountainsRef.put(data as Data, metadata: metadata)
            
              AddSnap(pImagPath: ImagePah)
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }
}


