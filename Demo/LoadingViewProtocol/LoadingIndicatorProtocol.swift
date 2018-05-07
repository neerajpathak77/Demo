//
//  LoadingIndicatorProtocol.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit

protocol LoadingIndicatorProtocol: class {

    var loadingActivity: UIActivityIndicatorView? { get set } // Need not to set this varible from the view class unfortunatelly we can not have stored propertied in extensions so I need to decleare it here
    func stopLoading()
    func startLoading(baseView: UIView)
}

extension LoadingIndicatorProtocol where Self: UIViewController {

    func startLoading(baseView: UIView) {
        DispatchQueue.main.async {
            self.loadingActivity = UIActivityIndicatorView(frame: baseView.bounds) // np safe unwrapping
            self.loadingActivity?.center = baseView.center
            self.loadingActivity?.hidesWhenStopped = true
            self.loadingActivity?.activityIndicatorViewStyle = .gray
            self.loadingActivity?.startAnimating();
            baseView.addSubview(self.loadingActivity ?? UIActivityIndicatorView())
        }
     }

    func stopLoading() {
        DispatchQueue.main.async {
            self.loadingActivity?.stopAnimating()
        }
    }
}
