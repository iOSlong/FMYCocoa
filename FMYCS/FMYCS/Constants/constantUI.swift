
//
//  constantUI.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/14.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import Foundation


// MARK: CONSTANT VALUE

let f_ScreenW       = UIScreen.main.bounds.size.width
let f_ScreenH       = UIScreen.main.bounds.size.height
let f_left          = f_ScreenW * 0.0382
let f_spanV         = f_left
let f_spanH         = f_left
let f_statusBarH    = UIApplication.shared.statusBarFrame.size.height
let f_navBarH       = f_statusBarH + 44




// MARK: CONSTANT FUNCTION(PARAM)
/*
 因为Swift共用一个命名空间,只要不是private，其他地方就可以直接调起
 1. 带参数的使用func 实现
 2. 不带参数的使用let 变量
 */

func RGBCOLOR (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) ->(UIColor) {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGBACOLOR(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}





// FIXME: SOMETHING SHOULD KNOW
func RGBCOLOR_HEX(h:String) -> UIColor {
    // 第一感觉， swift的字符串解析好恶心
    let prefix_index = h.index(h.startIndex, offsetBy: 2)
    let prefix:String   = h.substring(to: prefix_index)

    NSLog(prefix)
    
    // TODO:  String toInt()?
    let number:String    = h.substring(from: prefix_index)
//    let red:Int = number.intValue()
    
    
//    NSLog("\number + \red")
    
    
//    NSLog(<#T##format: String##String#>, <#T##args: CVarArg...##CVarArg#>)
//    let red:CGFloat     = h
    NSLog(h)
    
    return UIColor.red
}


//  MARK: String About
let url_videos =   "http://120.25.226.186:32812/resources/videos/minion_02.mp4"
let url_regionCountry = "http://ws.webxml.com.cn/WebServices/WeatherWS.asmx/getRegionCountry"
let url_webxmlBase  = "http://www.webxml.com.cn/WebServices/WeatherWebService.asmx"



