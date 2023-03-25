//
//  DetailViewController.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var userInfo: Player!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()

        
        // Do any additional setup after loading the view.
    }
    
    

//    init(userInfo: Player) {
//        self.userInfo = userInfo
//        super.init(nibName: nil, bundle: nil)
//    }

//    // Закрытие PopupView
//    @objc func closePopup() {
//        removeFromSuperview()
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    

    func config() {
        usernameLabel.text = userInfo.player.username
    }


}
