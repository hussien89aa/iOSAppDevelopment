//: Playground - noun: a place where people can play

import UIKit


var  number=1

if number==1 {
    print("number is one")
}
else if number==2 {
    print("number is Two")
}
else if number==3 {
    print("number is Three")
}
else if number==4 {
    print("number is Four")
}
else{
    print("out range")
}
// two code is same
switch number {
case 1:
        print("number is one")
case 2:
     print("number is Two")
case 3:
  print("number is Three")
case 4:
    print("number is Four")
default:
    print("out range")
}