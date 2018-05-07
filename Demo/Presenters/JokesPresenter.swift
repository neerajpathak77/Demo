//
//  JokesPresenter.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import Foundation
class JokesPresenter: JokesListPresenterProtocol {
    
    unowned let view: JokesListProtocol
    var jokeModel: DataEnvelopeModel
    required init(view: JokesListProtocol) {
        self.view = view
        jokeModel = DataEnvelopeModel(type: "", jokeList: [])
    }
    var dataList: [DataEnvelopeModel] = []
     
    func getJokeList(firstName: String, lastName: String) throws {
        
        if !ReachabilityManager.reachabilityManager.isNetworkAvailable {
            throw GenericErrors.internetAccess
        }
        
        let jokesService = ServiceAdapter()
        let serviceName = APIEndPoints.CHUCK_NORRIS_URL
        let queryString = "firstName=\(firstName)&lastName=\(lastName)"
        jokesService.initiateGetRequest(serviceName, needAuth: true, queryString: queryString) { [unowned self] (response) in
            
            guard let joke = response.data as? [String : Any] else { return }
            guard let jokeModel = DataEnvelopeModel(data: joke) else { return }
            self.jokeModel = jokeModel
            self.view.setJokes()
        }
    }
}
