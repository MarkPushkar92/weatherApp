//
//  SettingsCoordinator.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

// Completed File

import Foundation
import UIKit

class SettingsCoordinator : Coordinator, Coordinating {
    
    weak var coordinator: Coordinator?
    
    weak var navigationController: UINavigationController?
    
    private let viewModelFactory : ViewModelFactory
    
    private func handleSwitchFromMainViewToSettingsView() {
        
        let settingsController = viewModelFactory.createViewModel(with: .settingsViewModel, coordinator: self)
        
        navigationController?.pushViewController(settingsController, animated: true)
    }
    
    private func handlerSwitchToMainViewFromSettings() {
        navigationController?.popViewController(animated: true)
        if let vc = navigationController?.topViewController as? MainViewController{
            vc.refreshAfterSettingsChange()
        }
    }
    
    
    func processEvent(with type: CoordinatorEvent) {
        
        switch type {
        case .mainViewToSettingsViewEvent :
            handleSwitchFromMainViewToSettingsView()
            
        case .settingsViewToMainViewEvent :
            handlerSwitchToMainViewFromSettings()
        
        default :
            showCoordinatorAlert()
        }
    }
    
    func start() {}
    
    init(viewModelFactory : ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
}


