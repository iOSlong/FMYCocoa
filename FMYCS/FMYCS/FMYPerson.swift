//
//  FMYPerson.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/19.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYPerson: NSObject {
    var name:   String
    var friends:[FMYPerson] = []
    var bestFriend:FMYPerson? = nil

    
    init(name:  String) {
        self.name = name
    }

}
