//
//  GFAlertVC.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/31/23.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: Alert.titleFontSize)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let dismissButton = GFButton(backgroundColor: .systemPink, title: "Ok")

    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // giving the background an alpha of ~ 0.75 gives it a semi-transparent look
        // when the alert shows up on screen
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75) // should extract this to an asset color to avoid hardcoding
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    
    // ----------------------------------
    // MARK: - CONFIGURATIONS
    // ----------------------------------
    func configureContainerView() {
        view.addSubview(containerView) // here we add the container view to the main view
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = Alert.containerCornerRadius
        containerView.layer.borderWidth = Alert.containerBorderWidth // not noticeable in light mode, but gives dark mode a nice touch
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // set the constraints (pinning to the `view`)
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: Alert.containerWidthPadding),
            containerView.heightAnchor.constraint(equalToConstant: Alert.containerHeigthPadding)
        ])
    }
    
    func configureTitleLabel() {
        // here we add the titleLabel we want to customize to the containerView,
        // *NOT* the main `view` that holds the containerView
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong 🤒"
        
        // set the constraints (pinning it to the `containerView`)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, 
                                          constant: Alert.topPadding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, 
                                          constant: Alert.leftPadding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                          constant: Alert.rightPadding),
            titleLabel.heightAnchor.constraint(equalToConstant: Alert.titleHeightPadding)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(dismissButton)
        dismissButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                               constant: Alert.bottomPadding),
            dismissButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                               constant: Alert.leftPadding),
            dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                               constant: Alert.rightPadding),
            dismissButton.heightAnchor.constraint(equalToConstant: Alert.buttonHeightPadding)
        ])
    }
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = Alert.messageNumOfLines
        
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: dismissButton.topAnchor,
                                               constant: Alert.messageBottomPadding),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: Alert.messageTopPadding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                               constant: Alert.rightPadding),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                               constant: Alert.leftPadding)
        ])
    }

    
    // ---------------------------------
    // MARK: - HELPER METHODS / ENUMS
    // ---------------------------------
    private enum Alert {
        // padding constants
        static let topPadding: CGFloat = 20
        static let leftPadding: CGFloat = 20
        static let rightPadding: CGFloat = -20
        static let bottomPadding: CGFloat = -20
        static let containerWidthPadding: CGFloat = 280
        static let containerHeigthPadding: CGFloat = 220
        static let titleHeightPadding: CGFloat = 28
        static let buttonHeightPadding: CGFloat = 44
        static let messageTopPadding: CGFloat = 8
        static let messageBottomPadding: CGFloat = -12
        
        // container constants
        static let containerCornerRadius: CGFloat = 16
        static let containerBorderWidth: CGFloat = 2
        
        static let titleFontSize: CGFloat = 20
        static let messageNumOfLines = 4
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
