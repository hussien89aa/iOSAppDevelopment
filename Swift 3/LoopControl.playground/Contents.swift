//: Playground - noun: a place where people can play

import UIKit


for item in 1...10  {
    
    print("item \(item)")
    
    if item == 5 {
        break;
    }
}

print("Break app is done")



// continue
for item in 1...10  {
    
    if  item == 5 {
        continue; // ingoure all next code in loop
    }
    
    print("item \(item)")
    
   
}

print("app is done")
