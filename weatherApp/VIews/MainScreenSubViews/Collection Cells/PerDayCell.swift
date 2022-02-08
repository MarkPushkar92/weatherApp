//
//  PerDayCell.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 08.02.2022.
//

import Foundation
import UIKit

// completed view

class PerDayCell: UICollectionViewCell {
    
    //MARK: PROPERTIES
    
    private let cellArea : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        return view
    }()

    private let layoutView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.axis = .horizontal
        return view
    }()

    private let firstColumnStack : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        return view
    }()
    
    private let firstColumnFirstRow : UIView = {
        let view = UIView()
        return view
    }()

    private let firstColumnSecondRow : UIView = {
        let view = UIView()
        return view
    }()
    
    private let dateLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "17/04"
        return view
    }()
        
    private let feelsLikeImageStack : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 2
        return view
    }()
    
    private let feelsLikeImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "cloud.sun")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let feelsLikeImageStackLabel : UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.text = "57%"
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var dayDetailsButton : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle(">", for: .normal)
        view.addTarget(self, action: #selector(detailsButtonClicked), for: .touchUpInside)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private let forecastTempLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "4°-11°"
        return view
    }()
    
    private let forecastLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "Местами дождь"
        return view
    }()
    
    //MARK: PROPERTIES / subViewsAreas
    
    private let firstColumnArea : UIView = {
        let view = UIView()
        return view
    }()

    private let secondColumnArea : UIView = {
        let view = UIView()
        return view
    }()

    private let thirdColumnArea : UIView = {
        let view = UIView()
        return view
    }()

    private let fourthColumnArea : UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: LayoutSetUp
    
    private func setupfirstColumn() {
        ViewFiller.fillAreaWithView(area: firstColumnArea, filler: firstColumnStack)
        firstColumnStack.addArrangedSubview(firstColumnFirstRow)
        firstColumnStack.addArrangedSubview(firstColumnSecondRow)
        ViewFiller.fillAreaWithView(area: firstColumnFirstRow, filler: dateLabel)
        ViewFiller.fillAreaWithView(area: firstColumnSecondRow, filler: feelsLikeImageStack)
        feelsLikeImageStack.addArrangedSubview(feelsLikeImage)
        feelsLikeImageStack.addArrangedSubview(feelsLikeImageStackLabel)
    }

    private func setupForthColumn() {
        ViewFiller.fillAreaWithView(area: fourthColumnArea, filler: dayDetailsButton)
    }
    
    private func setupThirdColumn() {
        ViewFiller.fillAreaWithView(area: thirdColumnArea, filler: forecastTempLabel)
    }

    private func setupSecondColumn() {
        ViewFiller.fillAreaWithView(area: secondColumnArea, filler: forecastLabel)
    }

    private func setupLayoutAreas() {
        layoutView.addArrangedSubview(firstColumnArea)
        layoutView.addArrangedSubview(secondColumnArea)
        layoutView.addArrangedSubview(thirdColumnArea)
        layoutView.addArrangedSubview(fourthColumnArea)
        let constraints = [
            firstColumnArea.widthAnchor.constraint(equalToConstant: 60),
            thirdColumnArea.widthAnchor.constraint(equalToConstant: 60),
            fourthColumnArea.widthAnchor.constraint(equalToConstant: 20)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupLayoutView() {
        cellArea.addSubview(layoutView)
        let constraints = [
            layoutView.leadingAnchor.constraint(equalTo: cellArea.leadingAnchor),
            layoutView.trailingAnchor.constraint(equalTo: cellArea.trailingAnchor),
            layoutView.topAnchor.constraint(equalTo: cellArea.topAnchor),
            layoutView.bottomAnchor.constraint(equalTo: cellArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        setupLayoutAreas()
    }
    
    //MARK: BUTTONCLICKER / NOT NEEDED YET
    
    @objc private func detailsButtonClicked() {
        print("details button clicked")
    }
    
    //MARK: INIT
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        ViewFiller.fillAreaWithView(area: contentView, filler: cellArea)
        setupLayoutView()
        setupfirstColumn()
        setupSecondColumn()
        setupThirdColumn()
        setupForthColumn()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .white
    }
}



