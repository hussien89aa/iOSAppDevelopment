//
//  Message.swift
//  ChatApp
//
//  Created by hussien alrubaye on 1/27/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class Message  {
    var text:String?
    var UserName:String?
    var PostDate:String?
    var ImagePath:String?
    init(text:String,UserName:String,PostDate:String,ImagePath:String) {
       
        self.text=text
        self.UserName=UserName
        self.PostDate=PostDate
        self.ImagePath=ImagePath
    }

}
