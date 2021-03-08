//
//  JokeListViewController.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 08/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import MessageUI
import RxCocoa
import RxDataSources
import RxSwift
import UIKit

// swiftlint:disable implicitly_unwrapped_optional

final class JokeListViewController: UIViewController, ViewModelContaining {
    // MARK: IBOutlets
    @IBOutlet private var tableView: UITableView!

    // MARK: Public Properties
    weak var coordinator: JokeListViewEventHandling!

    var viewModel: JokeListViewModel!
    var disposeBag = DisposeBag()

    // MARK: Private Properties
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<JokeListSectionModel>(configureCell: { _, tableView, indexPath, item -> UITableViewCell in
        switch item {
        case let .item(joke):
            let cell: JokeCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setup(with: joke)
            return cell
        }
    })

    // MARK: Lifecycle

    deinit {
        print("Deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - Binding

extension JokeListViewController {
    func bindToView() {}

    func bindToViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid()

        let input = JokeListViewModel.Input(
            viewWillAppear: viewWillAppear
        )

        let output = viewModel.transform(input: input)
        output.sections
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    // swiftlint:disable:next cyclomatic_complexity
    func bindToCoordinator() {
        tableView.rx.modelSelected(JokeListSection.self)
            .bind(onNext: { [weak self] _ in
                // TODO:
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private Methods

private extension JokeListViewController {
    func setupView() {
        setupIBOutlets()
        bindToView()
        bindToViewModel()
        bindToCoordinator()

        title = "Facts about Chuck"
    }

    func setupIBOutlets() {
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 85
        tableView.sectionHeaderHeight = UITableView.automaticDimension

        tableView.register(JokeCell.self)
    }
}
