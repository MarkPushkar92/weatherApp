//
//  MainScreenView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 05.02.2022.
//

import Foundation
import UIKit

// completed view

class MainScreenView: UIView {
    
    //MARK: UI Handler properties
    
    public var menuClicker : UiViewClickHandler?
    public var dailyClicker : UiViewClickHandler?
    public var detailedDayClicker : UiViewClickHandler?
    public var updateWeatherDataRequestClicker : UiUpdateWithWeatherDataRequestHandler?
    public var addLocationClickHandler : UiViewClickHandler?
    
    //MARK: Geo positioning properties
    
    var availableGeoPoints : Int {
        get {
            return navigationArea.currentGeoPoints.count
        }
    }
    
    var currentGeoPoint : String {
        get {
            return navigationArea.currentGeoPoint
        }
    }
    
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
    
    private lazy var navigationArea : NavigationView = {
        let view = NavigationView(viewFrame: .zero)
        view.menuClickHandler = { [weak self] in
            self?.menuClicker?()
        }
        
        view.addLocationClickHandler = { [weak self] in
            self?.addLocationClickHandler?()
        }
        
        view.updateWeatherDataRequestHandler = { [weak self] pointName in
            self?.updateWeatherDataRequestClicker?(pointName)
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        
        let leftSwipe = UISwipeGestureRecognizer()
        leftSwipe.direction = .left
        leftSwipe.addTarget(self, action: #selector(leftSwipeHandler))

        let rightSwipe = UISwipeGestureRecognizer()
        rightSwipe.direction = .right
        rightSwipe.addTarget(self, action: #selector(rightSwipeHandler))

        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
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
        let view = PerDayHeaderAreaView(viewFrame: .zero)
        view.perDayDetailsHandler = { [weak self] in
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
    
    private let dayDisplayView : DayDisplayView = {
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
        
    private let perHourDataView : PerHourDataView = {
        let view = PerHourDataView(viewFrame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let perDayAreaView : PerDayAreaView = {
        let view = PerDayAreaView(viewFrame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addLocationImageView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "plus")
        view.contentMode = .scaleAspectFit
        view.tintColor = .black
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(plusImageViewClickHandler))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    //MARK: OTHER METHOGS
    
    func addNewCity(cityName : String) {
        var geoCoords = navigationArea.currentGeoPoints
        if !geoCoords.contains(cityName) {
            geoCoords.append(cityName)
            navigationArea.currentGeoPoints = geoCoords
        }
    }
    
    @objc private func leftSwipeHandler() {
        navigationArea.handleLeftSwipe()
    }

    @objc private func rightSwipeHandler() {
        navigationArea.handleRightSwipe()
    }
    
    @objc private func plusImageViewClickHandler() {
        addLocationClickHandler?()
    }
    
    func applyModelData(dataForUi : [UiPerDayCollectionDataItem]) {
        perDayAreaView.updateWithModelData(data: dataForUi)
    }
    
    func applyModelData(dataForUi : [UiPerHourCollectionDataItem]) {
        perHourDataView.updateWithModelData(data: dataForUi)
    }
    
    func applyModelData(dataForUi : UiWeatherDataOneDay) {
        dayDisplayView.sunriseTime = dataForUi.sunriseTime
        dayDisplayView.sunsetTime = dataForUi.sunsetTime
        dayDisplayView.calendarTime = dataForUi.dayTimePeriod
        dayDisplayView.feelsLikeTemperature = dataForUi.feelsLikeTemperature
        dayDisplayView.currentTemperature = dataForUi.temperature
        dayDisplayView.forecastDescription = dataForUi.description
        dayDisplayView.clouds = dataForUi.clouds
        dayDisplayView.wind = dataForUi.windSpeed
        dayDisplayView.percipitation = dataForUi.humidity
    }
    
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
            
    private func setupViewsForAvailableGeoPoints(initialGeoPoints : [String]) {
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
        navigationArea.currentGeoPoints = initialGeoPoints
    }
    
    private func setupViewsForNonAvailableGeoPoints() {
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        setupScrollView()
        scrollViewContainer.addArrangedSubview(headerArea)
        scrollViewContainer.addArrangedSubview(addLocationImageView)
        let constraints = [
            headerArea.heightAnchor.constraint(equalToConstant: 55+37),
            addLocationImageView.heightAnchor.constraint(equalToConstant: 192)
        ]
        NSLayoutConstraint.activate(constraints)
                
        ViewFiller.fillAreaWithView(area: headerArea, filler: navigationArea)
    }
    
    private func setupViews(geoItems : [String]) {
    
        if geoItems.isEmpty {
            setupViewsForNonAvailableGeoPoints()
        } else {
            setupViewsForAvailableGeoPoints(initialGeoPoints: geoItems)
        }
    }
    
   
    //MARK: INIT
    
    init(viewFrame : CGRect, geoPoints : [String]) {
        super.init(frame: viewFrame)
        backgroundColor = .white
        setupViews(geoItems : geoPoints)
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for MainView")
    }
}
