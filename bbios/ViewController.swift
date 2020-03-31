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
    
    var email: UITextField!
    var verifyEmail: UITextField!
    var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize Text Fields
        email = UITextField()
        email.textAlignment = .center
        email.placeholder = "example@email.com"
        verifyEmail = UITextField()
        verifyEmail.placeholder = "example@email.com"
        password = UITextField()
        password.placeholder = "password"
        // Hide password input contents
//        password.textContentType = .password
        let signupButton = UIButton(frame: CGRect(x: 100, y: 40, width: 100, height: 50))
        signupButton.isEnabled = true
        signupButton.setTitle("signup", for: .normal)
        signupButton.setTitleColor(.black, for: .normal)
        signupButton.addTarget(self, action: #selector(onSignup), for: .touchUpInside)
        self.view.addSubview(signupButton)
        //setup UI
        setupSignupUI(fields: [email, verifyEmail, password])

    }
    
    func setupSignupUI(fields: [UITextField]) {
        var yStart = self.view.frame.height * 0.25
        for (index, field) in fields.enumerated() {
            field.center.y = yStart
            field.center.x = self.view.center.x
            field.frame.size.height = 50
            field.frame.size.width = self.view.frame.width * 0.5
            self.view.addSubview(field)
            //iterate
            yStart += 75
        }
    }
    
    @objc func onSignup(sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: nil)
    }

}

