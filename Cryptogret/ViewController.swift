//
//  ViewController.swift
//  Cryptogret
//
//  Created by Mohamed Derkaoui on 27/03/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var investment: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var calculate: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datepicker.maximumDate = Date.init()
        
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        if investment.text == nil || investment.text == ""{
            return
        }
        
        let investmentVal  = Double(investment.text!)
        let datets = datepicker.date.timeIntervalSince1970
        
        API.getBTCValue(apitarget: .usdtoBTC, ts: datets).then{ response -> Void in
            let multipliedVal = response * Double(investmentVal!)
            API.getBTCValue(apitarget: .btctoUSD, ts: NSDate().timeIntervalSince1970).then{ secresponse -> Void in
                let result = secresponse*multipliedVal
                print(" ayk rounded \(result.rounded())")
//                resultss = result.rounded()
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "resultvc")
                self.present(controller, animated: true, completion: nil)
            }
        }
        
    }
    
    
}

