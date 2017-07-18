//
//  RequestAPI.swift
//  PUNKBeers
//
//  Created by Anderson Macedo on 17/07/17.
//  Copyright © 2017 Anderson Macedo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class RequestApi {
    
    // MARK: - Properties
    let getAPI = GetApi()
    var cities : [Beer] = []
    
    // MARK: - Methods
    func requestBeers(completionHandler : @escaping ([Beer]) -> Void){
        Alamofire.request(getAPI.URL).responseArray { (response: DataResponse<[Beer]>) in
            let beerApiResponse = response.result.value
            
            guard let apiResponse = beerApiResponse else{
                return
            }
            
            completionHandler(apiResponse)
        }
    }
    
    func requestPhoto(url: String, completionHandler : @escaping (UIImage) -> Void){
        Alamofire.request(url).responseData { response in
            guard let data = response.result.value else { return }
            completionHandler(UIImage(data: data)!)
        }
    }
    
}
