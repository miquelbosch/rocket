//
//  UIView.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit

extension UIView {

    func anchorTo(_ superView: UIView) {

        translatesAutoresizingMaskIntoConstraints = false

        let top = topAnchor.constraint(equalTo: superView.topAnchor)
        let left = leftAnchor.constraint(equalTo: superView.leftAnchor)
        let right = rightAnchor.constraint(equalTo: superView.rightAnchor)
        let bottom = bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        NSLayoutConstraint.activate([top, left, right, bottom])
    }

    func anchor(width: CGFloat = 0, height: CGFloat = 0,
                top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                topConstant: CGFloat = 0, bottomConstant: CGFloat = 0,
                leftConstant: CGFloat = 0, rightConstant: CGFloat = 0) {

        var constraints = [NSLayoutConstraint]()

        translatesAutoresizingMaskIntoConstraints = false

        if let left = left {
            let leftConstraint = leftAnchor.constraint(equalTo: left, constant: leftConstant)
            constraints.append(leftConstraint)
        }

        if let right = right {
            let rightConstraint = rightAnchor.constraint(equalTo: right, constant: -rightConstant)
            constraints.append(rightConstraint)
        }

        if let top = top {
            let topConstraint = topAnchor.constraint(equalTo: top, constant: topConstant)
            constraints.append(topConstraint)
        }

        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant)
            constraints.append(bottomConstraint)
        }

        if width > 0 {
            let widthConstraint = widthAnchor.constraint(equalToConstant: width)
            constraints.append(widthConstraint)
        }

        if height > 0 {
            let heightConstraint = heightAnchor.constraint(equalToConstant: height)
            constraints.append(heightConstraint)
        }

        NSLayoutConstraint.activate(constraints)
    }

    func anchorCenterX(to constraint: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: constraint).isActive = true
    }

    func anchorCenterY(to constraint: NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: constraint).isActive = true
    }

    func anchorCenter(_ parentView: UIView, widthCnt: CGFloat = 0, heightCnt: CGFloat = 0) {

        translatesAutoresizingMaskIntoConstraints = false

        let width = widthAnchor.constraint(equalToConstant: widthCnt)
        let height = heightAnchor.constraint(equalToConstant: heightCnt)
        let centerX = centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let centerY = centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        NSLayoutConstraint.activate([width, height, centerX, centerY])
    }

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        backgroundColor = .clear
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                    self?.alpha = 1
                }
            }
        }
    }
}
