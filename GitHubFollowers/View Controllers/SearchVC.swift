//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 9/6/23.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, 
                                       action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    
    // ---------------------------------
    // MARK: - CONFIGURATIONS
    // ---------------------------------
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        let logoPadding: CGFloat = 200
        let logoTopPadding: CGFloat = 80
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: logoTopPadding),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: logoPadding),
            logoImageView.widthAnchor.constraint(equalToConstant: logoPadding)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        let textFieldPadding: CGFloat = 50
        let textFieldTopPadding: CGFloat = 48
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: textFieldTopPadding),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textFieldPadding),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -textFieldPadding),
            usernameTextField.heightAnchor.constraint(equalToConstant: textFieldPadding)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        let buttonPadding: CGFloat = 50
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -buttonPadding),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonPadding),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -buttonPadding),
            callToActionButton.heightAnchor.constraint(equalToConstant: buttonPadding)
        ])
    }
    
    
    // ---------------------------------
    // MARK: - HELPER METHODS
    // ---------------------------------
    @objc func pushFollowerListVC() {
        
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(alertTitle: "Empty Username",
                                     message: "Please enter a username 👀",
                                     buttonTitle: "Ok")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }

}


// ---------------------------------
// MARK: - EXTENSIONS
// ---------------------------------
extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
