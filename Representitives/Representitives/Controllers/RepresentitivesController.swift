//
//  RepresentitivesController.swift
//  Representitives
//
//  Created by William Moody on 5/16/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit


class RepresentitiveController{
    
    
    static let baseURL = URL(string: "https://whoismyrepresentative.com")
 
    static func fetchRep(state: String, completion: @escaping ([SearchResults]) -> Void) {
        
        guard var url = baseURL else {completion([]); return}
        
        url.appendPathComponent("getall_reps_bystate.php")
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let stateQuerry = URLQueryItem(name: "state", value: state.lowercased())
        let asJSON = URLQueryItem(name: "output", value: "json")
        
        components?.queryItems = [stateQuerry, asJSON]
        
        guard let finalURL = components?.url else { return }
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error{
                print("error on datatask🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹\(error.localizedDescription)")
                completion([ ])
                return
            }
            guard let data = data,
                //encoding the data as ascii for some infomation that is partially ascii
                let responseDataString = String(data: data, encoding: .ascii),
                let fixedData = responseDataString.data(using: .utf8)
                else { completion([]); return }
            
            let decoder = JSONDecoder()
            do{
                let topLevelJson = try decoder.decode( Representitive.self, from: fixedData)
                let searchResults = topLevelJson.results
                 completion(searchResults)
                
            }catch{
                print("Error decoding🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹🕹")
                completion([ ])
                return
            }
        }.resume()
    }
}
