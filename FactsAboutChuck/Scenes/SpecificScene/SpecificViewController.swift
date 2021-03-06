//
//  SpecificViewController.swift
//  FactsAboutChuck
//
//  Created by Jan on 30/07/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class SpecificViewController: UIViewController, ViewModelContaining {
    // MARK: IBOutlets
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var sendNumberButton: UIButton!

    // MARK: Public Properties

    // swiftlint:disable:next implicitly_unwrapped_optional
    weak var coordinator: SpecificViewEventHandling!

    // swiftlint:disable:next implicitly_unwrapped_optional
    var viewModel: SpecificViewModel!
    let disposeBag = DisposeBag()

    // MARK: Private Properties

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func bindToViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid()
        let input = SpecificViewModel.Input(viewWillAppear: viewWillAppear, sendNumberTapped: sendNumberButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)

        output.randomNumber.drive(titleLabel.rx.text).disposed(by: disposeBag)
        output.errors.drive(onNext: { [weak self] error in
            guard let self = self else {
                return
            }
            self.showErrorAlert(title: "Something went wrong", message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}

// MARK: Private Methods

private extension SpecificViewController {
    func setupView() {
        bindToViewModel()
    }
}
