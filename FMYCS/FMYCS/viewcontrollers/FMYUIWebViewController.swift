//
//  FMYUIWebViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/20.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYUIWebViewController: FMYViewController {

    var webView:UIWebView?  = nil
    var url:URL?            = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        self.configureUIWebViewItems()
    }

    func configureUIWebViewItems() {
        
        self.webView = UIWebView(frame: self.view.frame)
        self.view.addSubview(self.webView!)
        
        self.url = URL.init(string: url_videos);
        let request = URLRequest.init(url: self.url!)
        self.webView?.loadRequest(request)
    }
}
