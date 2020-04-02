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
        self.view.backgroundColor = .white
        let label = BBLabel()
        label.center = self.view.center
        label.setText(text: "Bento Box App Homepage")
        
        self.view.addSubview(label)
    }

}
