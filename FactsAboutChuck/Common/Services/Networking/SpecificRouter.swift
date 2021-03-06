//
//  SpecificRouter.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import Moya

public enum SpecificRouter {
    case getRandomInt
    case postRandomInt(number: Int)
}

extension SpecificRouter: TargetType {
    public var baseURL: URL {
        Configuration.default.apiBaseUrl
    }

    public var path: String {
        switch self {
        case .getRandomInt, .postRandomInt:
            return "randomInt"
        }
    }

    public var parameters: [String: Any]? {
        switch self {
        case .getRandomInt:
            return nil
        case let .postRandomInt(number):
            return ["number": number]
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getRandomInt:
            return .get
        case .postRandomInt:
            return .post
        }
    }

    public var validationType: ValidationType {
        .none
    }

    public var task: Task {
        // switch here if you need different Task types

        if let parameters = parameters, !parameters.isEmpty {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }

        return .requestPlain
    }

    public var sampleData: Data { Data() }

    public var headers: [String: String]? { nil }
}
