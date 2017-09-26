//
//  NetworkManager.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/25/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import Foundation

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    let urlString = URL(string: Constants.API.BaseURL)
    
    func getCars(completionHandler:@escaping (NSArray?, NSError?) -> ()){
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completionHandler(nil, error as NSError?)
                } else {
                    completionHandler(try? JSONSerialization.jsonObject(with: data!, options: []) as! NSArray, nil)
                }
            }
            task.resume()
        }
    }
}
