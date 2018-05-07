//
//  Constants.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

struct Srevers {
    static let TEST_SERVER = "http://api.icndb.com/"
}

struct Configurations {
    static let JOKE_COUNT = "10"
}

struct WebService {
    static let SERVER_URL = Srevers.TEST_SERVER //Change Server Here
    static let SERVICE_PREFIX =  SERVER_URL // if some additional confuguration needed in future
}


struct APIEndPoints {
    static let CHUCK_NORRIS_URL = "/jokes/random/" + Configurations.JOKE_COUNT
}

struct ServiceResponse {
    static let OK = "OK"
    static let ERROR = "ERROR"
}

struct ServiceResponseMessage {
    static let NETWORK_FAILURE = "NETWORK_ERROR"
    static let SERVER_ERROR    = "SERVER_ERROR"
    static let FAILURE         = "FAILURE"
    static let INVALID_DATA    = "INVALID_DATA"
    static let SUCCESS         = "SUCCESS"
}
