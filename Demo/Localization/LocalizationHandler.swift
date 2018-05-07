//
//  LocalizationHandler.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import Foundation

extension String {
    func localized(with comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
}
