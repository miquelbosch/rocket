//
//  RocketTableViewCell.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import UIKit

class RocketTableViewCell: UITableViewCell {

    // MARK: - Constants
    private struct Constants {
        private init() {}
        static let marginY: CGFloat = 8
        static let marginX: CGFloat = 20
        static let imageDimension: CGFloat = 98
        static let cornerRadius: CGFloat = 16
        static let offsetShadow: CGSize = CGSize(width: 3, height: 3)
        static let radiusShadow: CGFloat = 4
        static let opacityShadow: Float = 0.7
        static let marginLabelToImage: CGFloat = 12
    }

    // MARK: - User Interface
    fileprivate lazy var cardView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addShadow(offset: Constants.offsetShadow, color: .gray,
                       radius: Constants.radiusShadow, opacity: Constants.opacityShadow)
        return view
    }()

    fileprivate lazy var cardBorderView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cornerRadius
        view.layer.masksToBounds = true
        return view
    }()

    fileprivate lazy var rocketImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "Rocket")
        imageView.alpha = 0.3
        return imageView
    }()

    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.accessibilityIdentifier = RocketTableViewCell.name + UILabel.id
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintsCardView()
        constraintsImageView()
        constraintsLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setup(rocket: Rocket) {
        titleLabel.text = rocket.name
        setImageView(name: rocket.image)
        accessibilityIdentifier = RocketTableViewCell.id
    }

    private func constraintsCardView() {

        contentView.addSubview(cardView)

        cardView.anchor(height: Constants.imageDimension,
                        top: contentView.topAnchor,
                        bottom: contentView.bottomAnchor,
                        left: contentView.leftAnchor,
                        right: contentView.rightAnchor,
                        topConstant: Constants.marginY,
                        bottomConstant: Constants.marginY,
                        leftConstant: Constants.marginX,
                        rightConstant: Constants.marginX)

        cardView.addSubview(cardBorderView)
        cardBorderView.anchor(top: cardView.topAnchor,
                              bottom: cardView.bottomAnchor,
                              left: cardView.leftAnchor,
                              right: cardView.rightAnchor)

    }

    private func constraintsImageView() {

        cardBorderView.addSubview(rocketImageView)

        rocketImageView.anchor(width: Constants.imageDimension,
                               top: cardBorderView.topAnchor,
                               bottom: cardBorderView.bottomAnchor,
                               left: cardBorderView.leftAnchor)
    }

    private func constraintsLabel() {

        cardBorderView.addSubview(titleLabel)

        titleLabel.anchor(top: cardBorderView.topAnchor,
                          bottom: cardBorderView.bottomAnchor,
                          left: rocketImageView.rightAnchor,
                          right: cardBorderView.rightAnchor,
                          leftConstant: Constants.marginLabelToImage,
                          rightConstant: Constants.marginLabelToImage)
    }

    private func setImageView(name: String) {

        guard let url = URL(string: name) else {
            fatalError("There is a problem loading the image: \(name)")
        }

        rocketImageView.load(url: url)
    }
}
