//
//  MainScreenPresenter.swift
//  Cryptogret
//
//  Created by Mohamed Derkaoui on 13/04/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import UIKit

class MainScreenPresenter: MainScreenPresenting {
    
    
    
    
}

protocol MainScreenPresenting {
    func validate(investment: Double, timeInterval: TimeInterval) -> [Error]
    func didClickCalculate(investment: Double, timeInterval: TimeInterval)
}
