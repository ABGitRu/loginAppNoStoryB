//
//  HelloViewController.swift
//  loginAppNoStoryB
//
//  Created by Mac on 11.08.2021.
//

import UIKit

class HelloViewController: UIViewController {
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Copperplate", size: 30)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    var loginName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5413205028, green: 0.7682641745, blue: 0.2105300128, alpha: 1)
        view.addSubview(dismissButton)
        view.addSubview(helloLabel)
        helloLabel.text = "Hello \(loginName ?? "inkognito")"
        setConstraints()
        
    }
    
    @objc private func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setConstraints() {
        let constraints = [
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            helloLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 10),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            helloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
