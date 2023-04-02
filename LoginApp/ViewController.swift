//
//  ViewController.swift
//  LoginApp
//
//  Created by Zaki on 02.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var userNameField: UITextField!
    
    @IBOutlet var logInButton: UIButton!

    @IBOutlet var userNameHintButton: UIButton!
    @IBOutlet var passwordHintButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        logInButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loggedAccountVC = segue.destination as? LoggedAccountMainPageViewController else { return }
        loggedAccountVC.name = userNameField.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        if userNameField.text == "Zaki" && passwordField.text == "iphone" {
        } else {
            showAlertWrongDataAccount(withTitle: "Oops!", andMessage: "Your username or password is wrong. Please check your fields and try again.")
        }
        
    }
    
    @IBAction func userNameHintButtonTapped(_ sender: UIButton) {
        showAlertHint(withTitle: "Oops!", andMessage: "Your username is Zaki \u{1F609}")
    }
    
    
    @IBAction func passwordHintButtonTapped(_ sender: UIButton) {
        showAlertHint(withTitle: "Oops!", andMessage: "Your password is iphone \u{1F609}")
    }
    
    private func showAlertHint(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showAlertWrongDataAccount(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordField.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}

