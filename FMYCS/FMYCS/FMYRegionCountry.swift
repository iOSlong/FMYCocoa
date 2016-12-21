//
//  FMYRegionCountry.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/21.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYRegionCountry: FMYObject {
    var regionCountry:String? = nil
    
    // 重写get方法
    private var _name:String? = nil
    var name:String {
        get{
            _name = self.regionCountry?.components(separatedBy: ",").first
            return _name!
        }
    }

    private var _ID:String? = nil
    var ID:String {
        get {
            _ID = self.regionCountry?.components(separatedBy: ",").last
            return _ID!
        }
    }
    
}
