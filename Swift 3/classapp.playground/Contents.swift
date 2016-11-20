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
}

let car1 = Car()
car1.type="BMW"
car1.model=2016
car1.price=10000.2
car1.MilesDrive=20
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




