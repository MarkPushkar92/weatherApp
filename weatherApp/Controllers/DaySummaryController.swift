//
//  DaySummaryController.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

import Foundation
import UIKit

class DaySummaryController : UIViewController, Coordinating {
    
    weak var coordinator: Coordinator?
    
    private var customView: DaySummaryView {
       return view as! DaySummaryView
    }
    
    func applyUiSettings(poiName : String?, weatherData : WeatherDataMonthly?) {
        if let dataForUi = weatherData {
            let uiData = WeatherDataToUiRepresentationConverter.convertMonthlyDataToUiRepresentation(weatherData: dataForUi)

            self.customView.applyUiSettings(poiName: poiName, uiData: uiData)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let daySummaryView = DaySummaryView(viewFrame: .zero)
        
        daySummaryView.returnButtonHandler = { [weak self] in
            self?.coordinator?.processEvent(with: .daySummaryViewToMainViewEvent)
        }
        
        self.view = daySummaryView
    }
}

