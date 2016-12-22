//
//  FMYClosuresViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/16.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit


class FMYClosuresViewController: FMYViewController {

    var tempVar = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
        
        self.closuresFuncBaseOne()
        
        self.callModelClosures()
        
        self.callCallBackClosures()
        
        self.callBlockComplexity()
    }
    func callBlockComplexity() {
//        let completionHander:(String, Array<String>, String) -> Void { (str1, arr1, str2) in
//            print(str1)
//        }
        
        let mycompletionHander = {(str1:String,  str2:String) ->String  in
            return str1 + str2
        }
        print(mycompletionHander("444","555"))
        
        
    }
    
    
    
    func callCallBackClosures() {
        //# 通过闭包实现值在两个对象之间的来回传递。
        let fmyObj      = FMYObject()
        fmyObj.funcSendClosure { (inputStr) -> String in
            print(inputStr)
            return inputStr.substring(from: inputStr.startIndex)
        }
        fmyObj.funcForGetInfoClosure()
        
        
        
        fmyObj.funcParamsClosure { (str1, str2) -> String in
            print("\(str1)+\(str2)")
            return str1+str2
        }
        print(fmyObj.paramsVC!("yyyy","QQQQ"))
        
        fmyObj.funcParams { (str1, str2) -> String in
            
            print("\(str1)+\(str2)")
            return str2 + str1
        }
        
    }
    
    func callModelClosures() {
        let fmyObj  = FMYObject()
        let getStr  = fmyObj.funcForCallDesc()
        print(getStr)
    }
  
    
    func closuresFuncBaseOne() {
        
        // # 声明一个Closures 常量 （带参数，返回值为空，闭包名为 strPrintBlock）
        let strPrintBlock:(NSString) -> Void = { infoStr in
            print(infoStr)
        }
        strPrintBlock("swift block done!")
        
        
        // # 声明一个Closures 常量 （带参数，返回值为NSString 类型，闭包名为 strGetMiddleCharElementBlock）
        let strGetMiddleCharElementBlock:(NSString) -> String = { inputStr in
            let middleStr = inputStr.substring(with: NSRange.init(location: inputStr.length/2, length: 1))
            return middleStr as String
        }
        let midleChar = strGetMiddleCharElementBlock("superManOnYours")
        print(midleChar)
        
        
        // # 声明一个Closures 常量，  不带参数，没有返回值，闭包名为 emptyBlock
        let emptyBlock:() -> Void = { [unowned self] in
            // 注意为了避免闭包造成的循环引用，【unowned self】
            self.tempVar = NSString(format: "%d", arc4random()%100) as String
            if arc4random()%10 <= 5 {
                self.closuresFuncBaseOne()
            }
            print("empty block set")
        }
        emptyBlock()
    }
}
