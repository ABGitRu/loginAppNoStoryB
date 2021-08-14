//
//  LoginViewModel.swift
//  loginAppNoStoryB
//
//  Created by Mac on 12.08.2021.
//

import UIKit

class LoginViewModel {
    
    var users = [Person(login: "Admin", password: "badPass")]
    var isPassed = false
    
    var delegate: LoginViewProtocol!
    
    func loginUserTapped(loginTF: UITextField,
                         passwordTF: UITextField) {
        
        if let login = loginTF.text,
           let password = passwordTF.text {
            for user in users {
                if login == user.login && password == user.password {
                    isPassed = true
                    break
                } else {
                    isPassed = false
                }
            }
            if isPassed {
                let helloVC = HelloViewController()
                helloVC.loginName = login
                helloVC.modalPresentationStyle = .fullScreen
                delegate.showDetail(vc: helloVC)
            }
        }
        
    }
    
    func regUserTapped() {
        let ac = UIAlertController(title: "Register new user", message: "Enter login & password", preferredStyle: .alert)
        ac.addTextField { loginTF in
            loginTF.placeholder = "Enter login"
        }
        ac.addTextField { passTF in
            passTF.placeholder = "Enter password"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { [self] _ in
            guard let login = ac.textFields?.first?.text,
                  let password = ac.textFields?.last?.text else { return }
            self.users.append(Person(login: login, password: password))
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        ac.addAction(saveAction)
        ac.addAction(cancelAction)
        delegate.presentAC(ac: ac)
    }
    
}

