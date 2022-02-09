//
//  ViewController.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 01.02.2022.
//

import UIKit

class OnBoardingViewController: UIViewController, Coordinating {
    
    weak var coordinator: Coordinator? 

    private func setupView() {
        
        let onBoardingView = OnBoardingView(viewFrame: self.view.frame)
        onBoardingView.trackGeoClicker = { [weak self] in
            guard let this = self else {
                return
            }
            this.coordinator?.processEvent(with: .onboardingViewToMainViewEvent(.withCurrentLocation))
            print("track2")
        }
        
        onBoardingView.doNotTrackGeoClicker = { [weak self] in
            guard let this = self else {
                return
            }
            this.coordinator?.processEvent(with: .onboardingViewToMainViewEvent(.withoutCurrentLocation))
        }
        self.view = onBoardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let onBoardingView = OnBoardingView(viewFrame: self.view.frame)
//        view = onBoardingView
//    }


}

