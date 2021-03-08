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

final class JokeListViewController: UIViewController, ViewModelContaining, FakeNavBarControlling {
    // MARK: IBOutlets
    @IBOutlet private var fakeNavbar: UIView!
    @IBOutlet private var fakeNavbarTitleLabel: UILabel!
    @IBOutlet private var fakeNavbarTopConstraint: NSLayoutConstraint!
    @IBOutlet private var jokeListTableView: UITableView!

    private var tableHeader: JokeListHeader!
    private var tableFooter: JokeListFooter!

    // MARK: Public Properties
    weak var coordinator: Coordinating!

    var viewModel: JokeListViewModel!
    var disposeBag = DisposeBag()

    // MARK: Private Properties
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<JokeListSectionModel>(configureCell: { _, tableView, indexPath, item -> UITableViewCell in
        switch item {
        case let .jokeListItem(cellItem):
            let cell: AddSheetTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setup(with: cellItem)
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

// MARK: - Table headers

extension JokeListViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionTitle = dataSource.sectionModels[section].model else {
            return nil
        }

        let headerView: SimpleSectionHeader = jokeListTableView.dequeueReusableHeaderFooterView()
        headerView.setup(title: sectionTitle)
        return headerView
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - Binding

extension JokeListViewController {
    func bindToView() {
        handleFakeNabBarAnimation(
            tableView: jokeListTableView,
            fakeNavbarTopConstraint: fakeNavbarTopConstraint
        )
        .disposed(by: disposeBag)

        jokeListTableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    func bindToViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid()
        let input = JokeListViewModel.Input(
            viewWillAppear: viewWillAppear,
            logoutButtonTapped: tableFooter.logoutButton.rx.tap.asObservable()
        )

        let output = viewModel.transform(input: input)
        output.jokeListSections.drive(jokeListTableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)

        output.activeSubscription.asObservable()
            .map { !$0 }
            .bind(to: tableHeader.premiumBadge.rx.isHidden)
            .disposed(by: disposeBag)

        output.user
            .drive(onNext: { [weak self] user in
                self?.tableHeader.setupView(
                    name: user?.name ?? "",
                    email: user?.email ?? user?.socialEmail ?? "",
                    avatarId: user?.avatarId ?? 1,
                    setAvatarClosure: { [weak self] in
                        self?.coordinator.showAvatarSelectionSheet()
                    }
                )
            })
            .disposed(by: disposeBag)
    }

    // swiftlint:disable:next cyclomatic_complexity
    func bindToCoordinator() {
        jokeListTableView.rx.modelSelected(JokeListSection.self)
            .bind(onNext: { [weak self] section in
                switch section {
                case let .jokeListItem(item):
                    switch item {
                    case .personalInformation:
                        self?.coordinator.showPersonalInformation()
                    case .emailAddress:
                        break
                    case .password:
                        self?.coordinator.showChangePassword()
                    case .subscription:
                        self?.coordinator.showSubscription()
                    case .familyJokeList:
                        self?.coordinator.showHouseholdMembers()
                    case .notifications:
                        self?.coordinator.showNotifications()
                    case .darkMode:
                        break
                    case .aboutHarbor:
                        self?.coordinator.showWebViewController(mode: .about)
                    case .referFriends:
                        break
                    case .reportBug:
                        self?.coordinator.showReportBugController()
                    case .help:
                        self?.coordinator.showWebViewController(mode: .help)
                    case .termsAndConditions:
                        self?.coordinator.showWebViewController(mode: .termsAndConditions)
                    }
                }

            }).disposed(by: disposeBag)
    }
}

// MARK: - Private Methods

private extension JokeListViewController {
    func setupView() {
        setupIBOutlets()
        bindToView()
        bindToViewModel()
        bindToCoordinator()
    }

    func setupIBOutlets() {
        fakeNavbarTitleLabel.attributedText = R.string.localizable.profileJokeListJokeList().styled(with: .dashboardActivityTitle)
        fakeNavbar.apply(style: .shadow)

        jokeListTableView.separatorStyle = .none
        jokeListTableView.showsVerticalScrollIndicator = false
        jokeListTableView.rowHeight = UITableView.automaticDimension
        jokeListTableView.estimatedSectionHeaderHeight = 85
        jokeListTableView.sectionHeaderHeight = UITableView.automaticDimension
        jokeListTableView.register(AddSheetTableViewCell.self)
        jokeListTableView.registerHeaderFooterView(SimpleSectionHeader.self)

        tableHeader = JokeListHeader.nibInstance
        jokeListTableView.setTableHeader(header: tableHeader, height: 290)

        tableFooter = JokeListFooter.nibInstance
        jokeListTableView.setTableFooter(footer: tableFooter, height: 191)

        // I needed to disable animations because when user selected the Profile tab, the table header was shown animated
        UIView.setAnimationsEnabled(false)

        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            UIView.setAnimationsEnabled(true)
        }
    }
}
