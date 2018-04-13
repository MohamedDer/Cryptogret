//
//  MainScreenUseCase.swift
//  Cryptogret
//
//  Created by Mohamed Derkaoui on 13/04/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import UIKit

class MainScreenUseCase {
    
    func calculateRegret(investment: Double, timeInterval: TimeInterval) -> Promise<Void> {
        
        API.getBTCValue(apitarget: .usdtoBTC, ts: timeInterval).then{ response -> Void in
            let multipliedVal = response * investment
            API.getBTCValue(apitarget: .btctoUSD, ts: NSDate().timeIntervalSince1970).then{ secresponse -> Void in
                let result = secresponse*multipliedVal
                print(" ayk rounded \(result.rounded())")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "resultvc")
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
    
    
    
}
