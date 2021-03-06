//
//  SpecificViewModel.swift
//  STRV_template
//
//  Created by Jan on 30/07/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

import RxCocoa
import RxSwift
import RxSwiftExt

class SpecificViewModel: ViewModelType {
    struct Input {
        let viewWillAppear: Observable<Void>
        let sendNumberTapped: Observable<Void>
    }

    struct Output {
        let randomNumber: Driver<String>
        let errors: Driver<Error>
    }

    let service: SpecificServicing

    init(service: SpecificServicing) {
        self.service = service
    }

    func transform(input: SpecificViewModel.Input) -> SpecificViewModel.Output {
        let randomNumberResponse = input.viewWillAppear
            .withUnretained(self)
            .flatMapLatest { viewModel, _ -> Observable<Event<SpecificModel>> in
                viewModel.service.getRandomInt().asObservable()
                    .materialize()
            }
            .share()

        let sendNumberResponse = input.sendNumberTapped
            .withUnretained(self)
            .flatMapLatest { viewModel, _ -> Observable<Event<Void>> in
                viewModel.service.postRandomInt(number: Int.random(in: 0...1000)).asObservable()
                    .materialize()
            }
            .share()
            .debug()

        let randomNumber = randomNumberResponse.elements().asDriverOnErrorJustComplete().map { "RANDOM NUMBER - \($0.randomNumber)" }

        let errors = Observable.merge(randomNumberResponse.errors(), sendNumberResponse.errors())
            .asDriverOnErrorJustComplete()

        return Output(randomNumber: randomNumber, errors: errors)
    }
}
