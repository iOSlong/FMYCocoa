//
//  FMYNetWorkingViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/20.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYNetWorkingViewController: FMYViewController ,URLSessionDownloadDelegate{
    var downLoadBtn : UIButton? = nil
    var linkBtn : UIButton?     = nil
    var fieldUrl : UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configureUIItems()
    }
    
    func configureUIItems() {
        self.linkBtn    = UIButton(type: .roundedRect)
        self.linkBtn?.size = CGSize(width: 40, height: 30)
        self.linkBtn?.setTitle("linkUrl", for: .normal)
        self.linkBtn?.setTitleColor(UIColor.red, for: .normal)
        self.linkBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        self.linkBtn?.addTarget(self, action: #selector(linkBtnClick(_:)), for: .touchUpInside)
        
        
        self.fieldUrl   = UITextField(frame: CGRect(x: f_left, y: f_navBarH + f_spanV, width: f_ScreenW - 2 * f_left, height: 30))
        self.fieldUrl?.text = "http://120.25.226.186:32812/resources/videos/minion_02.mp4"
        self.fieldUrl?.borderStyle      = .roundedRect
        self.fieldUrl?.rightViewMode    = .always
        self.fieldUrl?.font             = UIFont.systemFont(ofSize: 10)
        self.fieldUrl?.rightView        = self.linkBtn
        self.view.addSubview(self.fieldUrl!)
        
        
        self.downLoadBtn    = UIButton(type: .roundedRect)
        self.downLoadBtn?.setTitle("downLoad", for: .normal)
        self.downLoadBtn?.frame = CGRect.init(x: f_left, y:(self.fieldUrl?.bottom)! + f_spanV, width: 100, height: 30)
        self.downLoadBtn?.layer.borderColor = UIColor.blue.cgColor
        self.downLoadBtn?.layer.borderWidth = 3
        self.downLoadBtn?.layer.cornerRadius = 5
        self.downLoadBtn?.addTarget(self, action: #selector(downLoadBtnClick(_:)), for: .touchUpInside)
        self.view.addSubview(self.downLoadBtn!)
        
    }

    func downLoadBtnClick(_ btn:UIButton) {
        print("进行下载操作")
        self.downLoadFromUrl(urlStr: (self.fieldUrl?.text)!)
    }
    
    
    func downLoadFromUrl(urlStr:String) {
        let url = URL(string: urlStr)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let session = URLSession.init(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue:OperationQueue.main)
        
        let request:URLRequest = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 100)
        
        let downloadTask:URLSessionDownloadTask = session.downloadTask(with: request)
        
        downloadTask.resume()
    }
    
    // MARK:    URLSessionDownloadDelegate: required
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        //下载文件名
        let fPath = downloadTask.response?.suggestedFilename
        print("path: \(location) name:\(fPath)")
        
        let dictCahePath = diskCachePath(nameSpace: "down_files")
        if FileManager.default.fileExists(atPath: dictCahePath) == false {
            do {
                try FileManager.default.createDirectory(atPath: dictCahePath, withIntermediateDirectories: true, attributes: [:])
                print(dictCahePath)
            } catch (let error) {
                print(error)
            }
        }
        // 从下载临时文件temp中转移文件
        let desPath = dictCahePath.appendingFormat("/\((downloadTask.response?.suggestedFilename)!)")
        do {
            try FileManager.default.moveItem(at: location, to: URL.init(fileURLWithPath: desPath))
        } catch (let error) {
            print(error)
            
        }
        
        // 删除临时文件
        do {
            try FileManager.default.removeItem(at: location)
        } catch (let error) {
            print(error)
            
        }
    }
    
    // MARK:    URLSessionDownloadDelegate : optional
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let  pro:CGFloat = 1.0 * CGFloat(totalBytesWritten / totalBytesExpectedToWrite);
        print("----downlod -->\(pro)")
        
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print(error ?? "")
    }
    
//    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
//        
//    }
    
//    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        print("")
//    }
    
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
//        
//    }
    
    
   
    
    

    
    
    func linkBtnClick(_ btn:UIButton) {
        print("got to safiri in :\(self.fieldUrl?.text)")
        let anyobj:[String : AnyObject] = ["":"" as AnyObject]
        let url:URL = URL(string: (self.fieldUrl?.text)!)!
        // # 声明一个Closures 常量 （带参数，返回值为空，闭包名为 strPrintBlock）
//        let strPrintBlock:(Bool) -> Void = { infoStr in
//            print(infoStr)
//        }
//        UIApplication.shared.open(<#T##url: URL##URL#>, options: <#T##[String : Any]#>, completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        UIApplication.shared.open(url, options:anyobj, completionHandler: {booV in
            print("openUrl_booV:\(booV)")
        })
    }
    
    
    
    
    
    
    
}
