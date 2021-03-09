//
//  JokeListCoordinator+Events.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 07/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import Foundation
import Swinject

// MARK: - JokeListViewEventHandling
extension JokeListCoordinator: JokeListViewEventHandling {
    func handle(event: JokeListViewEvent) {
        switch event {
        case let .showJoke(joke):
            let detailController = makeJokeDetailViewController(joke: joke)
            navigationController.pushViewController(detailController, animated: true)
        }
    }
}

// MARK: - JokeDetailViewEventHandling
extension JokeListCoordinator: JokeDetailViewEventHandling {
    func handle(event _: JokeDetailViewEvent) {
        // TODO: Handle event
    }
}
