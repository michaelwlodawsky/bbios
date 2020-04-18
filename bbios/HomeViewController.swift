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
        super.viewDidLoad()
        // Setup Navigation Bar
        let cartButton = Util.setupNavButton(imageName: "shopping_cart.png")
        cartButton.addTarget(self, action: #selector(onCart), for: .touchUpInside)
        let cartItem = UIBarButtonItem(customView: cartButton)
        self.navigationItem.setRightBarButtonItems([cartItem], animated: false)
        self.navigationController?.transparentNavBar()
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)

        //Setup homepage
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
    
    @objc func onCart(sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(OrderViewController(), animated: true)
    }

}
