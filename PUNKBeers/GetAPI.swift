//
//  GetAPI.swift
//  PUNKBeers
//
//  Created by Anderson Macedo on 17/07/17.
//  Copyright © 2017 Anderson Macedo. All rights reserved.
//

import Foundation

class GetApi {
    static let URL = "https://api.punkapi.com/v2/beers"
    
    static let configuration : URLSessionConfiguration = {
        let config =  URLSessionConfiguration.default
    
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
    
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
}
