//: Playground - noun: a place where people can play

import UIKit

func sum(n1:Int, n2:Int)->Int {
    // block of code
    let r = n1 + n2;
  
    return r;
}


var Result = sum(n1: 10, n2: 12)
var Result1 = sum(n1: 33, n2: 12)
var Result2 = sum(n1: 21, n2: 12)

func display(name:String)->String{
    
    return("Hello \(name) to func")
}


var r = display(name:"hussein")