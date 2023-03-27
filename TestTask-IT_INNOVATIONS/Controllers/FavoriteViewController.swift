//
//  FavoriteViewController.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import UIKit
import Lottie
class FavoriteViewController: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var notAddedAnimation: LottieAnimationView!

    private var players: [Favorite] = [Favorite]()

    @IBOutlet weak var stackNoFavorite: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite"
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNoFavorites()
        self.players = UserDefaultsManager.shared.fetchFavoritePlayers()
        tableView.reloadData()
    }
    
    private func setupUI() {
        tableView.register(UINib(nibName: SearchResultCell.identifier, bundle: nil), forCellReuseIdentifier: SearchResultCell.identifier)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        
        notAddedAnimation.contentMode = .scaleAspectFill
        notAddedAnimation.loopMode = .loop
        notAddedAnimation.play()
    }

    private func showCommentAlert(for favorite: Favorite) {
        let alert = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = favorite.comment
            textField.placeholder = "Comment"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self, weak alert] _ in
            guard let self = self, let alert = alert else { return }
            let comment = alert.textFields?.first?.text
            UserDefaultsManager.shared.updateComment(player: favorite.player, comment: comment ?? "")
            self.players = UserDefaultsManager.shared.fetchFavoritePlayers()
            self.tableView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private func showNoFavorites() {
        stackNoFavorite.isHidden = UserDefaultsManager().favorites?.count ?? 0 > 0
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.identifier, for: indexPath) as? SearchResultCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(player: players[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController.instantiate()
        vc.modalPresentationStyle = .overFullScreen
        vc.player = players[indexPath.row].player
        self.present(vc, animated: true)
    }
}

extension FavoriteViewController: FavoriteTableViewCellDelegate {
    func editButtonTapped(cell: SearchResultCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let favorite = players[indexPath.row]
        showCommentAlert(for: favorite)
    }
}
