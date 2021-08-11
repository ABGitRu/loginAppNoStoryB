//
//  LoginViewController.swift
//  loginAppNoStoryB
//
//  Created by Mac on 10.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Enter your login"
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = #colorLiteral(red: 0.5413205028, green: 0.7682641745, blue: 0.2105300128, alpha: 1)
        return textfield
    }()
    let passwordTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Enter your password"
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = #colorLiteral(red: 0.5413205028, green: 0.7682641745, blue: 0.2105300128, alpha: 1)
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.250649929, green: 0.6356732845, blue: 0.7843883038, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setAttributedTitle(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 25) as Any]), for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.layer.cornerRadius = 10
         button.backgroundColor = #colorLiteral(red: 0.250649929, green: 0.6356732845, blue: 0.7843883038, alpha: 1)
         button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
         button.setAttributedTitle(NSAttributedString(string: "Register", attributes: [NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 25) as Any]), for: .normal)
        button.addTarget(self, action: #selector(regButtonTapped), for: .touchUpInside)
         return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3141447008, green: 0.681245327, blue: 0.1670588255, alpha: 1)
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        setupConstraints()
    }
    
    @objc private func loginTapped() {
        let helloVC = HelloViewController()
        
        helloVC.modalPresentationStyle = .fullScreen
        showDetailViewController(helloVC, sender: nil)
    }
    
    @objc private func regButtonTapped() {
        let ac = UIAlertController(title: "Register new user", message: "Enter login & password", preferredStyle: .alert)
        ac.addTextField { loginTF in
            loginTF.placeholder = "Enter login"
        }
        ac.addTextField { passTF in
            passTF.placeholder = "Enter password"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        ac.addAction(saveAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
    
    private func setupConstraints() {
        let constraints = [
            loginTF.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            loginTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            loginTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            loginTF.heightAnchor.constraint(equalToConstant: 30),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 15),
            passwordTF.leadingAnchor.constraint(equalTo: loginTF.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: loginTF.trailingAnchor),
            passwordTF.heightAnchor.constraint(equalTo: loginTF.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

