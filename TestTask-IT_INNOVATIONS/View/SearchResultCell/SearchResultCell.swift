//
//  SearchResultCell.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import UIKit

protocol FavoriteTableViewCellDelegate: AnyObject {
    func editButtonTapped(cell: SearchResultCell)
}

class SearchResultCell: UITableViewCell {
    
    static let identifier = "SearchResultCell"
    
    weak var delegate: FavoriteTableViewCellDelegate?
    
    @IBOutlet weak var stackComment: UIStackView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func configure(player: Favorite) {
        
        userNameLabel.text = player.player.player.username
        avatarImage.sd_setImage(with: player.player.player.avatar?.asUrl)
        commentLabel.text = player.comment

//        guard let comment = player.comment else { return }
//        if comment.isEmpty {
//            stackComment.isHidden = true
//        }
    }
    
    @IBAction func edit(_ sender: Any) {
        delegate?.editButtonTapped(cell: self)
    }
}
