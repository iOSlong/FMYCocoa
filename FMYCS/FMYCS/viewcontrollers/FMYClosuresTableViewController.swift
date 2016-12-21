//
//  FMYClosuresTableViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/16.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYClosuresTableViewController: UITableViewController , ColorSentDelegate{
    var arrSources:NSMutableArray = []
    
    func configueSourcesForReload(reload : Bool) {
        self.arrSources.add(["first" : "Closure-base"])
        self.arrSources.add(["second": "Values-base"])
        self.arrSources.add(["third": "Protocal"])
        self.arrSources.add(["fourth":"NetWorking"])
        self.arrSources.add(["fifth":"NetXMLSchema"])
        if reload {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        configueSourcesForReload(reload: true)
    }
    
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSources.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil {
            cell =  UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        }
        let content             = self.arrSources[indexPath.row] as? NSDictionary
        cell?.accessoryType      = .disclosureIndicator
        cell?.textLabel?.text    = content?.allValues.first as! String?
        cell?.backgroundColor   = UIColor.clear
        cell?.textLabel?.textColor = RGBCOLOR_HEX(h: "0x123456")
        return cell!
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let content         = self.arrSources[indexPath.row]
        var closuresVC:FMYViewController?
        if indexPath.row == 0 {
            closuresVC  = FMYClosuresViewController()
        }else if indexPath.row == 1 {
            closuresVC  = FMYValuesTypeViewController()
        }else if indexPath.row == 2 {
            closuresVC  = FMYProtocalViewController()
            (closuresVC as! FMYProtocalViewController).delegate = self
        }else if indexPath.row == 3 {
            closuresVC  = FMYNetWorkingViewController()
        }else if indexPath.row == 4 {
            closuresVC  = FMYNetXMLSchemaViewController()
        }
        closuresVC?.itemInfo = content as! NSDictionary
        self.navigationController?.pushViewController(closuresVC!, animated: true)
        print("\(indexPath)")
    }

    
    
    // ColorSentDelegate
    func colorSent(color: UIColor) {
        self.tableView.backgroundColor = color
        self.view.backgroundColor   = color
    }
    
    func colorSentBack(color: UIColor) -> Bool {
        self.view.backgroundColor  = UIColor.white
        self.tableView.backgroundColor = color;
        return true
    }
    
    
    
    
   
}
