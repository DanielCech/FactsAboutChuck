//
//  APIManaging.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import Moya
import RxSwift

public protocol APIManaging {
    func request<Target: TargetType, ResponseBody: Decodable>(endpoint: Target) -> Single<ResponseBody>
    func request<Target: TargetType>(endpoint: Target) -> Single<Void>
}
