// ___FILEHEADER___

import RxCocoa
import RxSwift
import UIKit

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_superClass___, ViewModelContaining {
    // MARK: IBOutlets

    // MARK: Public Properties

    // swiftlint:disable:next implicitly_unwrapped_optional
    weak var coordinator: ___VARIABLE_coordinatorType___!

    // swiftlint:disable:next implicitly_unwrapped_optional
    var viewModel: ___VARIABLE_viewModelType___!
    var disposeBag: DisposeBag = DisposeBag()

    // MARK: Private Properties

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func bindToViewModel() {
        let input = ___VARIABLE_viewModelType___.Input()
        let output = viewModel.transform(input: input)

        /// Add bindings to output properties here
    }
}

// MARK: Private Methods

private extension ___FILEBASENAMEASIDENTIFIER___ {
    func setupView() {
        bindToViewModel()
    }
}
