//
//  SignInViewController.swift
//  bbios
//
//  Created by Michael Wlodawsky on 4/2/20.
//  Copyright © 2020 Bento Box. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    var email: BBTextField!
    var password: BBTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
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
        Auth.auth().signIn(withEmail: email.text ?? "", password: password.text ?? "") { (result, error) in
            if error != nil {
                Alerts.singleChoiceAlert(title: "Error", message: "There was an error signing into Firebase", vc: self)
            } else {
                print("Signin to Firebase was succesful :)")
                // Transition to home page
                self.navigationController?.pushViewController(HomeViewController(), animated: true)
            }
        }
    }

}
