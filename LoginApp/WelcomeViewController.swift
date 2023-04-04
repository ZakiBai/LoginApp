//
//  LoggedAccountMainPageViewController.swift
//  LoginApp
//
//  Created by Zaki on 02.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiLabel.text = "\u{1F44B}"
        nameLabel.text =  name
        setUpBackgroundColor()
    }
    
    private func setUpBackgroundColor() {
        view.backgroundColor = .systemCyan
        navigationItem.title = "Gradient View"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.systemCyan.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        gradientLayer.frame = view.frame
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
