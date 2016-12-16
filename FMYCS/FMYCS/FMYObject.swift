//
//  FMYObject.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/16.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit
typealias sendValueClosure = (_ inputStr:String) -> String

class FMYObject: NSObject {
    var sendVC:sendValueClosure?

    
    let closureDesc:() -> NSString =  {
        return "haha hello world"
    }
    
    // 实现单向调用闭包
    public func funcForCallDesc() -> NSString {
      return  self.closureDesc()
    }
    
    // 定义一个闭包函数进行回调处理
    public func funcForGetInfoClosure() {
        if sendVC != nil {
            let backV =  sendVC!("thisMyValueForyou")
            print(backV)
        }
    }
    // 使用这个方法，将闭包复制的处理处理的紧凑一些
    public func funcSendClosure(sendVClosure : sendValueClosure!) {
        self.sendVC = sendVClosure
    }
    
}
