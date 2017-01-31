//
//  Pockemons.swift
//  Pockemon
//
//  Created by hussien alrubaye on 1/31/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class Pockemons  {
    var latitude:Double?
    var longitude:Double?
    var Image:String?
    var name:String?
    var des:String?
    var power:Double?
    var isCatch:Bool?
    init(latitude:Double,longitude:Double,Image:String,name:String, des:String,power:Double) {
        self.latitude=latitude
        self.longitude=longitude
        self.Image=Image
        self.name=name
        self.des=des
        self.power=power
        self.isCatch=false
    }

}
