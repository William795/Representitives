//
//  Representitive.swift
//  Representitives
//
//  Created by William Moody on 5/16/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation


struct Representitive: Codable{
    let results: [SearchResults]
}

struct SearchResults: Codable{
    
    let name: String
    let party: String
    let state: String
    let phone: String
    let link: String
    let district: String
    
}
