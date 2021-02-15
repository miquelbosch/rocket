//
//  NibViewLoad.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import UIKit

protocol NibViewLoad {
    static func createView(forceFailure: Bool) -> Self?
}

extension NibViewLoad where Self: UIView {

    static func createView(forceFailure: Bool = false) -> Self? {

        let nibName: String = String(describing: self)
        guard let nib = UINib(nibName: nibName, bundle: Bundle(for: Self.self)).instantiate(withOwner: nil, options: nil).first as? Self, !forceFailure else {
            return nil
        }

        return nib
    }
}
