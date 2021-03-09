//
//  ViewModelAssembly.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 07/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import Swinject

// swiftlint:disable force_unwrapping
final class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(JokeListViewModel.self) { _ in
            JokeListViewModel()
        }.inObjectScope(.graph)

        container.register(JokeDetailViewModel.self) { _, joke in
            JokeDetailViewModel(joke: joke)
        }.inObjectScope(.graph)
    }
}
