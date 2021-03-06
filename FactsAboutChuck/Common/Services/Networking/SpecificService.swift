//
//  SpecificService.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 29/11/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import RxSwift

final class SpecificService: SpecificServicing {
    var apiManager: APIManaging

    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }

    func getRandomInt() -> Single<SpecificModel> {
        apiManager.request(endpoint: SpecificRouter.getRandomInt)
    }

    func postRandomInt(number: Int) -> Single<Void> {
        apiManager.request(endpoint: SpecificRouter.postRandomInt(number: number))
    }
}
