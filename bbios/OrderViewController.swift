//
//  OrderViewController.swift
//  bbios
//
//  Created by Michael Wlodawsky on 4/6/20.
//  Copyright © 2020 Bento Box. All rights reserved.
//

import UIKit
import FirebaseAuth


class OrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let button = BBButton()
        button.setTitleS2F(title: "Test Order with Firebase", state: .normal)
        button.center = self.view.center
        // button.addTarget(self, action: #selector(createOrder), for: .touchUpInside)
        self.view.addSubview(button)

    }
    
    @objc func createOrder(sender: UIButton) {
        // TODO: Create UI for user to input their order numbers
        // Test Data -- Works as expected
        let order = Order(chicken: 2, beef: 2, salmon: 2, veggie: 2)

        db.collection("orders").getDocuments { (snapshot, error) in
            if error != nil {
                print(error!)
                Alerts.singleChoiceAlert(title: "Error", message: "Sorry, there was an error getting info from our Database.", vc: self)
                return
            } else {
                for document in snapshot?.documents ?? [] {
                    db.collection("orders").document(document.documentID).collection("users").document("\(Auth.auth().currentUser!.uid)").setData([
                        "chicken": order.chicken,
                        "beef": order.beef,
                        "salmon": order.salmon,
                        "veggie": order.veggie
                    ])
                }
            }
        }
    }
    

}
