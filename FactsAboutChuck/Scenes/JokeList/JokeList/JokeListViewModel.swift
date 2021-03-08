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
    private let disposeBag = DisposeBag()

    // MARK: Lifecycle

    deinit {
        print("Deinit \(self)")
    }

    init() {}
}

// MARK: - Input / output transformation

extension JokeListViewModel {
    struct Input {
        let viewWillAppear: Observable<Void>
    }

    struct Output {
        let sections: Driver<[JokeListSectionModel]>
    }

    func transform(input: JokeListViewModel.Input) -> JokeListViewModel.Output {
        let sections: Observable<[JokeListSectionModel]> = input.viewWillAppear
            .map { _ in
                [
                    JokeListSectionModel(
                        model: "",
                        items: JokesProvider.jokes.map { JokeListSection.item($0) }
                    )
                ]
            }

        return Output(
            sections: sections.asDriverOnErrorJustComplete()
        )
    }
}
