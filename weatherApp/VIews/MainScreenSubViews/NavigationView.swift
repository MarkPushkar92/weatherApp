//
//  File.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 05.02.2022.
//

import Foundation
import UIKit

// completed view

class NavigationView : UIView {
    
    //MARK: PROPERTIES
    
    public var menuClicker : UiViewClickHandler?
    public var updateWeatherDataRequestHandler : UiUpdateWithWeatherDataRequestHandler?
    
    @objc private func menuButtonClickHandler() {
        menuClicker?()
    }
    
    @objc private func locationClicker() {
        print("location click")
    }
    
    private lazy var menuButton : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        view.addTarget(self, action: #selector(menuButtonClickHandler), for: .touchUpInside)
        view.tintColor = .black
        return view
    }()
    
    private lazy var locationButton : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "location"), for: .normal)
        view.addTarget(self, action: #selector(locationClicker), for: .touchUpInside)
        view.tintColor = .black
        return view
    }()

    private let currentLocationLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red : 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.text = "VDK, Russia"
        return view
    }()
    
    private let locationPageControl : UIPageControl = {
        let view = UIPageControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfPages = 2
        view.currentPage = 0
        view.tintColor = UIColor.black
        view.pageIndicatorTintColor = UIColor.black
        view.currentPageIndicatorTintColor = UIColor.green
        return view
    }()
    
    //MARK: GEOCOORDINATES PROPERTIES
    
    var currentGeoCoordinates : String {
        return currentGeoCoordinatestName
    }
    
    private var geoCoordinatesArray : [String] = []
    
    private var currentGeoCoordinatestName : String {
        get {
            return currentLocationLabel.text ?? ""
        }
        set(newValue) {
            currentLocationLabel.text = newValue
            updateWeatherDataRequestHandler?(newValue)
        }
    }
    
    public var currentGeoCoordinatesArray : [String] {
        get {
            return geoCoordinatesArray
        }
        
        set(newValue) {
            locationPageControl.numberOfPages = newValue.count
            geoCoordinatesArray = newValue
            currentGeoCoordinatestName = geoCoordinatesArray[locationPageControl.currentPage]
        }
    }
    
    //MARK: VIEWS SETUP
    
    private func setupViews() {
        self.addSubview(menuButton)
        self.addSubview(locationButton)
        self.addSubview(currentLocationLabel)
        self.addSubview(locationPageControl)
        
        let constraints = [
            menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            menuButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 43),
            menuButton.heightAnchor.constraint(equalToConstant: 18),
            menuButton.widthAnchor.constraint(equalToConstant: 34),
            
            locationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 43),
            locationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            locationButton.widthAnchor.constraint(equalToConstant: 20),
            locationButton.heightAnchor.constraint(equalToConstant: 26),
            
            currentLocationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 43),
            currentLocationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            locationPageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            locationPageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: INIT
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for NavigationView")
    }

}
