//
//  FMYUIShowViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/14.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit


class FMYUIShowViewController: FMYViewController , UIScrollViewDelegate{
    var scrollView:UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        self.navigationController?.navigationBar.isTranslucent  = false
        
        
        let className   = self.itemInfo.allValues.first as! String
        let viewType = judgeViewType(className: className)
        switch viewType {
        case .viewTypeLabel:
            configureItemOfUILabel()
        case .viewTypeImageView:
            configureItemOfUIImageView()
        case .viewTypeScrollView:
            configureItemOfUIScrollView()
        default: break
        }
        
    }
    
    
    func configureItemOfUILabel(){
        let className =  NSStringFromClass(UILabel.self)
        let labelClass = NSClassFromString(className) as? UILabel.Type
        let label = labelClass!.init()
        //

        label.frame = CGRect.init(x: 0, y: 0, width: 300, height: 100)
        label.left  = 100
        label.text  = self.itemInfo.description
        label.font  = UIFont.systemFont(ofSize: 20)
        label.numberOfLines         = 0
        label.backgroundColor       = UIColor.red
        label.layer.borderColor     = UIColor.white.cgColor
        label.layer.borderWidth     = 2
        label.layer.cornerRadius    = 10.0
        label.sizeToFit()
        label.center                = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y: UIScreen.main.bounds.size.height * 0.4)
        self.view.addSubview(label)
    }
    
    
    func configureItemOfUIImageView() {
        let imageview   = UIImageView(frame: CGRect(x:f_left , y: f_navBarH + f_spanV, width: f_ScreenW - 2 * f_left, height: f_ScreenH * 0.4))
        imageview.image             = UIImage(named: "moonNight.jpg")
        imageview.contentMode       = .scaleAspectFit
        imageview.backgroundColor   = UIColor.purple
        self.view.addSubview(imageview)
    }
    
    
    func configureItemOfUIScrollView() {
        let scrollView  = UIScrollView.init(frame: CGRect.init(x: f_left, y: f_navBarH + f_spanV, width: f_ScreenW - 2 * f_left, height: f_ScreenH * 0.4))
        scrollView.layer.borderColor    = UIColor.yellow.cgColor
        scrollView.layer.borderWidth    = 5
        scrollView.delegate             = self
        scrollView.isPagingEnabled      = true
        self.scrollView = scrollView
        self.view.addSubview(scrollView)
        self.addScrollItems(items: ["moonNight.jpg","yellowMoonCityNight.jpg","yellowMoonFlash.jpg"])
    }
    
    func addScrollItems(items:Array<String>){
        var offsetX:CGFloat = 0
        for imgName in items {
            let image       =   UIImage(named: imgName)
            let imageV      =   UIImageView(frame: CGRect(x: offsetX, y: 0, width: (self.scrollView?.width)!, height: (self.scrollView?.height)!))
            offsetX         +=  (self.scrollView?.width)!
            imageV.image    =   image
            self.scrollView?.addSubview(imageV)
        }
        self.scrollView?.contentSize          = CGSize(width: CGFloat(items.count) * (scrollView?.width)!, height: (scrollView?.height)!)
    }
}
