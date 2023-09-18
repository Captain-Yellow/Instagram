//
//  SignInHeaderView.swift
//  Instagram
//
//  Created by Mohammad Afshar on 17/09/2023.
//

import UIKit

class SignInHeaderView: UIView {
    private var gradientLayer: CALayer?
    private let singInlogoImage: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "text_logo")
        imageLogo.contentMode = .scaleAspectFit
        return imageLogo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        createGradient()
        addSubview(singInlogoImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = layer.bounds
        singInlogoImage.frame = CGRect(x: width/4, y: height/3, width: width/2, height: height/3)
    }
    
    private func createGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.gradientLayer = gradientLayer
        layer.addSublayer(gradientLayer)
    }
}
