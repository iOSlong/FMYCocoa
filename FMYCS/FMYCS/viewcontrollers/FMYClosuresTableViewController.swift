//
//  FMYClosuresTableViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/16.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYClosuresTableViewController: UITableViewController {
    var arrSources:NSMutableArray = []
    
    func configueSourcesForReload(reload : Bool) {
        self.arrSources.add(["first" : "Closure-base"])
        self.arrSources.add(["second": "Values-base"])
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
        }
        closuresVC?.itemInfo = content as! NSDictionary
        self.navigationController?.pushViewController(closuresVC!, animated: true)
        print("\(indexPath)")
    }

    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}