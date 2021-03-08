//
//  JokeListViewController.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 07/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import RxDataSources
import RxSwift
import UIKit

class JokeListViewController: UIViewController, ViewModelContaining {
    // MARK: - Outlets
    @IBOutlet private var tableView: UITableView!

    // MARK: - Public Properties

    // swiftlint:disable:next implicitly_unwrapped_optional
    var viewModel: JokeListViewModel!
    weak var coordinator: JokeListViewEventHandling?
    let disposeBag = DisposeBag()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "JokeList"
    }

    func bindToViewModel() {}
}

// MARK: - Binding
extension JokeListViewController {
    func bindTableView() {
        let output = viewModel.transform(input: JokeListViewModel.Input())

        output.items
            .bind(to: tableView.rx.items(cellIdentifier: JokeCell.reuseIdentifier())) { _, item, cell in
                (cell as? JokeCell)?.setup(with: item)
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UI Setup
extension JokeListViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        view.backgroundColor = .white
        view.addSubview(tableView)

        tableView.register(JokeCell.self, forCellReuseIdentifier: JokeCell.reuseIdentifier())
//        tableView.register
        tableView.tableFooterView = UIView()
    }
}
