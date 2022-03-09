//
//  PerDayCell.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 08.02.2022.
//

import Foundation
import UIKit

//Completed View

class WeatherPerDayCell: UICollectionViewCell {
    
    //MARK: Public UI Properties
    
    public var forecastDescription : String {
        get {
            return forecastLabel.text ?? ""
        }
        
        set(newValue) {
            forecastLabel.text = newValue
        }
    }
    
    public var calendarDate : String {
        get {
            return dateLabel.text ?? ""
        }
        
        set(newValue) {
            dateLabel.text = newValue
        }
    }
    
    public var humidity : String {
        get {
            return percipitationLabel.text ?? ""
        }
        
        set(newValue) {
            percipitationLabel.text = newValue
        }
    }
    
    public var forecastTemperature : String {
        get {
            return forecastTemperatureLabel.text ?? ""
        }
        
        set(newValue) {
            forecastTemperatureLabel.text = newValue
        }
    }
    
    //MARK: Private UI Properties
    
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

    private let column0Stack : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        return view
    }()
    
    private let column0Row0 : UIView = {
        let view = UIView()
        return view
    }()

    private let column0Row1 : UIView = {
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
        
    private let imagePercipitationStack : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 2
        return view
    }()
    
    private let percipitationImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "cloud.sun")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let percipitationLabel : UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.text = "57%"
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private let column0Area : UIView = {
        let view = UIView()
        return view
    }()

    private let column1Area : UIView = {
        let view = UIView()
        return view
    }()

    private let column2Area : UIView = {
        let view = UIView()
        return view
    }()

    private let column3Area : UIView = {
        let view = UIView()
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
    
    private let forecastTemperatureLabel : UILabel = {
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
    
    @objc private func detailsButtonClicked() {
        print("details button clicked")
    }
    
    //MARK: Layout
    
    private func setupColumn0() {
        ViewFiller.fillAreaWithView(area: column0Area, filler: column0Stack)
        
        column0Stack.addArrangedSubview(column0Row0)
        column0Stack.addArrangedSubview(column0Row1)
        
        ViewFiller.fillAreaWithView(area: column0Row0, filler: dateLabel)
        ViewFiller.fillAreaWithView(area: column0Row1, filler: imagePercipitationStack)
                
        imagePercipitationStack.addArrangedSubview(percipitationImage)
        imagePercipitationStack.addArrangedSubview(percipitationLabel)
    }
    
    private func setupColumn1() {
        ViewFiller.fillAreaWithView(area: column1Area, filler: forecastLabel)
    }
    
    private func setupColumn2() {
        ViewFiller.fillAreaWithView(area: column2Area, filler: forecastTemperatureLabel)
    }
    
    private func setupColumn3() {
        ViewFiller.fillAreaWithView(area: column3Area, filler: dayDetailsButton)
    }

    private func setupLayoutAreas() {
        layoutView.addArrangedSubview(column0Area)
        layoutView.addArrangedSubview(column1Area)
        layoutView.addArrangedSubview(column2Area)
        layoutView.addArrangedSubview(column3Area)
        
        let constraints = [
            column0Area.widthAnchor.constraint(equalToConstant: 60),
            column2Area.widthAnchor.constraint(equalToConstant: 80),
            column3Area.widthAnchor.constraint(equalToConstant: 20)
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
            
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ViewFiller.fillAreaWithView(area: contentView, filler: cellArea)
        setupLayoutView()
        setupColumn0()
        setupColumn1()
        setupColumn2()
        setupColumn3()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .white
    }
}


