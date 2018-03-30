//
//  API.swift
//  Cryptogret
//
//  Created by Mohamed Derkaoui on 27/03/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import PromiseKit



class API {
    
    static func getBTCValue(apitarget: apitarget,ts: TimeInterval) -> Promise<Double> {
        return Promise { fulfill, reject in
            
            var fromXtoY = [String]()
            
            switch apitarget {
                case .btctoUSD :
                    fromXtoY = ["BTC","USD"]
                case .usdtoBTC :
                    fromXtoY = ["USD","BTC"]
            }
            let target = CoinCompareAPI.pricehistorical(fsym: fromXtoY[0], tsyms: fromXtoY[1], ts: ts)
            let provider = MoyaProvider<CoinCompareAPI>(plugins: target.plugins)
            
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        // parse the received JSON file to an array of currencies
                        let json = try JSON(data: response.data)
                        // convert the exponential val to decimal
                        let value = json[fromXtoY[0]][fromXtoY[1]].doubleValue
                        
                        print("double is \(Double(value))")
                        
                        fulfill(Double(value))
                    }
                    catch {
                        print("error in json file")
                        reject(error)
                    }
                    
                case let .failure(error):
                    reject(error)
                }
            }
        }
    }
    
    enum apitarget: Int {
        case usdtoBTC = 0
        case btctoUSD = 1
    }
    
}
    

