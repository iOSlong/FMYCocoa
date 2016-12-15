//
//  FMYUtils.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/15.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

public enum FMYViewType {
    case viewTypeLabel
    case viewTypeImageView
    case viewTypeScrollView
    case veiwTypeButton
    case viewTypeSegmentControl
    case viewTypeSwitch
    case viewTypeView
    case viewTypeNone
}

/// define one public function 根据字符串名字，判断原声控件类型
///
/// - Parameter className: name of the UIView‘s subview or UIView
/// - Returns: self define type of one enum case
public func judgeViewType(className:String) -> FMYViewType {
    let labelName   = NSStringFromClass(UILabel.self)
    let imgvName    = NSStringFromClass(UIImageView.self)
    let scrolName   = NSStringFromClass(UIScrollView.self)
    
    let buttomName  = NSStringFromClass(UIButton.self)
    let segmentName = NSStringFromClass(UISegmentedControl.self)
    let switchName  = NSStringFromClass(UISwitch.self)
    
//    //对比字符长的方法 onetwothree
//    if className.compare(imgvName) == .orderedSame {
//        return .viewTypeImageView
//    }
//    if className == labelName {
//        return .viewTypeLabel
//    }
    
    
//    let object      = NSClassFromString(className) as! UILabel.Type
//    if (object.isKind(of:UILabel.self)){
//        NSLog("is UILabel");
//    }

    switch className {
    case labelName:
        return  .viewTypeLabel
    case imgvName:
        return  .viewTypeImageView
    case scrolName:
        return  .viewTypeScrollView
    case buttomName:
        return  .veiwTypeButton
    case segmentName:
        return  .viewTypeSegmentControl
    case switchName:
        return  .viewTypeSwitch
    default:
        return  .viewTypeNone
    }
}


class FMYUtils: NSObject {
    
    
    
}
