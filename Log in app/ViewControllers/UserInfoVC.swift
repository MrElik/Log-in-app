//
//  UserInfoVC.swift
//  Log in app
//
//  Created by macbook on 08.06.2021.
//

import UIKit

class UserInfoVC: UIViewController {
    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var showPhoto: UIButton!
    
    
    var user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPhoto.setTitle("Та самая кнопка", for: .normal)
        self.userInfoLabel.text = "Так и так, неужели я смог это сделать? Ну хорошо, раз я здесь, то стоит немного рассказать о себе. Меня зовут Эльнур, я родился и вырос в городе Москве. Совсем недавно я решил, что хочу заниматься программированием и изучить язык SWIFT. Давай ты попробуешь нажать кнопку снизу и мы вместе посмотрим получилось ли у меня присоединить ее к еще одному экрану."
        title = user.person.fullName
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageVC else {return}
        imageVC.user = user

    }

}
