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
    // MARK: Public Properties
    weak var coordinator: JokeDetailViewEventHandling!

    var viewModel: JokeDetailViewModel!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func bindToViewModel() {}
}
