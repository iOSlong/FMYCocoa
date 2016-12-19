//
//  FMYProtocalViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/19.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit



// 声明一个协议
@objc protocol ColorSentDelegate {
    func colorSent(color:UIColor)
   
    @objc optional func colorSentBack(color:UIColor) -> Bool
}



class FMYProtocalViewController: FMYViewController {

    var delegate :ColorSentDelegate? = nil
    let arrColor = [UIColor.red,UIColor.yellow,UIColor.blue,UIColor.green,UIColor.cyan,UIColor.orange,UIColor.purple,UIColor.brown,UIColor.black];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        
        configureColorBtn()
        // Do any additional setup after loading the view.
    }
    
    func configureColorBtn()  {
        let btn_w = f_ScreenW * 0.2
        let btn_h = CGFloat(35.0)
        let btn_v = f_ScreenW * 0.1
        for  i in 0...self.arrColor.count-1 {
            let color   = self.arrColor[i]
            let btn     = UIButton(type: .roundedRect)
            btn.tag     = i
            btn.backgroundColor = color
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            btn.frame   = CGRect(x: btn_v + CGFloat(i%3) * (btn_v + btn_w), y: btn_v + CGFloat(i/3) * (btn_h + btn_v), width: btn_w, height: btn_h)
            
            self.view.addSubview(btn)
        }
    }
    
    func btnClick(btn:UIButton) {
        print(btn.backgroundColor ?? UIColor.white)
        if btn.tag % 2 == 0 {
            if (self.delegate?.colorSentBack!(color: btn.backgroundColor!))!{
                self.view.backgroundColor = btn.backgroundColor;
            }
        }
        else{
            self.delegate?.colorSent(color: btn.backgroundColor!)
            self.navigationController!.popViewController(animated: true)
        }
    }
}
