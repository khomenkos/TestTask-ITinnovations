//
//  DetailViewController.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var player: Player!
    private var isFavorite = false

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        config()
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openWebView(_ sender: Any) {
        
    }
    
    @IBAction func addToFavoriteBtn(_ sender: Any) {
        isFavorite.toggle()
        updateStarButton()
        if isFavorite {
            showCommentAlert()
        } else {
            UserDefaultsManager.shared.removePlayerFromFavorites(player)
        }
    }
    
    private func updateStarButton() {
        let image = isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        starButton.setImage(image, for: .normal)
    }
    
    private func showCommentAlert() {
        let alert = UIAlertController(title: "Add Comment", message: "Add a comment for \(player.player.username ?? "user")", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Comment"
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            if let comment = alert.textFields?.first?.text {
                UserDefaultsManager.shared.addPlayerToFavorites(player: self.player, comment: comment)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    private func setupUI() {
        isFavorite = UserDefaultsManager.shared.isFavoritePlayer(player)
        updateStarButton()
        popupView.layer.cornerRadius = 10
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeBtn))
        gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self
        view.addGestureRecognizer(gestureRecognizer)
        
        // Gradient view
        view.backgroundColor = UIColor.clear
        let dimmingView = GradientView(frame: CGRect.zero)
        dimmingView.frame = view.bounds
        view.insertSubview(dimmingView, at: 0)
    }
    
    private func config() {
        userImage.sd_setImage(with: player.player.avatar?.asUrl)
        nameLabel.text = player.player.username
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        transitioningDelegate = self
    }
    
}

extension DetailViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return (touch.view === self.view)
    }
}

extension DetailViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BounceAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutAnimationController()
    }
}
