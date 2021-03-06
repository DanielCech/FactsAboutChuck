//
//  SpecificServicing.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 21/01/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

import RxSwift

protocol SpecificServicing {
    var apiManager: APIManaging { get }

    func getRandomInt() -> Single<SpecificModel>
    func postRandomInt(number: Int) -> Single<Void>
}
