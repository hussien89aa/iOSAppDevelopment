//: Playground - noun: a place where people can play

import UIKit

var x:Int = 10 //public

print(x)

func printval(){ //block
    let y:Int = 12 //local
    print(y)
    print(x)
    // print(z) error
}

printval()

//print(y) error

if (x == 10){
   let z=x+1  //local
    print(z)
}

 


// print(z)  // error

func div(n1:Int, n2:Int){
    do
    { // try
    let r=n1/n2
    print(r)
    }
    catch {
        print("cannot device by zero")
    }
    print("end")
}

div(n1: 4, n2: 2)

// div(n1: 4, n2:0)











