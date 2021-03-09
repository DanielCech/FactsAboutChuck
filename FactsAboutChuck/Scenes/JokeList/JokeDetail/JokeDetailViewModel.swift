//
//  JokeDetailViewModel.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 09/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

final class JokeDetailViewModel: ViewModelType {
    // MARK: Private properties
    private let disposeBag = DisposeBag()

    // MARK: Lifecycle

    deinit {
        print("Deinit \(self)")
    }

    init() {}
}

// MARK: - Input / output transformation

extension JokeDetailViewModel {
    struct Input {
        let viewWillAppear: Observable<Void>
    }

    struct Output {}

    func transform(input _: JokeDetailViewModel.Input) -> JokeDetailViewModel.Output {
        Output()
    }
}
