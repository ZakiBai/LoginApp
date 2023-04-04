//
//  ViewController.swift
//  LoginApp
//
//  Created by Zaki on 02.04.2023.
//

import UIKit

final class mainViewController: UIViewController {
    
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var userNameField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
    }
    
    let username = "Zaki"
    let password = "iphone"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loggedAccountVC = segue.destination as? WelcomeViewController else { return }
        loggedAccountVC.name = username
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        guard userNameField.text == username, passwordField.text == password else {
            showAlert(
                title: "Wrong login or password",
                message: "please check your data again",
                textField: passwordField
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func hintButtonsTapped(sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops", message: "Your username is \(username) \u{1F609}")
        : showAlert(title: "Oops!", message: "Your password is \(password) \u{1F609}")
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}

