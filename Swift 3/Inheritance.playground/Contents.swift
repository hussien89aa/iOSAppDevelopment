//: Playground - noun: a place where people can play

import UIKit
//

class Car{
    //properties
  private  var type:String?
  private var model:Int?
  private  var price:Double?
  private   var MilesDrive:Int?
  private   var Owner:String?
    
    
    //methods
    
    func GetPrice() -> Double {
        
        let NewPrice = price! -  (Double)( MilesDrive! * 10 )
        return NewPrice
    }
    
    func GetOwner() -> String {
        return Owner!
    }
    //init
    
    init(type:String,model:Int,price:Double,MilesDrive:Int,Owner:String) {
        self.type=type
        self.model=model
        self.price=price
        self.MilesDrive=MilesDrive
        self.Owner=Owner
 print("car created")
    }
    
    init() {
        GetOwner();
        print("Class created without parameter")
    }
    
    
}

class Track:Car{
    
    //new
    func GetModel() -> Int {
        return model!
    }
    
    override func GetPrice() -> Double {
        
        let NewPrice = price! -  (Double)( MilesDrive! * 20 )
        return NewPrice
    }
    func PriceGeting()  {
        super.GetPrice()
    }
    
    override init(type:String,model:Int,price:Double,MilesDrive:Int,Owner:String) {
 print("truck created")
        super.init(type: type, model: model, price: price, MilesDrive: MilesDrive, Owner: Owner)
    
    }
    
}



let car1 = Car(type: "BMW", model: 2016, price: 10000.2, MilesDrive: 20, Owner: "hussein alrubaye")
let pricecar1 = car1.GetPrice()
car1.GetOwner()

 let track1 = Track(type: "Big track", model: 2017, price: 277363.5, MilesDrive: 110, Owner: "Laya")
track1.GetOwner()
track1.GetPrice()
track1.GetModel()
track1.PriceGeting()




