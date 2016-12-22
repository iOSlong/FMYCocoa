//
//  FMYHTTPSessionManager.swift
//  FMYCS
//
//  Created by xw.long on 16/12/22.
//  Copyright © 2016年 fmylove. All rights reserved.
//

import UIKit


class FMYHTTPSessionManager: FMYURLSessionManager {
    var baseUrl:URL? = nil


    init(url:URL?, configuration:URLSessionConfiguration?) {
        super.init(configuration: configuration)

        if ((url?.path.lengthOfBytes(using: .utf8)) != nil ) {
            self.baseUrl = url

        }else{
            assert(url != nil, "url can't be empty!")
        }
    }


    func net(method:String?,parameters:Any?,
             success:((_ task:URLSessionDataTask?, _ responseObject:Any) ->Void)?,
             failure:((_ task:URLSessionDataTask?, _ error:Error) ->Void)?) -> URLSessionDataTask{
        let request:URLRequest = self.request(method: method, urlString: self.baseUrl?.absoluteString, parameters: parameters, error: nil)


        let dataTask = self.dataTask(request: request, completionHander: { (response, object, error) in
            print("response\(response), object\(object), error\(error)")
            if error == nil {
                if success != nil{
                    success!(nil,object)
                }
            }else{
                if failure != nil{
                    failure!(nil, error!)
                }
            }
        })
        dataTask.resume()
        return dataTask
    }

    func request(method:String?,urlString:String?,parameters:Any?,error:Error?) ->URLRequest {
        let url = URL(string: urlString!)
        assert(url != nil, "Invalid parameter not satisfying:"+urlString!)
        var request = URLRequest(url: url!)
        request.httpMethod = method
        // TODO: 处理参数
        return request
    }



}
