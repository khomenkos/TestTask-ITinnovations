//
//  PopUpView.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 25.03.2023.
//

import UIKit

class PopUpView: UIView {

    let userInfo: Player
    
    init(frame: CGRect, userInfo: Player) {
        self.userInfo = userInfo
        super.init(frame: frame)
        
        // Настройка внешнего вида PopupView
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: frame.width - 40, height: 50))
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = userInfo.player.username
        label.numberOfLines = 0
        addSubview(label)
        
        let closeButton = UIButton(frame: CGRect(x: 20, y: 200, width: frame.width - 40, height: 50))
        closeButton.setTitle("Закрыть", for: .normal)
        closeButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
        addSubview(closeButton)
    }
    
    // Закрытие PopupView
    @objc func closePopup() {
        removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
