//
//  UserInputViewController.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit

class UserInputViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.resetView()
    }

    //MARK: ButtonActions
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        if !validateTextFields(firstName: firstName, lastName: lastName) { return }
        guard let sb = storyboard else { return }
        let jokesController: JokesViewController =  sb.instantiateViewController()
        jokesController.injectDependancies(presenter: JokesPresenter(view: jokesController))
        navigationController?.pushViewController(jokesController, animated: true)
        jokesController.fetchJokeList(firstName: firstName.text, lastName: lastName.text)
    }
}

//MARK: UITextView delegate
extension UserInputViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

//MARK: Validation helpers
extension UserInputViewController: AlertViewProducerProtocol {
    
    private func validateTextFields(firstName: UITextField, lastName: UITextField) -> Bool {
        if firstName.text?.count == 0 || lastName.text?.count == 0 {
            showAlert(message: "Please enter first and last name!!".localized())
            return false
        }
        return true
    }
}
//MARK: Controller generic decoration code
extension UserInputViewController {
    
    //Dismiss keynoard on touch of the view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Clear textfields on a search
    private func resetView() {
        self.firstName.text = ""
        self.lastName.text  = ""
    }
}



