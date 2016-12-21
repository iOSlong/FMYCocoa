//
//  FMYUtils.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/15.
//  Copyright © 2016年 fmylove. All rights reserved.
//
/*
 MARK: reference_info_link
 1. Any & AnyObject  
    https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithObjective-CAPIs.html#//apple_ref/doc/uid/TP40014216-CH4-ID35
 
 
 */
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
    
    #if false
        let object:Any?   = NSClassFromString(className)
        if let object = object as? UILabel.Type {
            return  .viewTypeLabel
        }else if let object = object as? UIScrollView.Type{
            return  .viewTypeScrollView
        }else if let object = object as? UIImageView.Type {
            return  .viewTypeImageView
        }else if let object = object as? UISwitch.Type{
            return  .viewTypeSwitch
        }else if let object = object as? UISegmentedControl.Type {
            return  .viewTypeSegmentControl
        }else if let object = object as? UIButton.Type{
            return  .veiwTypeButton
        }else if let object = object as? UIImageView.Type {
            return  .viewTypeImageView
        }else{
            return  .viewTypeNone
        }
        
        let object2:AnyObject?   = NSClassFromString(className)
        if (object2 as? UILabel.Type) != nil {
            return  .viewTypeLabel
        }else if (object2 as? UIScrollView.Type) != nil{
            return  .viewTypeScrollView
        }else if (object2 as? UIImageView.Type) != nil {
            return  .viewTypeImageView
        }else if (object2 as? UISwitch.Type) != nil{
            return  .viewTypeSwitch
        }else if (object2 as? UISegmentedControl.Type) != nil {
            return  .viewTypeSegmentControl
        }else if (object2 as? UIButton.Type) != nil{
            return  .veiwTypeButton
        }else if (object2 as? UIImageView.Type) != nil {
            return  .viewTypeImageView
        }else{
            return  .viewTypeNone
        }
    #else
        let labelName   = NSStringFromClass(UILabel.self)
        let imgvName    = NSStringFromClass(UIImageView.self)
        let scrolName   = NSStringFromClass(UIScrollView.self)
        
        let buttomName  = NSStringFromClass(UIButton.self)
        let segmentName = NSStringFromClass(UISegmentedControl.self)
        let switchName  = NSStringFromClass(UISwitch.self)
        
        
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
    #endif
    
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
    
}


// MARK: Extention
extension UIBezierPath {
    convenience init(triangleSideLength:CGFloat, origin:CGPoint) {
        self.init()
        let squareRoot = CGFloat(sqrt(3.0))
        let altitude = (squareRoot * triangleSideLength) / 2
        move(to: origin)
        addLine(to: CGPoint(x: origin.x + triangleSideLength, y: origin.y))
        addLine(to: CGPoint(x: origin.x + triangleSideLength / 2, y: origin.y + altitude))
        close()
    }
}

//  MARK: PATH ABOUT
public func diskCachePath(nameSpace: String) -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
    return (paths.first?.appendingFormat("/\(nameSpace)"))!
//    return (paths.first?.appending(nameSpace))!
}




class FMYUtils: NSObject {
    
    
    
}
