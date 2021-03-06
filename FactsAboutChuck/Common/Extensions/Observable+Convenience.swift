//
//  Observable+Convenience.swift
//  FactsAboutChuck
//
//  Created by Abel Osorio on 9/9/19.
//  Copyright © 2019 STRV. All rights reserved.
//

import RxCocoa
import RxSwift

extension Observable {
    func subscribeNext(_ onNext: ((Element) -> Void)?) -> Disposable {
        subscribe(onNext: onNext)
    }

    func subscribeError(_ onError: ((Error) -> Void)?) -> Disposable {
        subscribe(onError: onError)
    }

    func subscribeCompleted(_ onCompleted: (() -> Void)?) -> Disposable {
        subscribe(onCompleted: onCompleted)
    }

    func doOnNext(_ onNext: ((Element) throws -> Void)?) -> Observable<Element> {
        `do`(onNext: onNext)
    }

    func doOnError(_ onError: ((Error) throws -> Void)?) -> Observable<Element> {
        `do`(onError: onError)
    }
}

extension ControlEvent {
    func subscribeNext(_ onNext: ((PropertyType) -> Void)?) -> Disposable {
        subscribe(onNext: onNext)
    }
}

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        map { _ in }
    }
}

extension ObservableType {
    func catchErrorJustComplete() -> Observable<Element> {
        catchError { _ in
            Observable.empty()
        }
    }

    func asDriverOnErrorJustComplete() -> Driver<Element> {
        asDriver { _ in
            Driver.empty()
        }
    }

    func asDriverLogError(_ file: StaticString = #file, _ line: UInt = #line) -> SharedSequence<DriverSharingStrategy, Element> {
        asDriver(onErrorRecover: { print("Error:", $0, " in file:", file, " atLine:", line); return .empty() })
    }

    func mapToVoid() -> Observable<Void> {
        map { _ in }
    }
}
