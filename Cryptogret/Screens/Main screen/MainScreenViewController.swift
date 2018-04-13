//
//  MainScreenViewController.swift
//  Cryptogret
//
//  Created by Mohamed Derkaoui on 13/04/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//


import UIKit
import HFKit



class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var investment: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var calculate: UIButton!
    
    private var presenter: MainScreenPresenter {
        return MainScreenPresenter()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datepicker.maximumDate = Date.init()
        //set IQKeyboard
        
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        let investmentString = investment.text
        if isStringEmpty(investmentString) {
            let error = ErrorViewModel(title: "Oups ! An error occured :", description: "Empty value field")
            show(error: error)
            
        } else {
            let investmentValue  = Double(investment.text!)
            let datets = datepicker.date.timeIntervalSince1970
            presenter.didClickCalculate(investment: investmentValue, timeInterval: datets)
        }
    }
}

