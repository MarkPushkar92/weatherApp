//
//  HourSummaryCoordinator.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

// Completed File

import Foundation
import UIKit

class HourSummaryCoordinator : Coordinator, Coordinating {
    
    weak var coordinator: Coordinator?
    
    weak var navigationController: UINavigationController?
    
    private let viewModelFactory : ViewModelFactory
    
    private func handleSwitchFromMainViewToHourSummaryView(poiName : String?, dataForUi : WeatherDataHourly?) {
        
        let hourSummaryController = viewModelFactory.createViewController(with: .hourSummaryViewModel(poiName, dataForUi), coordinator: self)
        
        navigationController?.pushViewController(hourSummaryController, animated: true)
    }

   
    
    func processEvent(with type: CoordinatorEvent) {
        switch type {
        case .mainViewToHourSummaryViewEvent(let poiName, let dataForUi) :
            handleSwitchFromMainViewToHourSummaryView(poiName : poiName,
                                                      dataForUi: dataForUi)
            
        case .hourSummaryViewToMainViewEvent :
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
