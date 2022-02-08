//
//  MainScreenView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 05.02.2022.
//

import Foundation
import UIKit

class MainScreenView: UIView {
    
    //MARK: PROPERTIES
    
    public var menuClicker : UiViewClickHandler?
    public var dailyClicker : UiViewClickHandler?
    public var detailedDayClicker : UiViewClickHandler?
    
    //MARK: ScrollView props
    
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
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: Navi
    
    private lazy var navigationArea : UIView = {
        let view = NavigationView(viewFrame: .zero)
        view.menuClicker = { [weak self] in
            self?.menuClicker?()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
            
    //MARK: main screen subViews - areas
    
    private let headerArea : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let dayDisplayArea : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private let perHourArea : UIView = {
        let view = UIView()
        return view
    }()

    private let perDayArea : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private let detailedFor24Area : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var DailyHeaderAreaView : UIView = {
        let view = DailyHeaderView(viewFrame: .zero)
        view.dailyDetailsClicker = { [weak self] in
            self?.dailyClicker?()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let perDayHeaderArea : UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: main screen subViews - views
    
    private let dayDisplayView : UIView = {
        let view = DayDisplayView(viewFrame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var gotoDetailed24View : UIView = {
        let view = DetailedDayView(viewFrame: .zero)
        view.dayDetailsHandler = { [weak self] in
            self?.detailedDayClicker?()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let perHourDataView : UIView = {
        let view = PerHourView(viewFrame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let perDayAreaView : UIView = {
        let view = PerDayView(viewFrame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: VIEWS SETUP
    
    private func setupViewAreas() {
        scrollViewContainer.addArrangedSubview(headerArea)
        scrollViewContainer.addArrangedSubview(dayDisplayArea)
        scrollViewContainer.addArrangedSubview(detailedFor24Area)
        scrollViewContainer.addArrangedSubview(perHourArea)
        scrollViewContainer.addArrangedSubview(perDayHeaderArea)
        scrollViewContainer.addArrangedSubview(perDayArea)

        let constraints = [
            headerArea.heightAnchor.constraint(equalToConstant: 55+37),
            dayDisplayArea.heightAnchor.constraint(equalToConstant: 212),
            detailedFor24Area.heightAnchor.constraint(equalToConstant: 40),
            perHourArea.heightAnchor.constraint(equalToConstant: 83),
            perDayHeaderArea.heightAnchor.constraint(equalToConstant: 40),
            perDayArea.heightAnchor.constraint(equalToConstant: 540)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupScrollView() {
        let constraints = [
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
            
    private func setupViews() {
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        setupScrollView()
        setupViewAreas()
        ViewFiller.fillAreaWithView(area: headerArea, filler: navigationArea)
        ViewFiller.fillAreaWithView(area: dayDisplayArea, filler: dayDisplayView)
        ViewFiller.fillAreaWithView(area: detailedFor24Area, filler: gotoDetailed24View)
        ViewFiller.fillAreaWithView(area: perHourArea, filler: perHourDataView)
        ViewFiller.fillAreaWithView(area: perDayHeaderArea, filler: DailyHeaderAreaView)
        ViewFiller.fillAreaWithView(area: perDayArea, filler: perDayAreaView)
    }
    
    //MARK: INIT
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        backgroundColor = .white
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for MainView")
    }
}
