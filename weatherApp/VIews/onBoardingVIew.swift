//
//  onBoardingVIew.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 01.02.2022.
//

import Foundation
import UIKit

// completed view

class OnBoardingView: UIView {
    
    //MARK: PROPERTIES
    
    public var trackGeoClicker : UiViewClickHandler?
    
    public var doNotTrackGeoClicker : UiViewClickHandler?

    @objc private func trackGeoHandler() {
        trackGeoClicker?()
        print("track1")
    }

    @objc private func doNotTrackGeoHandler() {
        doNotTrackGeoClicker?()
        print("track1 without current location")
    }

    private lazy var doNotTrackGeoButton : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentHorizontalAlignment = .right
        view.titleLabel?.numberOfLines = 1
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 16)
        view.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        view.addTarget(self, action: #selector(doNotTrackGeoHandler), for: .touchUpInside)
        return view
    }()
       
    private let trackGeoButton : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red : 0.949, green: 0.431, blue: 0.067, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 12)
        view.titleLabel?.numberOfLines = 1
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ УСТРОЙСТВА", for: .normal)
        view.addTarget(self, action: #selector(trackGeoHandler), for: .touchUpInside)
        return view
    }()

    private let firstLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.973, green: 0.961, blue: 0.961, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.11
        view.attributedText = NSMutableAttributedString(string: "Разрешить приложению Weather использовать данные \nо местоположении вашего устройства ", attributes: [NSAttributedString.Key.kern : 0.16, NSAttributedString.Key.paragraphStyle : paragraphStyle])
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        return view
    }()

    private let secondLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.21
        view.attributedText = NSMutableAttributedString(string: "Чтобы получить более точные прогнозы погоды во время движения или путешествия", attributes: [NSAttributedString.Key.kern : 0.14, NSAttributedString.Key.paragraphStyle : paragraphStyle])
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        return view
    }()

    private let thirdLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.21
        view.attributedText = NSMutableAttributedString(string: "Вы можете изменить свой выбор в любое время из меню приложения", attributes: [NSAttributedString.Key.kern : 0.28, NSAttributedString.Key.paragraphStyle : paragraphStyle])
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        return view
    }()

    
    private let onboardingImageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 8
        view.image = UIImage(named: "Onboarding")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
           
    private lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let imageP : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let contenP : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: VIEWS SETUP
    
    private func setupScrollView() {
        let constraints = [
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            ]
            
            NSLayoutConstraint.activate(constraints)
    }
        
    private func setupImageandContentPositioning() {
        let constraints = [
            imageP.heightAnchor.constraint(equalToConstant: 334 + 62),
            contenP.heightAnchor.constraint(equalToConstant: 350)
        ]
        NSLayoutConstraint.activate(constraints)
    }
        
    private func setupImage() {
        imageP.addSubview(onboardingImageView)
        let constraints = [
            onboardingImageView.topAnchor.constraint(equalTo: imageP.topAnchor, constant: 62),
            onboardingImageView.heightAnchor.constraint(equalToConstant: 334),
            onboardingImageView.leadingAnchor.constraint(equalTo: imageP.leadingAnchor, constant: 35.5),
            onboardingImageView.trailingAnchor.constraint(equalTo: imageP.trailingAnchor, constant : -35),
        ]
        constraints.forEach {
            $0.priority = .init(rawValue: 999)
        }
        NSLayoutConstraint.activate(constraints)
    }
         
    private func setupContent() {
        contenP.addSubview(firstLabel)
        contenP.addSubview(secondLabel)
        contenP.addSubview(thirdLabel)
        contenP.addSubview(trackGeoButton)
        contenP.addSubview(doNotTrackGeoButton)
            
        let constraints = [
            firstLabel.leadingAnchor.constraint(equalTo: contenP.leadingAnchor, constant: 19),
            firstLabel.trailingAnchor.constraint(equalTo: contenP.trailingAnchor, constant: -34),
            firstLabel.topAnchor.constraint(equalTo: contenP.topAnchor, constant: 10),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 20),
            secondLabel.leadingAnchor.constraint(equalTo: contenP.leadingAnchor, constant: 19),
            secondLabel.trailingAnchor.constraint(equalTo: contenP.trailingAnchor, constant: -42),
                
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 10),
            thirdLabel.leadingAnchor.constraint(equalTo: contenP.leadingAnchor, constant: 19),
            thirdLabel.trailingAnchor.constraint(equalTo: contenP.trailingAnchor, constant: -34),
                
            trackGeoButton.leadingAnchor.constraint(equalTo: contenP.leadingAnchor, constant: 17),
            trackGeoButton.trailingAnchor.constraint(equalTo: contenP.trailingAnchor, constant: -18),
            trackGeoButton.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 20),
            trackGeoButton.heightAnchor.constraint(equalToConstant: 40),
                
            doNotTrackGeoButton.leadingAnchor.constraint(equalTo: contenP.leadingAnchor, constant: 36),
            doNotTrackGeoButton.trailingAnchor.constraint(equalTo: contenP.trailingAnchor, constant: -17),
            doNotTrackGeoButton.heightAnchor.constraint(equalToConstant: 40),
            doNotTrackGeoButton.topAnchor.constraint(equalTo: trackGeoButton.bottomAnchor, constant: 20)
        ]
            
        constraints.forEach {
            $0.priority = .init(rawValue: 999)
        }
            
        NSLayoutConstraint.activate(constraints)
    }
        
    private func setupLayout() {
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(imageP)
        scrollViewContainer.addArrangedSubview(contenP)
        setupScrollView()
        setupImageandContentPositioning()
        setupImage()
        setupContent()
    }
            

    //MARK: INIT
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        self.backgroundColor = UIColor(named: "AppMainColor")
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented for OnBoardingView")
    }
    
}


