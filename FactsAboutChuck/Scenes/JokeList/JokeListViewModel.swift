//
//  JokeListViewModel.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 07/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

struct JokeListViewModel: ViewModelType {
    struct Input {}

    struct Output {
        var items: Observable<[Joke]>
    }

    func transform(input _: Input) -> Output {
        Output(items: Observable.just(JokesProvider.jokes))
    }
}
