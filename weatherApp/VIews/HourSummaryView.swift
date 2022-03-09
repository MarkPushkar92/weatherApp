//
//  HourSummaryView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

import Foundation
import UIKit

// completed view

class HourSummaryView : UIView {
    
    //MARK: Return button handler
    
    public var returnButtonHandler : UiViewClickHandler?
    
    @objc private func returnButtonClicked() {
        returnButtonHandler?()
    }
    
    //MARK: ui handler
    
    func applyUiData(poiName : String?, uiData : UiPerHourDetailsData) {
        cityLabel.text = poiName
     //   apply graph view
        detailsTable.applyDataForView(uiData: uiData.details)
    }
    
    //MARK: scroll view
    
    private let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: views
    
    private lazy var returnButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1), for: .normal)
        button.tintColor = .black
        button.setTitle("← Прогноз на 24 часа", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(returnButtonClicked), for:.touchUpInside)
        return button
    }()

    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let detailsTable : HourSummaryTableDetailsView = {
        let view = HourSummaryTableDetailsView(viewFrame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let graphView : HourGraphView = {
        let view = HourGraphView(viewFrame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: views' areas
    
    private let backButtonArea : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private let cityLabelArea : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private let graphViewArea : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private let tableDetailsArea : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    //MARK: Layout
    
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

    
    private func setupViewAreas() {
        scrollViewContainer.addArrangedSubview(backButtonArea)
        scrollViewContainer.addArrangedSubview(cityLabelArea)
        scrollViewContainer.addArrangedSubview(graphViewArea)
        scrollViewContainer.addArrangedSubview(tableDetailsArea)
        
        let constraints = [
            backButtonArea.heightAnchor.constraint(equalToConstant: 20),
            cityLabelArea.heightAnchor.constraint(equalToConstant: 22),
            graphViewArea.heightAnchor.constraint(equalToConstant: 152),
            tableDetailsArea.heightAnchor.constraint(equalToConstant: 863)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func setupBackButton() {
        backButtonArea.addSubview(returnButton)
        
        let constraints = [
            returnButton.leadingAnchor.constraint(equalTo: backButtonArea.leadingAnchor, constant: 12),
            returnButton.bottomAnchor.constraint(equalTo: backButtonArea.bottomAnchor),
            returnButton.widthAnchor.constraint(equalToConstant: 200),
            returnButton.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupCityLabel() {
        cityLabelArea.addSubview(cityLabel)
        
        let constraints = [
            cityLabel.leadingAnchor.constraint(equalTo: cityLabelArea.leadingAnchor, constant: 16),
            cityLabel.bottomAnchor.constraint(equalTo: cityLabelArea.bottomAnchor),
            cityLabel.widthAnchor.constraint(equalToConstant: 155),
            cityLabel.heightAnchor.constraint(equalToConstant: 22)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupView() {
        backgroundColor = .white
        
        self.addSubview(scrollView)
        
        scrollView.addSubview(scrollViewContainer)

        setupScrollView()
        
        setupViewAreas()
        
        setupBackButton()
        
        setupCityLabel()
    
        ViewFiller.fillAreaWithView(area: graphViewArea, filler: graphView)
        
        ViewFiller.fillAreaWithView(area: tableDetailsArea, filler: detailsTable)
    }
    
    //MARK: Init
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for HourSummaryView")
    }
}

