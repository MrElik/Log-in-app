//
//  WelcomeViewController.swift
//  Log in app
//
//  Created by macbook on 27.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var welcomeMessage: String?
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard  let welcomeMessage = self.welcomeMessage else {return}
        welcomeLabel.text = "Неужели ты справился, \(welcomeMessage)?"
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

