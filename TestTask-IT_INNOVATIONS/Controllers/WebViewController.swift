//
//  WebViewController.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 26.03.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var url: URL!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: url))
    }

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
