//
//  ViewController.swift
//  Log in app
//
//  Created by macbook on 27.05.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Задаем аутлеты
    @IBOutlet weak var userNameTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    // MARK: присваиеваем данные из модели
    private let user = User.getUserData()
    
    
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
   
    // MARK: Алерт на Login
    @IBAction func forgotUserNameButton(_ sender: UIButton) {
        
        let userNameAlert = UIAlertController(title: "Внимание!", message: "Твой ник - \(user.login)", preferredStyle: .alert)
        let userNameAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        userNameAlert.addAction(userNameAlertAction)
        present(userNameAlert, animated: true, completion: nil)
    }

    // MARK: Алерт на Login
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        
        let passwordAlert = UIAlertController(title: "Внимание!", message: "Твой пароль - \(user.password)", preferredStyle: .alert)
        let passwordAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        passwordAlert.addAction(passwordAlertAction)
        present(passwordAlert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tapBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tapBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeVC {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoVC
                userInfoVC.user = user
            }
        }
        
    
}
    @IBAction func loginTapped(_ sender: UIButton) {
        
        let falsePasswordAlert = UIAlertController(title: "Аха, попался!", message: "Допущенна ошибка логина/пароля", preferredStyle: .alert)
        let falsePasswordAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        falsePasswordAlert.addAction(falsePasswordAlertAction)
        
        if userNameTextFiled.text == "\(user.login)", passwordTextFiled.text == "\(user.password)"  {
        performSegue(withIdentifier: "tapBarSegue", sender: nil)
        } else {
            present(falsePasswordAlert, animated: true, completion: nil)
            passwordTextFiled.text = nil
            userNameTextFiled.text = nil
            }
    }
   
    @IBAction func unwindSequeToLoginViewController(seque: UIStoryboardSegue) {
    userNameTextFiled.text = nil
    passwordTextFiled.text = nil
   }
}
