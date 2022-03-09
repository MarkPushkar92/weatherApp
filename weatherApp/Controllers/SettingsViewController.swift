//
//  SettingsViewController.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController, Coordinating {
    
    weak var coordinator: Coordinator?
    
    private func setupView() {
        let settingsView = SettingsView(viewFrame: self.view.frame)
        
        settingsView.applySettingsHandler = { [weak self] in
            self?.coordinator?.processEvent(with: .settingsViewToMainViewEvent)
        }
        
        self.view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
