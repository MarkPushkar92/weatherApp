//
//  ViewController.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 01.02.2022.
//

import UIKit

class OnBoardingViewController: UIViewController, Coordinating {
    
    weak var coordinator: Coordinator?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let onboardingView = OnBoardingView(viewFrame: .zero)
        onboardingView.trackGeoClicker = { [weak self] in
            self?.coordinator?.processEvent(with: .onboardingViewToMainViewEvent(.withCurrentLocation))
        }
        
        onboardingView.doNotTrackGeoClicker = { [weak self] in
            self?.coordinator?.processEvent(with: .onboardingViewToMainViewEvent(.withoutCurrentLocation))
        }
        
        self.view = onboardingView
    }
}



