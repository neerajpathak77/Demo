//
//  StoryboardSupportProtocol.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit

protocol StoryboardSupportProtocol {
    static var storyboardIdentifier: String { get }
}

extension StoryboardSupportProtocol where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardSupportProtocol{}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController> () -> T {
        
        guard let controller = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn’t instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
        return controller
    }
}
