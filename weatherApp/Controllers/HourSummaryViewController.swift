//
//  HourSummaryViewController.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

import Foundation
import UIKit


class HourSummaryViewController : UIViewController, Coordinating {
    
    weak var coordinator: Coordinator?
    
    private var customView : HourSummaryView {
        return view as! HourSummaryView
    }
    
    func applyUiSettings(poiName : String?, dataForUi : WeatherDataHourly?) {
        let uiData = WeatherDataToUiRepresentationConverter.convertHourlyDataToHourlyControllerFormat(dataForUi: dataForUi)
        
        self.customView.applyUiData(poiName: poiName, uiData: uiData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        
        let hourSummaryView = HourSummaryView(viewFrame: .zero)
        
        hourSummaryView.returnButtonHandler = { [weak self] in
            self?.coordinator?.processEvent(with: .hourSummaryViewToMainViewEvent)
        }
        
        self.view = hourSummaryView
    }
}

