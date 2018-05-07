//
//  BackendError.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import Foundation

class BackendError: NSError {

    private static let errorDomain = "com.backend-error"
    private(set) var type: ErrorType = .unknown

    enum ErrorType: String {
        case unknown
        case inner
        case responseFormat
        case unAuthorizedAccess
        
        var code: Int {
            switch self {
            case .unknown:
                return 520
            case .inner:
                return 500
            case .responseFormat:
                return 400
            case .unAuthorizedAccess:
                return 401
            }
        }
    }

    convenience init(type: BackendError.ErrorType, message: String? = nil) {
        self.init(domain: BackendError.errorDomain, code: type.code, userInfo: ["message": message ?? ""])
        self.type = type
    }
}
