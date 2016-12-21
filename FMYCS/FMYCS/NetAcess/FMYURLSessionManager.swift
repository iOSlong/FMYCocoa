//
//  FMYURLSessionManager.swift
//  FMYCS
//
//  Created by xw.long on 16/12/21.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYURLSessionManager: NSObject {
    var session:URLSession? = nil
    var operationQueue:OperationQueue? = nil

    var dataTasks:Array<URLSessionDataTask> = []


    var sessionConfiguration:URLSessionConfiguration? = nil

    override convenience init(){
        self.init(configuration:nil)
    }

    init(configuration:URLSessionConfiguration?) {
        super.init()
        if configuration != nil {

        }
    }
}
