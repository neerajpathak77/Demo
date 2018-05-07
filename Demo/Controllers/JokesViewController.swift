//
//  JokesViewController.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit
class JokesViewController: UIViewController, LoadingIndicatorProtocol {
    
    @IBOutlet weak var noResultLable: UILabel!
    @IBOutlet weak var jokesTableView: UITableView!
//    private lazy var presenter = JokesPresenter(view: self)
    private var presenter: JokesPresenter!
    var loadingActivity: UIActivityIndicatorView?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        jokesTableView.registerCellNib(cell: JokeItemCell.self)
    }
    //Function to inject dependancies
    func injectDependancies(presenter: JokesPresenter) {
        self.presenter = presenter
    }
}

//MARK: Presenter SetUp
extension  JokesViewController: JokesListProtocol, AlertViewProducerProtocol {

    func fetchJokeList(firstName: String?, lastName: String?) {
        guard let fName = firstName, let lName = lastName else { return }
        startLoading(baseView: view)
        do {
            try presenter.getJokeList(firstName: fName, lastName: lName)
        } catch GenericErrors.internetAccess {
            stopLoading()
            noResultLable.isHidden = presenter.jokeModel.jokeList.count > 0
            showAlert(message: "Please connect to internet!!".localized())
        }  catch {
            print("Error occured")
        }
    }
    
    func setJokes() {
        DispatchQueue.main.async {
            self.noResultLable.isHidden = self.presenter.jokeModel.jokeList.count > 0
            self.jokesTableView.reload() //performing reload on main thread
        }
        stopLoading()
    }
}

//MARK: TableView SetUp
extension JokesViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.jokeModel.jokeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: JokeItemCell = tableView.dequeueCell(for: indexPath)
        cell.setUpCell(model: presenter.jokeModel.jokeList[indexPath.row], indexpath: indexPath)
        return cell
    }
}
