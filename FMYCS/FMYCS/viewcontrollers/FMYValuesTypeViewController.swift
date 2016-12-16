//
//  FMYValuesTypeViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/16.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYValuesTypeViewController: FMYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.comparisonObjectFunc()
    }

    
    func comparisonObjectFunc() {
        var baseVar     = "hahahahaha"
        let referOne    = baseVar
        print("baseVar:\(baseVar) | referOne:\(referOne)")
        
        baseVar = "YYUUYUYYU"
        print("baseVar:\(baseVar) | referOne:\(referOne)")
        
        var referTwo    = baseVar
        print("baseVar:\(baseVar) | referTwo:\(referTwo)")
        
        referTwo    = "JJJJJDJDJDJDJ"
        print("baseVar:\(baseVar) | referTwo:\(referTwo)")
        
        baseVar     = "MNMNMNNMMMMM"
        print("baseVar:\(baseVar) | referTwo:\(referTwo)")
        // 打印结果显示，每一个单独的声明的变量和常量，他们的值都是copy属性的。
        //        baseVar:hahahahaha | referOne:hahahahaha
        //        baseVar:YYUUYUYYU | referOne:hahahahaha
        //        baseVar:YYUUYUYYU | referTwo:YYUUYUYYU
        //        baseVar:YYUUYUYYU | referTwo:JJJJJDJDJDJDJ
        //        baseVar:MNMNMNNMMMMM | referTwo:JJJJJDJDJDJDJ
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
