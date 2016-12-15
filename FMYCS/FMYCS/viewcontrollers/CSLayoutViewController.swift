//
//  CSLayoutViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/14.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit
import ContactsUI


class CSLayoutViewController: UIViewController {
    // 声明变量
    var imgvRed:UIImageView     = UIImageView()
    var imgvGreen:UIImageView   = UIImageView()
    var imgvBlue:UIImageView    = UIImageView()
    var imgvBase:UIImageView    = UIImageView()
    
    //  Swift中的 set 方法 和 get 方法处理，   懒加载的实现。TODO
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var hxColor = RGBCOLOR_HEX(h: "0x00ff44")
        hxColor     = RGBCOLOR(r: 255, g: 100, b: 100, a: 1)
        self.view.backgroundColor = hxColor
        
        configureConstraints()
        
    }
    func loadUIItems() {
        imgvBase.backgroundColor = UIColor.red
        imgvBase.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imgvBase.translatesAutoresizingMaskIntoConstraints = false
        
        self.view .addSubview(self.imgvBase)
        self.imgvBase.addSubview(self.imgvRed)
        self.imgvBase.addSubview(self.imgvGreen)
        self.imgvBase.addSubview(self.imgvBlue)
    }
    func configureConstraints(){
//        let baseW:NSLayoutConstraint  = NSLayoutConstraint.init(item: imgvBase, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
//        let baseH:NSLayoutConstraint  = NSLayoutConstraint.init(item: imgvBase, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
//        let baseX:NSLayoutConstraint  = NSLayoutConstraint.init(item: imgvBase, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 50)
//        let baseY:NSLayoutConstraint  = NSLayoutConstraint.init(item: imgvBase, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 50)
        
        
        
        
        let myView = self.imgvBase

        // Get the superview's layout
        let margins = myView.layoutMarginsGuide
        
        // Pin the leading edge of myView to the margin's leading edge
        myView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        myView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Give myView a 1:2 aspect ratio
        myView.heightAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 2.0)
        
        
        
//        NSLayoutConstraint(item: myView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
//        
//        NSLayoutConstraint(item: myView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
//        
//        NSLayoutConstraint(item: myView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute:.width, multiplier: 2.0, constant:0.0).isActive = true

//        imgvBase.addConstraint(baseH)
//        imgvBase.addConstraint(baseW)
//        imgvBase.addConstraint(baseX)
//        imgvBase.addConstraint(baseY)
        
    }
}
