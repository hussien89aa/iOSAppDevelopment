//: Playground - noun: a place where people can play

import UIKit

protocol ListView{
    
    func GetItemsCount(Ietms:[String])->Int
    func ViewItems(Items:[String])
}


class MainController:ListView{
    internal func ViewItems(Items: [String]) {
       
        for item in Items{
            print(item)
        }
    }

    internal func GetItemsCount(Ietms: [String]) -> Int {
     
        return Ietms.count
    }

    
    
    init() {
        print("app started")
      var count =  GetItemsCount(Ietms: ["ali","ahmed","Jasim","Sami"])
        ViewItems(Items: ["ali","ahmed","Jasim","Sami"])
    }
}


var startMainController = MainController()