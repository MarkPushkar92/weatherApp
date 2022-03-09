//
//  SunAndMoonDetailsView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 20.02.2022.
//

import Foundation
import UIKit

// completed view

class SunAndMoonDetailsView : UIView {
    
    //MARK: Private UI Properties
    
    private let sunMoonLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "Солнце и Луна"
        return view
    }()
    
    private let fullMoonLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14)
        view.text = "Полнолуние"
        return view
    }()
    
    private let blueCircleImage : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "blue_circle")
        return view
    }()
    
    private let sunImageView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "sunny")
        return view
    }()
    
    private let sunDurationLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "14ч 27мин"
        return view
    }()
    
    private let sunriseLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Восход"
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        return view
    }()
    
    private let column1Row2RightLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "05:19"
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    private let column0Row1RightLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "05:19"
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    
    private let sunSetLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Заход"
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        return view
    }()
    
    private let column0Row2RightLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "05:19"
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    private let moonImageView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "moon")
        return view
    }()
    
    private let moonDurationLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "14ч 27мин"
        return view
    }()
    
    private let moonRiseLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Восход"
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        return view
    }()
    
    private let column1Row1RightLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "05:19"
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()

    private let moonSetLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Заход"
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        return view
    }()
    
    //MARK: Setting Up table props.
    
    private let column0View : UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let column1View : UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let columnDevisionView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tableColumnView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    private let column0Row0View : UIView = {
        let view = UIView()
        return view
    }()

    private let column0Row1View : UIView = {
        let view = UIView()
        return view
    }()

    private let column0Row2View : UIView = {
        let view = UIView()
        return view
    }()

    private let column1Row0View : UIView = {
        let view = UIView()
        return view
    }()

    private let column1Row1View : UIView = {
        let view = UIView()
        return view
    }()

    private let column1Row2View : UIView = {
        let view = UIView()
        return view
    }()

    
    //MARK: Accesseble UI Properties
    
    var sunDurationTime : String {
        get {
            return sunDurationLabel.text ?? ""
        }
        
        set(newValue) {
            sunDurationLabel.text = newValue
        }
    }

    var sunRiseTime : String {
        get {
            return column0Row1RightLabel.text ?? ""
        }
        
        set(newValue) {
            column0Row1RightLabel.text = newValue
        }
    }

    var sunSetTime : String {
        get {
            return column0Row2RightLabel.text ?? ""
        }
        
        set(newValue) {
            column0Row2RightLabel.text = newValue
        }
    }
    
    var moonDurationTime : String {
        get {
            return moonDurationLabel.text ?? ""
        }
        
        set(newValue) {
            moonDurationLabel.text = newValue
        }
    }

    var moonRise : String {
        get {
            return column1Row1RightLabel.text ?? ""
        }
        
        set(newValue) {
            column1Row1RightLabel.text = newValue
        }
    }

    var moonSet : String {
        get {
            return column1Row2RightLabel.text ?? ""
        }
        
        set(newValue) {
            column1Row2RightLabel.text = newValue
        }
    }

    //MARK: Views and layOut SetUp

    private func setupTableColumns() {
        addSubview(tableColumnView)

        tableColumnView.addArrangedSubview(column0View)
        tableColumnView.addArrangedSubview(columnDevisionView)
        tableColumnView.addArrangedSubview(column1View)

        column0View.addArrangedSubview(column0Row0View)
        column0View.addArrangedSubview(column0Row1View)
        column0View.addArrangedSubview(column0Row2View)

        column1View.addArrangedSubview(column1Row0View)
        column1View.addArrangedSubview(column1Row1View)
        column1View.addArrangedSubview(column1Row2View)

        let constraints = [
            tableColumnView.topAnchor.constraint(equalTo: sunMoonLabel.bottomAnchor),
            tableColumnView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableColumnView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableColumnView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            column0View.widthAnchor.constraint(equalTo: column1View.widthAnchor),
            columnDevisionView.widthAnchor.constraint(equalToConstant: 1)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupHeader() {
        
        addSubview(sunMoonLabel)
        addSubview(fullMoonLabel)
        addSubview(blueCircleImage)
        
        let constraints = [
            sunMoonLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            sunMoonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            sunMoonLabel.heightAnchor.constraint(equalToConstant: 22),
            
            fullMoonLabel.topAnchor.constraint(equalTo: sunMoonLabel.topAnchor),
            fullMoonLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            fullMoonLabel.heightAnchor.constraint(equalToConstant: 20),
            
            blueCircleImage.centerYAnchor.constraint(equalTo: fullMoonLabel.centerYAnchor),
            blueCircleImage.trailingAnchor.constraint(equalTo: fullMoonLabel.leadingAnchor, constant: -4),
            blueCircleImage.heightAnchor.constraint(equalToConstant: 8),
            blueCircleImage.widthAnchor.constraint(equalToConstant: 8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureColumn0Row0() {
        column0Row0View.addSubview(sunImageView)
        column0Row0View.addSubview(sunDurationLabel)
        
        let constraints = [
            sunImageView.leadingAnchor.constraint(equalTo: column0Row0View.leadingAnchor, constant: 10),
            sunImageView.widthAnchor.constraint(equalToConstant: 20),
            sunImageView.heightAnchor.constraint(equalToConstant: 24),
            sunImageView.centerYAnchor.constraint(equalTo: column0Row0View.centerYAnchor),
            
            sunDurationLabel.topAnchor.constraint(equalTo: column0Row0View.topAnchor),
            sunDurationLabel.bottomAnchor.constraint(equalTo: column0Row0View.bottomAnchor),
            sunDurationLabel.trailingAnchor.constraint(equalTo: column0Row0View.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureColumn0Row1() {
        column0Row1View.addSubview(sunriseLabel)
        column0Row1View.addSubview(column0Row1RightLabel)
        
        let constraints = [
            sunriseLabel.leadingAnchor.constraint(equalTo: column0Row1View.leadingAnchor, constant: 10),
            sunriseLabel.centerYAnchor.constraint(equalTo: column0Row1View.centerYAnchor),
            
            column0Row1RightLabel.centerYAnchor.constraint(equalTo: column0Row1View.centerYAnchor),
            column0Row1RightLabel.trailingAnchor.constraint(equalTo: column0Row1View.trailingAnchor, constant: -10)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureColumn0Row2() {
        column0Row2View.addSubview(sunSetLabel)
        column0Row2View.addSubview(column0Row2RightLabel)
        
        let constraints = [
            sunSetLabel.leadingAnchor.constraint(equalTo: column0Row2View.leadingAnchor, constant: 10),
            sunSetLabel.centerYAnchor.constraint(equalTo: column0Row2View.centerYAnchor),
            
            column0Row2RightLabel.centerYAnchor.constraint(equalTo: column0Row2View.centerYAnchor),
            column0Row2RightLabel.trailingAnchor.constraint(equalTo: column0Row2View.trailingAnchor, constant: -10)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureColumn0() {
        configureColumn0Row0()
        configureColumn0Row1()
        configureColumn0Row2()
    }

    private func configureColumn1Row0() {
        column1Row0View.addSubview(moonImageView)
        column1Row0View.addSubview(moonDurationLabel)
        
        let constraints = [
            moonImageView.leadingAnchor.constraint(equalTo: column1Row0View.leadingAnchor, constant: 10),
            moonImageView.widthAnchor.constraint(equalToConstant: 20),
            moonImageView.heightAnchor.constraint(equalToConstant: 24),
            moonImageView.centerYAnchor.constraint(equalTo: column1Row0View.centerYAnchor),
            
            moonDurationLabel.topAnchor.constraint(equalTo: column1Row0View.topAnchor),
            moonDurationLabel.bottomAnchor.constraint(equalTo: column1Row0View.bottomAnchor),
            moonDurationLabel.trailingAnchor.constraint(equalTo: column1Row0View.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    private func configureColumn1Row1() {
        column1Row1View.addSubview(moonRiseLabel)
        column1Row1View.addSubview(column1Row1RightLabel)
        
        let constraints = [
            moonRiseLabel.leadingAnchor.constraint(equalTo: column1Row1View.leadingAnchor, constant: 10),
            moonRiseLabel.centerYAnchor.constraint(equalTo: column1Row1View.centerYAnchor),
            
            column1Row1RightLabel.centerYAnchor.constraint(equalTo: column1Row1View.centerYAnchor),
            column1Row1RightLabel.trailingAnchor.constraint(equalTo: column1Row1View.trailingAnchor, constant: -10)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func configureColumn1Row2() {
        column1Row2View.addSubview(moonSetLabel)
        column1Row2View.addSubview(column1Row2RightLabel)
        
        let constraints = [
            moonSetLabel.leadingAnchor.constraint(equalTo: column1Row2View.leadingAnchor, constant: 10),
            moonSetLabel.centerYAnchor.constraint(equalTo: column1Row2View.centerYAnchor),
            
            column1Row2RightLabel.centerYAnchor.constraint(equalTo: column1Row2View.centerYAnchor),
            column1Row2RightLabel.trailingAnchor.constraint(equalTo: column1Row2View.trailingAnchor, constant: -10)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }

    private func configureColumn1() {
        configureColumn1Row0()
        configureColumn1Row1()
        configureColumn1Row2()
    }

    private func setupView() {
        setupHeader()
        
        setupTableColumns()
        
        configureColumn0()
        
        configureColumn1()
    }
    
    //MARK: Init
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented for SunAndMoonDetailsView")
    }
}

