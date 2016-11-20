//: Playground - noun: a place where people can play
//direct//intial,access, print append remove
import UIKit

//without array
print("without array")
 var n1=10
 var n2=20
 var n3=30
 var n4=40
print(n1)
print(n2)
print(n3)
print(n4)

// with array
print("with array")
var ar=[10,20,30,40]
for item in ar{
    print(item)
}
print("print with index")
for index in 0...3 {
    print(ar[index])
}
/// array other

var ar2:[Any] = [10,3.4, "hello"]
var ar3:[String] = ["10","3.4", "hello"]


var jobs = [String]() //var jobs1 = Array<String>()
jobs.append("engineer")
jobs.append("developer")
jobs.append("tester")
jobs.remove(at: 1)














