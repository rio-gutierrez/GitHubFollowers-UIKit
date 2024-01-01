//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/29/23.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print("Followerss = \(followers)")
            case .failure(let error):
                self.presentGFAlertOnMainThread(alertTitle: "Something went south!", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
