//
//  NibLoadableViewProtocol.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit

protocol NibLoadableViewProtocol {
    
    static var nibName: String {get}
}
extension NibLoadableViewProtocol where Self: UIView {
    
    static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
