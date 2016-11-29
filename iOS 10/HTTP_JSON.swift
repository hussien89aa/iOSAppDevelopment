 //FoodURL url
 //http://attach.alruabye.net/iOSAppDevelopment/GetFood.json
 
// http://swift3Foodapp.alruabye.net/MobileWebService3.asmx/GetNewsNow?UserID=21153&StratFrom=1&EndTo=20&SubNesourceID=0&NewsID=0&Type=0&q=%40
 //details
 //http://swift3Foodapp.alruabye.net/NewsDetails.aspx?NID="+NewsID+"&id="+ GlobalClass.UserID + "&share=no"

 func LoadJSONFromURL(path:String){
         let url = URL(string: path)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                let json = try JSONSerialization.jsonObject(with: data) as!  [String:Any]
               //print(json)
               
                let dicArray=json["newData"] as! [[String:String]]
                DispatchQueue.global().sync {
                    //   self.videoPreviewImage.image = UIImage(data: data)
                    for dic in dicArray {
                        self.FoodList.append(FoodItem(Name: dic["NewsTitle"]!, Des: dic["NewsTitle"]!, Image: dic["PicturLink"]! ))
                    }
                   
                  self.CollectionViewList.reloadData()
                }
            } catch  {
                //handle the error
            }
            
            
        }
        
        }

//download image from url

         public   func setImage(ImageUrl:String){
        DispatchQueue.global().async {
            do {
                  let url = URL(string: ImageUrl)!
                let data = try Data(contentsOf: url)
                
                 DispatchQueue.global().sync {
                self.laImage.image = UIImage(data: data)
                   
                }
            } catch  {
                //handle the error
            }
            
            
        }
    }

