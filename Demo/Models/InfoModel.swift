//
//  InfoModel.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import Foundation

struct InfoModel {
    var id: Int
    var joke: String

    init(id: Int, joke: String) {
        self.id = id
        self.joke = joke
    }
    
    init?(data: [String: Any]) {
        
        guard let id = data["id"] as? Int else {
            return nil
        }
        guard let joke = data["joke"] as? String else {
            return nil
        }
        //mandatory
        self.id = id
        self.joke = joke
    }
}

