//
//  ErrorView.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import UIKit

class ErrorView: UIView, NibViewLoad {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var errorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    public func setup(errorType: ResponseError) {
        titleLabel.text = "rocket_app_error_title".localize
        descriptionLabel.text = errorType.description
        errorImageView.image = UIImage(named: "crash_draw", in: Bundle(for: ErrorView.self), compatibleWith: nil)
    }
}
