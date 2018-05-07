//
//  JokesListPresenterProtocol.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import Foundation
protocol JokesListPresenterProtocol {
    init(view: JokesListProtocol)
    func getJokeList(firstName: String, lastName: String) throws
}
