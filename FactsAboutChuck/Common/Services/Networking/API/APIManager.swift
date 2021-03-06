//
//  AlamofireAPIManager.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import Moya
import RxSwift

public final class APIManager {
    // ADD YOUR IMPLEMENTATION TO 'didSet' BLOCK IF YOU WANT TO INDICATE NETWORK ACTIVITY
    // 'UIApplication.shared.isNetworkActivityIndicatorVisible' is deprecated from iOS 13
    private(set) var networkActivityCount = 0

    lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        return decoder
    }()

    public lazy var provider: MoyaProvider<MultiTarget> = {
        let networkActivityPlugin = NetworkActivityPlugin { [weak self] change, _ in
            switch change {
            case .began:
                self?.networkActivityCount += 1
            case .ended:
                self?.networkActivityCount -= 1
            }
        }

        return MoyaProvider(plugins: [networkActivityPlugin])
    }()
}

extension APIManager: APIManaging {
    public func request<Target: TargetType, ResponseBody: Decodable>(endpoint: Target) -> Single<ResponseBody> {
        provider.rx
            .request(MultiTarget(endpoint))
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .map(ResponseBody.self, using: jsonDecoder)
            .asSingle()
    }

    public func request<Target: TargetType>(endpoint: Target) -> Single<Void> {
        provider.rx
            .request(MultiTarget(endpoint))
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .mapToVoid()
            .asSingle()
    }
}
