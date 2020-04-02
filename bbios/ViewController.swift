//
//  ViewController.swift
//  bbios
//
//  Created by Michael Wlodawsky on 3/31/20.
//  Copyright © 2020 Bento Box. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
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
        setupSignupUI(fields: [email, verifyEmail, password])
        // Signup Button
        let signupButton = BBButton()
        signupButton.center = CGPoint(x: self.view.center.x,
                                      y: password.center.y + password.frame.height + 25)
        signupButton.setTitle("Signup", for: .normal)
        signupButton.addTarget(self, action: #selector(onSignup), for: .touchUpInside)
        self.view.addSubview(signupButton)
    }
    
    func setupSignupUI(fields: [BBTextField]) {
        var fields = fields
        let startField: BBTextField = fields.removeFirst()
        self.view.addSubview(startField)
        let stepSize: CGFloat = 25.0
        var startY = startField.center.y + startField.frame.height
        for field in fields {
            startY += stepSize
            field.center = CGPoint(x: self.view.center.x,
                                   y: startY)
            self.view.addSubview(field)
            startY += field.frame.height
        }
    }
    
    @objc func onSignup(sender: UIButton) {

        Auth.auth().createUser(withEmail: email.text ?? "", password: password.text ?? "") { (result, error) in
            if error != nil {
                Alerts.singleChoiceAlert(title: "Error", message: "There was an error signing up with Firebase.", vc: self)
            } else {
                print("All good in the hood :)")
            }
        }
    }

}

