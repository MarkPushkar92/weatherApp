//
//  MainCoordinator.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 09.02.2022.
//

// Completed File

import Foundation
import UIKit

class MainCoordinator : Coordinator, Coordinating {
    
    weak var coordinator: Coordinator?
    
    weak var navigationController: UINavigationController?
    
    private let viewModelFactory : ViewModelFactory
    
    private func handleMainViewDisplay(mode : OnboardingMode) {
        
        let mainController = viewModelFactory.createViewModel(with: .mainViewModel, coordinator: self)
        if let vc = mainController as? MainViewController {
            vc.setupViewForMode(mode)
        }
        navigationController?.pushViewController(mainController, animated: true)
    }
    
    func processEvent(with type: CoordinatorEvent) {
        switch type {
            case .mainViewToSettingsViewEvent,
                 .mainViewToDaySummaryViewEvent,
                 .mainViewToHourSummaryViewEvent:
                self.coordinator?.processEvent(with: type)
    
            case .onboardingViewToMainViewEvent(let onboardingMode):
            handleMainViewDisplay(mode: onboardingMode)
            default :
            showCoordinatorAlert()
        }
    }
    
    func start() {}
    
    init(viewModelFactory : ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
}
