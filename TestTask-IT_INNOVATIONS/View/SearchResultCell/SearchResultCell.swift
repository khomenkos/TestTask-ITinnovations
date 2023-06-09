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
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var stackComment: UIStackView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        avatarImage.layer.cornerRadius = 15
        viewCell.layer.cornerRadius = 15
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 100
        contentView.layer.shadowOffset = CGSize.zero
        contentView.layer.shadowRadius = 5
    }
    
    func configure(player: Favorite) {
        userNameLabel.text = player.player.player.username
        avatarImage.sd_setImage(with: player.player.player.avatar?.asUrl)

        if player.comment == "" {
            stackComment.isHidden = true
        } else {
            commentLabel.text = player.comment
            stackComment.isHidden = false
        }
    }
    
    @IBAction func edit(_ sender: Any) {
        delegate?.editButtonTapped(cell: self)
    }
}
