//: Playground - noun: a place where people can play
// direct//intial,access, print append remove
import UIKit
var s=[2,5,8,8]
var ar = Array<Any>()
ar.append("hussein")
ar.append("ahmed")
ar.append("jena")
print(ar.count)
ar[0]
ar.remove(at: 0)
for item in ar {
    print(item)
}

var dic = [Int:String]()
dic[1]="hi"
for (k,v) in dic {
    print(v)
}
var sets=Set<Int>()
sets.insert(1)
sets.insert(9)
sets.insert(8)
for item in sets {
    print(item)
}
