//
//  OnBoardingCoordinator.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 09.02.2022.
//

// Completed File

import Foundation
import UIKit

class OnBoardingCoordinator : Coordinator, Coordinating {
    
    weak var coordinator: Coordinator?
    
    weak var navigationController: UINavigationController?
    
    private let viewModelFactory : ViewModelFactory
    
    func processEvent(with type: CoordinatorEvent) {
        switch type {
        case .onboardingViewToMainViewEvent :
            self.coordinator?.processEvent(with: type)
        default :
            showCoordinatorAlert()
        }
    }
    
    func start() {
        let onBoardingVC = viewModelFactory.createViewModel(with: .onboardingModel, coordinator: self)
        navigationController?.setViewControllers([onBoardingVC], animated: true)
    }
    
    init(viewModelFactory : ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
}

