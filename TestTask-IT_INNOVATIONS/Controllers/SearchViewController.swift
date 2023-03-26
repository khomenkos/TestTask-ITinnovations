//
//  ViewController.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import UIKit
import ProgressHUD
import Lottie

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var stackSearch: UIStackView!
    @IBOutlet var animationView: LottieAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        stackSearch.layer.cornerRadius = 15
        stackSearch.layer.shadowColor = UIColor.black.cgColor
        stackSearch.layer.shadowOpacity = 100
        stackSearch.layer.shadowOffset = CGSize.zero
        stackSearch.layer.shadowRadius = 5
    }
    
    // MARK: - Helper Methods
    private func showNetworkError() {
        let alert = UIAlertController(
            title: "Whoops...",
            message: "There was an error accessing the playerDB. Please try again.",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Search Bar Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        ProgressHUD.show()
        APIService.shared.fetchUser(username: query) { (result) in
            switch result {
            case .success(let player):
                ProgressHUD.dismiss()
                let vc = DetailViewController.instantiate()
                vc.modalPresentationStyle = .overFullScreen
                vc.player = player
                self.present(vc, animated: true)
            case .failure(_):
                ProgressHUD.dismiss()
                self.showNetworkError()
            }
        }
        searchBar.resignFirstResponder()
    }
}
