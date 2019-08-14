//
//  RepresentativeController.swift
//  Representative
//
//  Created by AlphaDVLPR on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static func searchRepresentatives(forState state : String , completion : @escaping ([Representative]) -> Void) {
        
        //URL
        guard let baseURL = URL(string : "https://whoismyrepresentative.com/getall_reps_bystate.php?") else {completion([]); return}

        //query items
        let stateQuery = URLQueryItem(name: "state", value: state.lowercased())
        let outputQuery = URLQueryItem(name: "output", value: "json")
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [stateQuery , outputQuery]
        
        //create a request from the URL
        guard let urlRequest = urlComponents?.url else { completion([]) ; return }
        
        //This is the data task
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            
            //so unwrap error
            if let error = error {
                
                completion([]) ; print("\(error) : \(error.localizedDescription)") ; return
                
            }
            
            guard let data = data else { completion([]) ; return }

            guard let formattedData = String(data : data, encoding: .ascii) ,
            let reFormattedData = formattedData.data(using : .utf8) else { completion([]); return }
            
            let decoder = JSONDecoder()
            
            do {
                
                let results = try decoder.decode([String : [Representative]].self, from: reFormattedData)
                
                guard let representativesArray = results["results"] else { completion([]) ; return }

                    completion(representativesArray)
                    
                
            } catch {
                
                completion([]) ; print("\(error) : \(error.localizedDescription)") ; return

            }
        }
        dataTask.resume()
    }
}
