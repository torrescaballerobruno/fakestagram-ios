//
//  RequestBuilder.swift
//  Fakestagram-Xcode10
//
//  Created by Bruno Torres D4 on 10/5/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

struct RequestBuilder{
    
    enum ContentMode{
        case jsonApp
        func accept() -> String {
            switch self{
            case .jsonApp:
                return "application/json"
            }
        }
            
            func contentType() -> String {
                switch self{
                case .jsonApp:
                    return "application/json"
                }
        }
    }
    
    //var baseUrl: String
    var path: String = ""
    var method: String = "get"
    var scheme: String = "https"
    var urlC: URLComponents
    var body: Data?
    var headers: [String: String]?
    var contentMode: ContentMode = .jsonApp

    init(baseUrl: String){
        self.urlC = URLComponents(string: baseUrl)!
    }
    
    func url() -> URL? {
        var u = urlC
        u.path = self.path
        u.scheme = self.scheme

        return u.url
    }
    
    func request() -> URLRequest?{
        guard let url = url() else {return nil}
        
        var req = URLRequest(url: url)
        req.httpMethod = method
        req.httpBody = body
        req.addValue(contentMode.accept(), forHTTPHeaderField: "Accept")
        req.addValue(contentMode.contentType(), forHTTPHeaderField: "Content-Type")
        
        if let headers = self.headers{
            for(key,value) in headers{
                req.addValue(value, forHTTPHeaderField: key)
            }
        }
        return req
    }
}
