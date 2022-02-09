//
//  ViewModelFactory.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 09.02.2022.
//

import Foundation
import UIKit

protocol ViewModelFactory {
    func createViewModel(with type : CoordinatingViewModelTypes, coordinator : Coordinator ) -> UIViewController & Coordinating
}

class ViewModelFactoryImpl : ViewModelFactory {
    private func createViewModelBasedOnType(with type: CoordinatingViewModelTypes) -> UIViewController & Coordinating {
        
        switch type {
            case .onboardingModel :
                return OnBoardingViewController()
            
            case .mainViewModel :
                return MainViewController()
//
//            case .daySummaryViewModel :
//                return DaySummaryController()
//
//            case .hourSummaryViewModel :
//                return HourSummaryViewController()
//
//            case .settingsViewModel :
//                return SettingsViewController()
        }
    }
    
    func createViewModel(with type: CoordinatingViewModelTypes, coordinator: Coordinator) -> UIViewController & Coordinating {
        let viewModel = createViewModelBasedOnType(with : type)
        viewModel.coordinator = coordinator
        return viewModel
    }
}

