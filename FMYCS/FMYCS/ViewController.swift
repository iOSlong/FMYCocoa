//
//  ViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/1.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testProblem()
        
    }

    func testProblem() {
        typealias TenCChars = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hi, all!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string1 = TenCChars(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        var string2 = TenCChars(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], 0, 0)
        
        // Hint: the problem occurs on this line
        strcpy(&string1.0, &string2.0)
        
        // And also on this line
        let destination = String(validatingUTF8: &string1.0)!
        assert(destination == source)
        
        
        
        
        

    }
    
    
    

}

