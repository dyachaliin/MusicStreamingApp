//
//  PlayerView.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 11.10.2022.
//

import Foundation
import UIKit

class PlayerView: UIView {
    var semiCirleLayer: CAShapeLayer = CAShapeLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let arcCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height)
        let circleRadius = bounds.size.width / 2
        
        let circlePath = UIBezierPath(ovalIn: self.bounds)
        
        semiCirleLayer.path = circlePath.cgPath
        semiCirleLayer.fillColor = UIColor.white.cgColor
        semiCirleLayer.strokeColor = UIColor.systemTeal.cgColor
        semiCirleLayer.borderWidth = 3
        semiCirleLayer.name = "WhiteOval"
        
        if !(layer.sublayers?.contains(where: {$0.name == "WhiteOval"}) ?? false) {
            layer.insertSublayer(semiCirleLayer, at: 0)
        }
        
        backgroundColor = UIColor.clear
    }
}
