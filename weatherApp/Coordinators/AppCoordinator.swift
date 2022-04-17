//
//  AppCoordinator.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 09.02.2022.
//

// Completed File

import Foundation
import UIKit

enum Screen: String {
    case main
    case settings
    case daySummary
    case hourSummary
    case onboarding
}

class AppCoordinator : Coordinator {
    
    var navigationController: UINavigationController?
    var children : [Screen: Coordinator]?
    
    func processEvent(with type: CoordinatorEvent) {
        switch type {
        case .onboardingViewToMainViewEvent :
            children?[.main]?.processEvent(with: type)
            
        case .mainViewToSettingsViewEvent :
            children?[.settings]?.processEvent(with: type)

        case .mainViewToDaySummaryViewEvent :
            children?[.daySummary]?.processEvent(with: type)
            
        case .mainViewToHourSummaryViewEvent :
            children?[.hourSummary]?.processEvent(with: type)
            
        default :
            ()
        }
    }

    private let vcFactory: ViewModelFactory
    
    private func createCoordinator(type : CoordinatingViewModelTypes) -> Coordinator & Coordinating {
        var result : Coordinator & Coordinating
        
        switch type {
            case .onboardingModel:
            result = OnBoardingCoordinator(viewModelFactory: self.vcFactory)
            case .mainViewModel:
            result = MainCoordinator(viewModelFactory: self.vcFactory)
            case .settingsViewModel:
            result = SettingsCoordinator(viewModelFactory: self.vcFactory)
            case .daySummaryViewModel:
            result = DaySummaryCoordinator(viewModelFactory: self.vcFactory)
            case .hourSummaryViewModel:
            result = HourSummaryCoordinator(viewModelFactory: self.vcFactory)
        }
        
        result.navigationController = self.navigationController
        result.coordinator = self
        
        return result
    }
    
    func start() {
        self.navigationController?.isNavigationBarHidden = true
                
        self.children = [
            .onboarding : createCoordinator(type : .onboardingModel),
            .main : createCoordinator(type : .mainViewModel),
            .settings : createCoordinator(type: .settingsViewModel),
            .daySummary : createCoordinator(type: .daySummaryViewModel(nil, nil)),
            .hourSummary : createCoordinator(type: .hourSummaryViewModel(nil, nil))
        ]
        
        self.children?[.onboarding]?.start()
    }
    
    init(viewModelFactory : ViewModelFactory) {
        vcFactory = viewModelFactory
    }
}


