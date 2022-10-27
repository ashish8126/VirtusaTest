//
//  NetworkLayer + People.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 27/10/22.
//

import Foundation

extension NetworkLayer {
    
    static func getPeopleList(completionHandler: @escaping peopleResult) {
        
        let peopleURL = URL(string: (NetworkLayer.baseURL + NetworkLayer.Endpoints.people.rawValue))
        
        if let url = peopleURL {
            
            var request = URLRequest(url: url)
            request.httpMethod = NetworkLayer.HTTPMethod.get.rawValue
            let task = URLSession.shared.dataTask(with: request, completionHandler: {
                (data, response, error) in

                if let error = error
                {
                    print("error: \(error)")
                    completionHandler(.failure(error))

                }else if response != nil {
                    print("response: \(String(describing: response))")
                }
                
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
                do {
                    let peopleData = try JSONDecoder().decode([PeopleData].self, from: responseData)
                    completionHandler(.success(peopleData))
                } catch let err {
                    completionHandler(.failure(err))
                }
            })
            task.resume()
        }
        
    }
    
    
}
