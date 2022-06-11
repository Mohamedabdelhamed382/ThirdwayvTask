//
//  Extension + UIView.swift
//  Pinterest
//
//  Created by MOHAMED ABD ELHAMED AHMED on 10/06/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func constrain(top: NSLayoutYAxisAnchor? = nil ,
                    left: NSLayoutXAxisAnchor? = nil ,
                    bottom: NSLayoutYAxisAnchor? = nil,
                    right: NSLayoutXAxisAnchor? = nil,
                    topConstraint: CGFloat = 0,
                    leftConstraint: CGFloat = 0,
                    bottomConstraint: CGFloat = 0,
                    rightConstraint: CGFloat = 0,
                    widthConstraint: CGFloat = 0,
                    heightConstraint: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        if let top = top {
            constraints.append(topAnchor.constraint(equalTo: top, constant: topConstraint))
        }
        if let left = left {
            constraints.append(leftAnchor.constraint(equalTo: left, constant: leftConstraint))
        }
        if let bottom = bottom {
            constraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstraint))
        }
        if let right = right {
            constraints.append(rightAnchor.constraint(equalTo: right, constant: -rightConstraint))
        }
        if widthConstraint > 0 {
            constraints.append(widthAnchor.constraint(equalToConstant: widthConstraint))
        }
        if heightConstraint > 0 {
            constraints.append(heightAnchor.constraint(equalToConstant: heightConstraint))
        }
        constraints.forEach({$0.isActive = true})
    }
}

extension UIView{

    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)

        self.addSubview(backgroundView)
    }

    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
