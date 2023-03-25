//
//  ViewController.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    // MARK: - Helper Methods
  func showNetworkError() {
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
      APIService.shared.fetchUser(username: query) { (result) in
          switch result {
          case .success(let player):
              let vc = DetailViewController.instantiate()
              vc.userInfo = player
              self.present(vc, animated: true)
          case .failure(_):
              self.showNetworkError()
          }
      }
      searchBar.resignFirstResponder()
  }
}
