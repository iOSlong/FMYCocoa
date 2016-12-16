//
//  FMYViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/14.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYViewController: UIViewController {
    var itemInfo:NSDictionary = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false

        
        self.title      = self.itemInfo.allValues.first as? String

        // Do any additional setup after loading the view.
    }

}
