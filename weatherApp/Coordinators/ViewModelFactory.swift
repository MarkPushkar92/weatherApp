//
//  ViewModelFactory.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 09.02.2022.
//

import Foundation
import UIKit

protocol ViewModelFactory {
    func createViewController(with type : CoordinatingViewModelTypes, coordinator : Coordinator ) -> UIViewController & Coordinating
}

class ViewModelFactoryImpl : ViewModelFactory {
    private func createDaySummaryControllerWithUiSettings(poiName : String?, weatherData : WeatherDataMonthly?) -> DaySummaryController {
            let controller = DaySummaryController()
            controller.applyUiSettings(poiName: poiName, weatherData: weatherData)
            return controller
    }
    
    private func createHourlyControllerWithUiSettings(poiName : String?, weatherData : WeatherDataHourly?) -> HourSummaryViewController {
            let controller = HourSummaryViewController()
            controller.applyUiSettings(poiName: poiName, dataForUi: weatherData)
            return controller
    }
    
    private func createViewModelBasedOnType(with type: CoordinatingViewModelTypes) -> UIViewController & Coordinating {
        
        switch type {
            case .onboardingModel :
                return OnBoardingViewController()
            
            case .mainViewModel :
                return MainViewController()
            
            case .daySummaryViewModel(let poiName, let weatherData) :
                return createDaySummaryControllerWithUiSettings(poiName: poiName, weatherData: weatherData)
            
            case .hourSummaryViewModel(let poiName, let weatherData) :
                return createHourlyControllerWithUiSettings(poiName: poiName, weatherData: weatherData)
            
            case .settingsViewModel :
                return SettingsViewController()
        }
    }
    
    func createViewController(with type: CoordinatingViewModelTypes, coordinator: Coordinator) -> UIViewController & Coordinating {
        
        let viewModel = createViewModelBasedOnType(with : type)
        viewModel.coordinator = coordinator
        return viewModel
    }
}

