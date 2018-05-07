//
//  ReusableViewProtocol.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableViewProtocol: class {
    static var reusableIdentifier: String {get}
}

extension ReusableViewProtocol where Self: UIView {
    
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
}
