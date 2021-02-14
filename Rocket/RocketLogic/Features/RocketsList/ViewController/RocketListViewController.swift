//
//  RocketListViewController.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit

internal protocol RocketListView: class {
    var title: String? { get set }
    func showLoading()
    func hideLoading()
}

class RocketListViewController: UIViewController {

    // MARK: - Constants
    private struct Constants {
        private init() {}
        static let activityIndicatorHeight: CGFloat = 46
        static let activityIndicatorInitialPosition: CGFloat = 0
        static let marginXTable: CGFloat = 26
        static let marginYTable: CGFloat = 0
    }

    // MARK: - User Interface
    private lazy var tableView: UITableView = {

        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(RocketTableViewCell.self, forCellReuseIdentifier: RocketTableViewCell.name)
        tableView.contentInset = UIEdgeInsets(top: Constants.marginXTable, left: Constants.marginYTable,
                                              bottom: -Constants.marginXTable, right: Constants.marginYTable)
        return tableView
    }()

    private lazy var activityIndicatorView: UIActivityIndicatorView = {

        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = Colors.secundaryColor.get
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "rocket_app_name".localize
        setupTableView()
        showLoading()
    }

    // MARK: - Setups
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor,
                         bottom: view.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor)
    }

    private func animationCellWhenPush(cell: UITableViewCell) {

        cell.transform = CGAffineTransform.identity

        UIView.animate(withDuration: 0.2, animations: {
            cell.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }, completion: { _ in
            cell.transform = CGAffineTransform.identity
        })
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension RocketListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: RocketTableViewCell.name, for: indexPath) as? RocketTableViewCell else {
            fatalError("Coldn't load \(RocketTableViewCell.name) Cell")
        }
        
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cell = tableView.cellForRow(at: indexPath) as? RocketTableViewCell else {
            return
        }

        animationCellWhenPush(cell: cell)
    }
}

// MARK: - View Protocols
extension RocketListViewController: RocketListView {

    func showLoading() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.anchorCenter(view)
    }

    func hideLoading() {
        activityIndicatorView.stopAnimating()
    }
}
