//
//  CryptoCompareAPI.swift
//  Cryptogret
//
//  Created by Mohamed Derkaoui on 27/03/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import Moya


enum CoinCompareAPI {
    case pricehistorical(fsym: String, tsyms: String, ts: TimeInterval)
}

extension CoinCompareAPI: TargetType{
    
    
    var baseURL: URL {
        let url = URL(string: "https://min-api.cryptocompare.com/data/")
        return url!
    }
    
    var path: String {
        switch self {
        case .pricehistorical(_):
            return "pricehistorical"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .pricehistorical :
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        switch self {
        case .pricehistorical :
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .pricehistorical(let fsym ,let tsyms, let ts):
            var parameters = [String: Any]()
            parameters["fsym"] = fsym
            parameters["tsyms"] = tsyms
            parameters["ts"] = Int(ts)
            return parameters
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .pricehistorical : return URLEncoding.queryString
        }
    }
}

extension CoinCompareAPI {
    var plugins: [PluginType] {
        return [NetworkLoggerPlugin()]
    }
}
