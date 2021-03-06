//
//  ViewModelContaining.swift
//  STRV_template
//
//  Created by Abel Osorio on 9/9/19.
//  Copyright © 2019 STRV. All rights reserved.
//

import Foundation
import RxSwift

public protocol ViewModelContaining {
    associatedtype ViewModel

    // swiftlint:disable:next implicitly_unwrapped_optional
    var viewModel: ViewModel! { get set }
    var disposeBag: DisposeBag { get }

    func bindToViewModel()
}
