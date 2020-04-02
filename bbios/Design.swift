//
//  Design.swift
//  bbios
//
//  Created by Michael Wlodawsky on 3/31/20.
//  Copyright © 2020 Bento Box. All rights reserved.
//

import UIKit

class Util {
    static func setupLinearUI(startView: UIView, subsequentViews: [UIView], stepSize: CGFloat, vc: UIViewController) {
        let views = subsequentViews
        vc.view.addSubview(startView)
        var startY = startView.center.y + startView.frame.height
        for view in views {
            startY += stepSize
            view.center = CGPoint(x: vc.view.center.x,
                                   y: startY)
            vc.view.addSubview(view)
            startY += view.frame.height
        }
    }
}

class BBLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }
    
    private func setupLabel() {
        self.textColor = .black
        self.textAlignment = .center
        self.frame.size.height = 50
        self.frame.size.width = 150
        self.text = "Default"
    }
    
    func setText(text: String) {
        self.text = text
        let center: CGPoint = self.center
        self.sizeToFit()
        self.center = center
    }
}


class BBTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    private func setupTextField() {
        // TODO: Add Design Here :)
        self.frame.size.height = 50
        self.frame.size.width = self.superview?.frame.size.width ?? 400 * 0.5
        self.textAlignment = .center
        // Bottom Text Line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}


class BBButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        // TODO: Add Design Here :)
        self.frame.size.width = 100
        self.frame.size.height = 50
        self.setTitle("Button", for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.setTitleColor(.lightGray, for: .highlighted)
    }
    
    func setTitleS2F(title: String, state: UIControl.State) {
        let center = self.center
        setTitle(title, for: state)
        self.sizeToFit()
        self.center = center
    }
}

class Alerts {
    static func singleChoiceAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func notImplementedAlert(functionalityDescription: String, vc: UIViewController) {
        let alert = UIAlertController(title: "Functionality not Implemented!", message: functionalityDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
