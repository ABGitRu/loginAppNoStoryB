//
//  LoginViewController.swift
//  loginAppNoStoryB
//
//  Created by Mac on 10.08.2021.
//

import UIKit

protocol LoginViewProtocol {
    func showDetail(vc: UIViewController)
    func presentAC(ac: UIViewController)
}

class LoginViewController: UIViewController {
// MARK: - USER INTERFACE
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
        textfield.isSecureTextEntry = true
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
    
// MARK: - loginViewModel
    lazy var loginViewModel = LoginViewModel()
    
// MARK: - OVERRIDE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loginViewModel.delegate = self
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
// MARK: PRIVATE ACTION METHODS
    @objc private func loginTapped() {
        loginViewModel.loginUserTapped(loginTF: loginTF, passwordTF: passwordTF)
    }
    
    @objc private func regButtonTapped() {
        loginViewModel.regUserTapped()
    }
    
// MARK: PRIVATE UI METHODS
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.3141447008, green: 0.681245327, blue: 0.1670588255, alpha: 1)
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        setupConstraints()
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

// MARK: EXTENSION LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    func showDetail(vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
    func presentAC(ac: UIViewController) {
        present(ac, animated: true, completion: nil)
    }
    
}
