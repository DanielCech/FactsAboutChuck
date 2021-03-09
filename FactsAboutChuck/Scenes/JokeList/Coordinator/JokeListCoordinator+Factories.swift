//
//  JokeListCoordinator+Factories.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 07/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import Foundation
import Swinject

// MARK: - Factories
extension JokeListCoordinator {
    func makeJokeListViewController() -> JokeListViewController {
        let viewController = R.storyboard.jokeListViewController.instantiateInitialViewController(
            viewModel: resolve(JokeListViewModel.self)
        )

        viewController.coordinator = self

        return viewController
    }

    func makeJokeDetailViewController() -> JokeDetailViewController {
        let viewController = R.storyboard.jokeDetailViewController.instantiateInitialViewController(
            viewModel: resolve(JokeDetailViewModel.self)
        )

        viewController.coordinator = self

        return viewController
    }
}
