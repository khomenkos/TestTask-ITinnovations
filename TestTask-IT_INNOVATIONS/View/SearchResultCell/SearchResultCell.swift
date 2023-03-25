//
//  SearchResultCell.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import UIKit

class SearchResultCell: UITableViewCell {

    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for result: Player) {
        userNameLabel.text = result.player.username


        avatarImage.image = UIImage(systemName: "square")
//      if let smallURL = URL(string: result.imageSmall) {
//        downloadTask = artworkImageView.loadImage(url: smallURL)
//      }
    }
}
