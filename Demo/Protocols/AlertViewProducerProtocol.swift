//
//  AlertViewProducerProtocol.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit

protocol AlertViewProducerProtocol {
    func showAlert(message: String)
}
extension AlertViewProducerProtocol where Self: UIViewController {

    func showAlert( message: String) {
        let alert = UIAlertController(title: "Result".localized(with: "Alert title"), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized(), style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
