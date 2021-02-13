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

    func anchorCenter(_ parentView: UIView, widthCnt: CGFloat = 0, heightCnt: CGFloat = 0) {

        translatesAutoresizingMaskIntoConstraints = false
        
        let width = widthAnchor.constraint(equalToConstant: widthCnt)
        let height = heightAnchor.constraint(equalToConstant: heightCnt)
        let centerX = centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let centerY = centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        NSLayoutConstraint.activate([width, height, centerX, centerY])
    }
}
