//
//  HomeViewController.swift
//  bbios
//
//  Created by Michael Wlodawsky on 4/2/20.
//  Copyright © 2020 Bento Box. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        // Setup Navigation Bar
        let navItem = UINavigationItem(title: "Home")
        let profileItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(onProfile))
        let addOrderItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addOrder))
        navItem.rightBarButtonItem = addOrderItem
        navItem.leftBarButtonItem = profileItem

        self.navigationItem.rightBarButtonItem = addOrderItem
        self.navigationItem.leftBarButtonItem = profileItem


        
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let label = BBLabel()
        label.center = self.view.center
        label.setText(text: "Bento Box App Homepage")
        
        self.view.addSubview(label)
    }
    
    @objc func onProfile(sender: UIBarButtonItem) {
        // TODO: Make profile page
        Alerts.notImplementedAlert(functionalityDescription: "This feature is not yet implemented for Bento Box.", vc: self)
    }
    
    @objc func addOrder(sender: UIBarButtonItem) {
        // TODO: Transition to Order Page
        print("We here****")
    }

}
