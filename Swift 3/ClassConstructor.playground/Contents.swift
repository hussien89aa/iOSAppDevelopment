//: Playground - noun: a place where people can play

import UIKit
//

class Car{
    //properties
    var type:String?
    var model:Int?
    var price:Double?
    var MilesDrive:Int?
    var Owner:String?
    
    
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
         print("Class created with parameter")
    }
    
    init() {
    
        print("Class created without parameter")
    }
    
   
}

let car1 = Car(type: "BMW", model: 2016, price: 10000.2, MilesDrive: 20, Owner: "hussein alrubaye")
car1.Owner="hussein alrubaye"
let pricecar1 = car1.GetPrice()
car1.GetOwner()

let car2 = Car()
car2.type="Sony"
car2.model=2016
car2.price=10200.2
car2.MilesDrive=10
car2.Owner="Jena alrubaye"
let pricecar2 = car1.GetPrice()
car2.GetOwner()


let carar = [Car]()




