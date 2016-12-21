//
//  FMYNetXMLSchemaViewController.swift
//  FMYCS
//
//  Created by xuewu.long on 16/12/21.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit

class FMYNetXMLSchemaViewController: FMYViewController,URLSessionDataDelegate,XMLParserDelegate, UITableViewDelegate,UITableViewDataSource {
    var muData:Data = Data()
    var currentElement:String? = nil
    var list:Array<FMYRegionCountry> = []
    var regionCountry:FMYRegionCountry? = nil
    
    private var _table:UITableView? = nil
    var tableView:UITableView {
        get {
            if (_table != nil) {
                return _table!
            }
            _table = UITableView.init(frame: self.view.bounds, style: .plain)
            _table?.dataSource = self
            _table?.delegate  = self
            return _table!
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.view.addSubview(self.tableView)

        
        self.netGetRegionCountry()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = "cellIdentifer"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: identifier)
        }
        
        let regionC = self.list[indexPath.row]
        cell?.textLabel?.text = regionC.name
        cell?.detailTextLabel?.text = regionC.ID
        
        return cell!
    }
    
    
    
    
    
    
    
    func netGetRegionCountry() {
        let request = URLRequest(url: URL(string: url_regionCountry)!)
        
        let session = URLSession.init(configuration:  URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
        
        let dataTask = session.dataTask(with: request)
        
        dataTask.resume()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    
    //URLSessionDataDelegate  URLSessionDelegate
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        muData.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print(error ?? "")
        self.parseXMLData(muData)
        let dataStr =  String(data: muData, encoding: .utf8)
        print(dataStr ?? "")
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        print(section())
    }
    
    
    func parseXMLData(_ xmlData:Data) {
        let par:XMLParser = XMLParser.init(data: xmlData)
        par.delegate    = self
        par.parse()
    }
    
    // MARK:XMLPARSERDELEGATE
    //几个代理方法的实现，是按逻辑上的顺序排列的，但实际调用过程中中间三个可能因为循环等问题乱掉顺序
    //开始解析
    func parserDidStartDocument(_ parser: XMLParser) {
        print("parserDidStartDocument...")
    }
    
    //准备节点
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        self.currentElement = elementName;
        
        if self.currentElement == "string" {
            self.regionCountry = FMYRegionCountry()
        }
    }
    
    //获取节点内容
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if self.currentElement == "string" {
            self.regionCountry?.regionCountry = string
        }else{
            print(string)
        }
    }
    
    //解析完一个节点
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "string" {
            print(self.currentElement ?? "")
            self.list.append(self.regionCountry!)
        }
        
        self.currentElement = nil
    }
    
    //解析结束
    func parserDidEndDocument(_ parser: XMLParser) {
        print(self.list)
        self.tableView.reloadData()
    }
}
