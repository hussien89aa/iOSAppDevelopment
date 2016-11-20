//: Playground - noun: a place where people can play
//Polymorphism
import UIKit

func add( n1:Int ,n2 :Int)->Int{
    
    return n1 + n2+1
}


func add( n1:Double ,n2 :Double)->Double{
    
    return n1 + n2+2
}

func add( n1:Double ,n2 :Int)->Double{
    
    return n1 + Double( n2) + 3.0
}


add(n1: 3, n2: 4)
add(n1: 3.0, n2: 4.0)
add(n1: 3.0, n2: 4)

