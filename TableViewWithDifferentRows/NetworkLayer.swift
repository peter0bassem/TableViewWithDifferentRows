//
//  NetworkLayer.swift
//  TableViewWithDifferentRows
//
//  Created by Peter Bassem on 6/3/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import Alamofire

class NetworkLayer {
    
    class func getData(URL: String, completionHandler completion: @escaping (Response?, Error?) -> Void) {
        Alamofire.request(URL, method: HTTPMethod.get).responseData { (data) in
            if let error = data.error {
                completion(nil, error)
            }
            guard let data = data.data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(Response.self, from: data)
                completion(response, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
}
