//
//  FMYUIControlViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/14.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYUIControlViewController: FMYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        let className   = self.itemInfo.allValues.first as! String
        let viewType = judgeViewType(className: className)
        switch viewType {
        case .veiwTypeButton:
            configureItemOfUIButton()
        case .viewTypeSwitch:
            configureItemOfUISwitch()
        case .viewTypeSegmentControl:
            configureItemOfUISegmentControl()
        default: break
        }
    
    }
    
    func configureItemOfUIButton() {
        let button = UIButton(type: .roundedRect)
        button.setTitle(self.itemInfo.allValues.first as! String?, for: .normal)
        button.imageEdgeInsets      = UIEdgeInsetsMake(5, 5, 5, 5)
        button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        button.size         = CGSize(width: 100, height: 30)
        button.centerX      = f_ScreenW * 0.5
        button.centerY      = f_ScreenH * 0.5
        button.layer.zPosition      = 10.0
        button.layer.shadowOffset   = CGSize.init(width: button.width * 0.1, height: button.height * 0.1)
        button.layer.shadowColor    = UIColor.purple.cgColor
        button.layer.shadowRadius   = button.height * 0.1
        button.layer.shadowOpacity  = 0.6;
        button.layer.borderWidth    = 3.0;
        button.layer.cornerRadius   = button.height * 0.382
        button.layer.borderColor    = UIColor.orange.cgColor

        self.view.addSubview(button)
    }
    func buttonClick(_ button:UIButton) {
        print(button.title(for: .normal) ?? "hahaha")
        self.performSelector(onMainThread: #selector(showHintInfo), with: nil, waitUntilDone: true)
    }
    func showHintInfo() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        perform(#selector(hiddenHintInfo), with: self, afterDelay: 3)
    }
    func hiddenHintInfo() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func configureItemOfUISwitch() {
        let swc     = UISwitch.init(frame: CGRect.init(x: f_left, y: f_navBarH, width: 60, height: 30))
        swc.addTarget(self, action: #selector(switchItemEvent(_ :)), for: .valueChanged)
        self.view.addSubview(swc)
    }
    func switchItemEvent(_ sw:UISwitch) {
        print("isOne: \(sw.isOn)")
    }
    
    
    func configureItemOfUISegmentControl() {
        let segment     = UISegmentedControl.init(frame: CGRect.init(x: f_left, y: f_navBarH, width: f_ScreenW * 0.8, height: 40))
        segment.addTarget(self, action: #selector(segmentControlEvent(_:)), for: .valueChanged)
        segment.tintColor   = UIColor.black
        segment.insertSegment(withTitle: "知苦", at: 0, animated: false)
        segment.insertSegment(withTitle: "治集", at: 1, animated: false)
        segment.insertSegment(withTitle: "证灭", at: 2, animated: false)
        segment.insertSegment(withTitle: "求道", at: 3, animated: false)
        self.view.addSubview(segment)
    }
    func segmentControlEvent(_ segment:UISegmentedControl) {
        
        print("\(segment.selectedSegmentIndex) + \(segment.titleForSegment(at: segment.selectedSegmentIndex))")
        
    }
}
