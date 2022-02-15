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
            self!.handleMainViewDisplay(mode: .withCurrentLocation)
         //   this.coordinator?.processEvent(with: .onboardingViewToMainViewEvent(.withCurrentLocation))
            print("track2")
        }
        
        onBoardingView.doNotTrackGeoClicker = { [weak self] in
            guard let this = self else {
                return
            }
            self!.handleMainViewDisplay(mode: .withoutCurrentLocation)
          //  this.coordinator?.processEvent(with: .onboardingViewToMainViewEvent(.withoutCurrentLocation))
            print("track2 without current location")
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

    //MARK: YOU'LL GOTTA DELETE DIS LATER
    
    private func handleMainViewDisplay(mode : OnboardingMode) {
        
        let viewModelFactory = ViewModelFactoryImpl()
        let mainCoord = MainCoordinator(viewModelFactory: viewModelFactory)
        
        let mainController = viewModelFactory.createViewModel(with: .mainViewModel, coordinator: mainCoord)
        if let vc = mainController as? MainViewController {
            vc.setupViewForMode(mode)
        }
        navigationController?.pushViewController(mainController, animated: true)
    }
    

}

