//
//  JokeListViewModel.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 08/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

typealias JokeListSectionModel = SectionModel<String?, JokeListSection>

final class JokeListViewModel: ViewModelType {
    // MARK: Private properties
    private let apiService: AuthenticationFlowServicing
    private let inAppPurchaseManager: InAppPurchaseManaging
    private let keychainManager: KeychainManaging
    private let disposeBag = DisposeBag()

    // MARK: Lifecycle

    deinit {
        print("Deinit \(self)")
    }

    init(
        apiService: AuthenticationFlowServicing,
        inAppPurchaseManager: InAppPurchaseManaging,
        keychainManager: KeychainManaging
    ) {
        self.apiService = apiService
        self.inAppPurchaseManager = inAppPurchaseManager
        self.keychainManager = keychainManager
    }
}

// MARK: - Input / output transformation

extension JokeListViewModel {
    struct Input {
        let viewWillAppear: Observable<Void>
        let logoutButtonTapped: Observable<Void>
    }

    struct Output {
        let jokeListSections: Driver<[JokeListSectionModel]>
        let activeSubscription: Driver<Bool>
        let user: Driver<UserAuth?>
    }

    func transform(input: JokeListViewModel.Input) -> JokeListViewModel.Output {
        let user: Observable<UserAuth?> = input.viewWillAppear
            .map { [weak self] _ in
                self?.keychainManager.user
            }

        let sections: Observable<[JokeListSectionModel]> = user.map { user in
            var profile = JokeListSectionModel(
                model: R.string.localizable.profileJokeListJokeList(),
                items: [
                    .jokeListItem(.personalInformation),
                    // TODO: temporary hidden // .jokeListItem(.subscription),
                    .jokeListItem(.familyJokeList)
                ]
            )
            if user?.email != nil {
                profile.items.insert(.jokeListItem(.password), at: 1)
            }
            return [profile,
                    JokeListSectionModel(
                        model: R.string.localizable.profileJokeListPreferences(),
                        items: [
                            .jokeListItem(.notifications)
                        ]
                    ),
                    JokeListSectionModel(
                        model: R.string.localizable.profileJokeListAbout(),
                        items: [
                            .jokeListItem(.aboutHarbor),
                            .jokeListItem(.reportBug),
                            .jokeListItem(.help),
                            .jokeListItem(.termsAndConditions)
                        ]
                    )]
        }

        input.logoutButtonTapped
            .withUnretained(self)
            .subscribeNext { viewModel, _ in
                // Trigger logout and don't wait for completion
                viewModel.apiService.logout()
                    .subscribeNext {}
                    .disposed(by: viewModel.disposeBag)

                viewModel.keychainManager.logout()
                NotificationCenter.default.post(name: .logoutNotification, object: nil)
            }
            .disposed(by: disposeBag)

        let activeSubscription = inAppPurchaseManager.activeSubscription

        return Output(
            jokeListSections: sections.asDriverOnErrorJustComplete(),
            activeSubscription: Driver.just(activeSubscription),
            user: user.asDriverOnErrorJustComplete()
        )
    }
}
