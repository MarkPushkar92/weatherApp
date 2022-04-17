//
//  DaySummaryCoordinator.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

// Completed File

import Foundation
import UIKit

class DaySummaryCoordinator : Coordinator, Coordinating {
    
    weak var coordinator: Coordinator?
    
    weak var navigationController: UINavigationController?
    
    private let viewModelFactory : ViewModelFactory
    
    private func handleSwitchFromMainViewToDaySummaryView(poiName : String?, weatherData : WeatherDataMonthly?) {
        
        let daySummaryController = viewModelFactory.createViewController(with: .daySummaryViewModel(poiName, weatherData), coordinator: self)

        if let vc = daySummaryController as? DaySummaryController {
            vc.applyUiSettings(poiName: poiName, weatherData: weatherData)
        }
        
        navigationController?.pushViewController(daySummaryController, animated: true)
    }
    
    func processEvent(with type: CoordinatorEvent) {
        switch type {
        case .mainViewToDaySummaryViewEvent(let poiName, let weatherData) :
            handleSwitchFromMainViewToDaySummaryView(poiName: poiName, weatherData: weatherData)
            
        case .daySummaryViewToMainViewEvent :
            navigationController?.popViewController(animated: true)
            
        default :
            showCoordinatorAlert()
        }
    }
    
    func start() {}
    
    init(viewModelFactory : ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
}
