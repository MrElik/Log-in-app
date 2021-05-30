//
//  ViewController.swift
//  Log in app
//
//  Created by macbook on 27.05.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    private let user = "Elik"
    private let password = "Batman"
    
    
    func textFiledShouldReturn(textFiled: UITextField) -> Bool {
        userNameTextFiled.delegate = self
        passwordTextFiled.delegate = self
        if textFiled == userNameTextFiled {
            passwordTextFiled.becomeFirstResponder()
        }else{
            passwordTextFiled.resignFirstResponder()
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func forgotUserNameButton(_ sender: UIButton) {
        
        let userNameAlert = UIAlertController(title: "Внимание!", message: "Твой ник - \(user)", preferredStyle: .alert)
        let userNameAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        userNameAlert.addAction(userNameAlertAction)
        present(userNameAlert, animated: true, completion: nil)
    }

    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        
        let passwordAlert = UIAlertController(title: "Внимание!", message: "Твой пароль - \(password)", preferredStyle: .alert)
        let passwordAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        passwordAlert.addAction(passwordAlertAction)
        present(passwordAlert, animated: true, completion: nil)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dwc = segue.destination as? WelcomeViewController else  { return }
        dwc.welcomeMessage = userNameTextFiled.text
        }
    
    @IBAction func unwindSequeToLoginViewController(seque: UIStoryboardSegue) {
        userNameTextFiled.text = nil
        passwordTextFiled.text = nil
    }
    
    @IBAction func logInTapped(_ sender: UIButton) {
        
        let falsePasswordAlert = UIAlertController(title: "Аха, попался!", message: "Допущенна ошибка логина/пароля", preferredStyle: .alert)
        let falsePasswordAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        falsePasswordAlert.addAction(falsePasswordAlertAction)
        
        if userNameTextFiled.text == "\(user)", passwordTextFiled.text == "\(password)"  {
        performSegue(withIdentifier: "logSeque", sender: nil)
        } else {
            present(falsePasswordAlert, animated: true, completion: nil)
            passwordTextFiled.text = nil
            userNameTextFiled.text = nil
            }
}
}
