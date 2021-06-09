//
//  ImageVC.swift
//  Log in app
//
//  Created by macbook on 08.06.2021.
//

import UIKit

class ImageVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageVCLabel: UILabel!
    
    
    var user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageVCLabel.text = "Кажется тебе все же итересно как я выгляжу, верно? Фото ниже сделано в момент, когда программа стала работать как надо"
        imageView.image = UIImage(named: user.person.image)
    }
}
