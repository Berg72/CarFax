//
//  API.swift
//  CarFax
//
//  Created by Mark bergeson on 7/14/21.
//

import Foundation

class API {
    
    static let shared = API()
    
    func getCarData(onComplete: @escaping (_ items: AllCars?) -> ()) {
        
        guard let url = URL(string: "https://carfax-for-consumers.firebaseio.com/assignment.json") else { return }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let json = try decoder.decode(AllCars.self, from: data)
                DispatchQueue.main.async {
                    onComplete(json)
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getImage(url: URL?, onComplete: @escaping (_ data: Data?) -> ()) {
        
        guard let url = url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                onComplete(data)
            }
        }
        
        task.resume()
    }
}
