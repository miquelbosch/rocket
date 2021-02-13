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
    }

    // MARK: - User Interface
    private lazy var tableView: UITableView = {

        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.name)
        return tableView
    }()

    private lazy var activityIndicatorView: UIActivityIndicatorView = {

        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = Colors.secundaryColor.get
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "rocket_app_name".localize
        //setupTableView()
        showLoading()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchorTo(view)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension RocketListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.name, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

extension RocketListViewController: RocketListView {

    func showLoading() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.anchorCenter(view)
    }

    func hideLoading() {
        activityIndicatorView.stopAnimating()
    }
}
