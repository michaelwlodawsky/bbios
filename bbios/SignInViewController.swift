//
//  SignInViewController.swift
//  bbios
//
//  Created by Michael Wlodawsky on 4/2/20.
//  Copyright © 2020 Bento Box. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var email: BBTextField!
    var password: BBTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        // Insert Greeting Label
        let label = BBLabel()
        label.center = CGPoint(x: self.view.center.x, y: self.view.frame.height * 0.35)
        label.setText(text: "Welcome to Bento Box, please Sign-in!")
        self.view.addSubview(label)
        
        // Initialize Text Fields
        email = BBTextField()
        email.center = CGPoint(x: self.view.center.x, y: self.view.frame.height * 0.5)
        email.placeholder = "Email"
        password = BBTextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        
        // Signup Button
        let signinButton = BBButton()
        signinButton.setTitle("Signin", for: .normal)
        signinButton.addTarget(self, action: #selector(onSignin), for: .touchUpInside)
        
        Util.setupLinearUI(startView: email, subsequentViews: [password, signinButton], stepSize: 25.0, vc: self)
    }
    
    @objc func onSignin(sender: UIButton) {
        print("We're ready to signin to Firebase :)")
        // TODO: Setup user signin for Firebase
        // Transition to home page
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true, completion: nil)
    }

}
