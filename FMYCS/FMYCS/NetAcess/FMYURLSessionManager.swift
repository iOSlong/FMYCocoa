//
//  FMYURLSessionManager.swift
//  FMYCS
//
//  Created by xw.long on 16/12/21.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit


typealias FMYSessionTaskCompletionHander = (_ response:URLResponse, _ responseObject : Any , _ error:Error) -> Void

class FMYURLSessionManager: NSObject,URLSessionDataDelegate {
    var session:URLSession? = nil
    var operationQueue:OperationQueue? = nil

    var dataTasks:Array<URLSessionDataTask> = []


    var sessionConfiguration:URLSessionConfiguration? = nil
    
    var completionHander:FMYSessionTaskCompletionHander? = nil
    

    override convenience init(){
        self.init(configuration:nil)
    }

    init(configuration:URLSessionConfiguration?) {
        super.init()
        
        if configuration == nil {
            self.sessionConfiguration = URLSessionConfiguration.default
        }
        
        
        self.operationQueue = OperationQueue()
        self.operationQueue?.maxConcurrentOperationCount = 1
        
        
        self.session    = URLSession(configuration: self.sessionConfiguration!, delegate: self, delegateQueue: self.operationQueue)
        
//        self.session?.getTasksWithCompletionHandler({ (dataTasks, uploadTasks, downloadTasks) in
//            for task in dataTasks {
//                
//            }
//        })
    }
    
    
    
    // MARK: instance Methods
//    func dataTask(request:) -> <#return type#> {
//        <#function body#>
//    }
//    func dataTask(request:URLRequest) -> URLSessionDataTask {
//        <#function body#>
//    }
    
    
    
    
    // MARK: URLSessionDataDelegate   URLSessionTaskDelegate
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        muData.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        print(error ?? "")
//        self.parseXMLData(muData)
//        let dataStr =  String(data: muData, encoding: .utf8)
//        print(dataStr ?? "")
    }

    
    
}
