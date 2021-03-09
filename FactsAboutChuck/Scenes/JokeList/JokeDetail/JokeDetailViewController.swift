//
//  JokeDetailViewController.swift
//  FactsAboutChuck
//
//  Created by Daniel Cech on 09/03/2021.
//  Copyright © 2021 STRV. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class JokeDetailViewController: UIViewController, ViewModelContaining {
    @IBOutlet private var jokeLabel: UILabel!

    // MARK: Public Properties

    // swiftlint:disable implicitly_unwrapped_optional
    weak var coordinator: JokeDetailViewEventHandling!
    var viewModel: JokeDetailViewModel!
    // swiftlint:enable implicitly_unwrapped_optional

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindToViewModel()
    }

    func bindToViewModel() {
        jokeLabel.text = viewModel.joke.joke
    }
}
