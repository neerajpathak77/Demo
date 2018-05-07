//
//  DataEnvelopeModel.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import Foundation

struct DataEnvelopeModel {
    
    var type: String?
    var jokeList: [InfoModel?]
    init(type: String, jokeList: [InfoModel?]) {
        self.type = type
        self.jokeList = jokeList
    }
    
    init?(data: [String: Any]) {

        guard let value = data["value"] as? [[String : Any]] else {
            return nil
        }
        //Mandatory
        self.jokeList = value.map { InfoModel(data: $0) }
       //optional
        self.type = data["type"] as? String

    }
}

