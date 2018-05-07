//
//  UITableViewGenericProtocol.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit
//*************************** UITable View Extension ***************
//  extension UITableViewCell: ReusableViewProtocol {} is already
//  written in ReusableViewProtocol so need not to apply where condition
extension UITableView {
    
    func registerCellClass<T: UITableViewCell>(cell: T.Type) {
        
        register(T.self, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func registerCellNib<T:UITableViewCell>(cell: T.Type) where T: NibLoadableViewProtocol {
        
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell =  dequeueReusableCell(withIdentifier: T.reusableIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reusableIdentifier). May be cell Type is not specifird like let cell: CellClass")
        }
        return cell
    }
}
