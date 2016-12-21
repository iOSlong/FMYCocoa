//
//  FMYUIListViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/14.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit
import WebKit

class FMYUIListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrSource:NSMutableArray = []
    

    
    private var _tableView:UITableView?
    var tableView:UITableView{
        get {
            if _tableView == nil {
                _tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .grouped)
                _tableView?.dataSource  = self
                _tableView?.delegate    = self
                _tableView?.tintColor   = UIColor.black
                _tableView?.sectionIndexTrackingBackgroundColor = UIColor.black
                _tableView?.sectionIndexColor = UIColor.black
                _tableView!.sectionIndexBackgroundColor = UIColor.black
                return _tableView!
            }
            return _tableView!
        }
    }
    
    // UITableView Delegate & DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.arrSource[section] as AnyObject).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = "cellIdentifer"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: identifier)
        }
        let sectionArr:NSArray  = self.arrSource[indexPath.section] as! NSArray
        let item:NSDictionary   = sectionArr[indexPath.row] as! NSDictionary
        cell?.textLabel?.text   = item.allValues.first as! String?
        cell?.accessoryType     = UITableViewCellAccessoryType.disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return  "showInfo Views"
        }
        else if section == 1 {
            return  "control Views"
        }else if section == 2 {
            return  "webview Shows"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NSLog("\(indexPath)")
        let sectionArr:NSArray  = self.arrSource[indexPath.section] as! NSArray
        let item:NSDictionary   = sectionArr[indexPath.row] as! NSDictionary

        if indexPath.section == 0 {
            let uishowVC        = FMYUIShowViewController()
            uishowVC.itemInfo   = item
            self.navigationController!.pushViewController(uishowVC, animated: true)
        }else if indexPath.section == 1 {
            let controlVC = FMYUIControlViewController()
            controlVC.itemInfo  = item
            self.navigationController!.pushViewController(controlVC, animated: true)
        }else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let uiwebVC   = FMYUIWebViewController()
                self.navigationController!.pushViewController(uiwebVC, animated: true)
            }else{
                let wkwebVC   = FMYNetWorkingViewController()
                self.navigationController!.pushViewController(wkwebVC, animated: true)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //When we are getting a value of tableview it fires get{} part of tableview property
        self.view.addSubview(self.tableView)
        self.tableView.backgroundColor = UIColor.purple
        
        configureDataSource(reload: true)
    }
    
    
    func configureDataSource(reload:Bool) {
        let labelName   = NSStringFromClass(UILabel.self)
        let imgvName    = NSStringFromClass(UIImageView.self)
        let scrolName   = NSStringFromClass(UIScrollView.self)
        
        let buttomName  = NSStringFromClass(UIButton.self)
        let segmentName = NSStringFromClass(UISegmentedControl.self)
        let switchName  = NSStringFromClass(UISwitch.self)
        
        let uiwebName   = NSStringFromClass(UIWebView.self)
        let wkwebName   = NSStringFromClass(WKWebView.self)// 引用它需要 import WebKit

        
        
        let showArr     = [["label":labelName],
                           ["imageView":imgvName],
                           ["scrollView":scrolName]]
        
        let controlArr  = [["buttom":buttomName],
                           ["segment":segmentName],
                           ["switch":switchName]]
        
        let webArray    = [["uiwebView":uiwebName],
                           ["wkwebView":wkwebName]]
        

        self.arrSource.add(showArr)
        self.arrSource.add(controlArr)
        self.arrSource.add(webArray)
        
        if reload {
            self.tableView.reloadData()
        }
    }

}
