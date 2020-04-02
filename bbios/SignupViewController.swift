//
//  ViewController.swift
//  bbios
//
//  Created by Michael Wlodawsky on 3/31/20.
//  Copyright © 2020 Bento Box. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    var email: BBTextField!
    var verifyEmail: BBTextField!
    var password: BBTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Insert Greeting Label
        let label = BBLabel()
        label.center = CGPoint(x: self.view.center.x, y: self.view.frame.height * 0.35)
        label.setText(text: "Welcome to Bento Box, please Sign-up!")
        self.view.addSubview(label)
        
        // Initialize Text Fields
        email = BBTextField()
        email.center = CGPoint(x: self.view.center.x, y: self.view.frame.height * 0.5)
        email.placeholder = "Email"
        verifyEmail = BBTextField()
        verifyEmail.placeholder = "Verify Email"
        password = BBTextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        
        // Signup Button
        let signupButton = BBButton()
        signupButton.setTitle("Signup", for: .normal)
        signupButton.addTarget(self, action: #selector(onSignup), for: .touchUpInside)
        
        // Signin Button
        let signinButton = BBButton()
        signinButton.addTarget(self, action: #selector(onSignin), for: .touchUpInside)
        signinButton.setTitleS2F(title: "Already a member? Sign in!", state: .normal)
        // Set center after resize to avoid offsetting the center
        self.view.addSubview(signinButton)
        
        Util.setupLinearUI(startView: email, subsequentViews: [verifyEmail, password, signupButton, signinButton], stepSize: 25.0, vc: self)
    }
    
    @objc func onSignup(sender: UIButton) {
        if self.email.text != self.verifyEmail.text {
            Alerts.singleChoiceAlert(title: "Error", message: "Emails do not match.", vc: self)
            return
        }
        Auth.auth().createUser(withEmail: email.text ?? "", password: password.text ?? "") { (result, error) in
            if error != nil {
                Alerts.singleChoiceAlert(title: "Error", message: "There was an error signing up with Firebase.", vc: self)
            } else {
                print("All good in the hood for signup to Firebase :)")
                
                // Write user to profiles
                db.collection("profiles").document(Auth.auth().currentUser?.uid ??
                    "errorCurrentUser").setData([
                        "email": "\(self.email.text!)"
                ])

                // Transition to next page
                let homeViewController = HomeViewController()
                homeViewController.modalPresentationStyle = .fullScreen
                self.present(homeViewController, animated: true, completion: nil)
            }
        }
    }
    
    @objc func onSignin(sender: UIButton) {
        let signinVC = SignInViewController()
        signinVC.modalPresentationStyle = .fullScreen
        self.present(signinVC, animated: true, completion: nil)
    }

}

