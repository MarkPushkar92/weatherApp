//
//  SettingsView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

import Foundation
import UIKit

// completed view

class SettingsView : UIView {
    
    //MARK: Images
    
    private let cloudImageOne : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "cloud1")
        view.alpha = 0.3
        return view
    }()
    
    private let cloudImageTwo : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "cloud2")
        return view
    }()

    private let cloudImageThree : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "cloud3")
        return view
    }()

    //MARK: Controll panel
    
    private let controlPanelItem : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red : 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let controlPanelItemHeader : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red : 0.153, green: 0.153, blue: 0.133, alpha: 1)
        view.font = UIFont.boldSystemFont(ofSize: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.7
        view.attributedText = NSMutableAttributedString(string: "Настройки",
                                                        attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
        return view
    }()
    
    //MARK: Button
    
    private lazy var applySettingsButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Установить", for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.949, green: 0.431, blue: 0.067, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(applySettingsButtonClicked), for:.touchUpInside)

        return button
   }()
    
    //MARK: StackViews
    
    private let settingsLabelsStackViewItem : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .vertical
        view.alignment = .center
        return view
    }()

    private let settingsItemsStackViewItem : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private lazy var windSpeedSwitchStack: UIStackView = {
        let userDefaults = UserDefaults.standard
        var index : Int = 0
        if userDefaults.object(forKey: UserDefaultsSettingsKeys.windSpeedSettings) != nil {
            index = userDefaults.bool(forKey: UserDefaultsSettingsKeys.windSpeedSettings) ? 0 : 1
        }

        return SettingItemFactory.createControlItem(leftLabel: "Mi",
                                                    rightLabel: "Km",
                                                    selectedIndex: index,
                                                    target: self,
                                                    handler: #selector(windSpeedControlValueChanged))
    }()
    
    private lazy var temperatureSwitchStack: UIStackView = {
        let userDefaults = UserDefaults.standard
        var index : Int = 0
        if userDefaults.object(forKey: UserDefaultsSettingsKeys.temperatureSettings) != nil {
            index = userDefaults.bool(forKey: UserDefaultsSettingsKeys.temperatureSettings) ? 0 : 1
        }

        return SettingItemFactory.createControlItem(leftLabel: "C",
                                                    rightLabel: "F",
                                                    selectedIndex: index,
                                                    target: self,
                                                    handler: #selector(temperatureControlValueChanged))
    }()
    
    private lazy var timeFormatSwitchStack: UIStackView = {
        let userDefaults = UserDefaults.standard
        var index : Int = 0
        if userDefaults.object(forKey: UserDefaultsSettingsKeys.timeFormatSettings) != nil {
            index = userDefaults.bool(forKey: UserDefaultsSettingsKeys.timeFormatSettings) ? 0 : 1
        }

        return SettingItemFactory.createControlItem(leftLabel: "12",
                                                    rightLabel: "24",
                                                    selectedIndex: index,
                                                    target: self,
                                                    handler: #selector(timeFormatControlValueChanged))
    }()
    
    private lazy var notificationSwitchStack: UIStackView = {
        let userDefaults = UserDefaults.standard
        var index : Int = 0
        if userDefaults.object(forKey: UserDefaultsSettingsKeys.notificationSettings) != nil {
            index = userDefaults.bool(forKey: UserDefaultsSettingsKeys.notificationSettings) ? 0 : 1
        }

        return SettingItemFactory.createControlItem(leftLabel: "On",
                                                    rightLabel: "Off",
                                                    selectedIndex: index,
                                                    target: self,
                                                    handler: #selector(notificationControlValueChanged))
    }()
    
    //MARK: Text labels
    
    private let temperatureLabel: UILabel = {
        return SettingItemFactory.createLabelItem(text: "Температура")
    }()
    
    private let windSpeedLabel: UILabel = {
        return SettingItemFactory.createLabelItem(text: "Скорость ветра")
    }()
    
    private let timeFormatLabel: UILabel = {
        return SettingItemFactory.createLabelItem(text: "Формат времени")
    }()
    
    private let notificationLabel: UILabel = {
        return SettingItemFactory.createLabelItem(text: "Уведомления")
    }()

    //MARK: Methods
    
    @objc private func temperatureControlValueChanged(_ sender: UISegmentedControl) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(sender.selectedSegmentIndex == 0, forKey: UserDefaultsSettingsKeys.temperatureSettings)
    }
    
    @objc private func windSpeedControlValueChanged(_ sender: UISegmentedControl) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(sender.selectedSegmentIndex == 0, forKey: UserDefaultsSettingsKeys.windSpeedSettings)
    }

    @objc private func timeFormatControlValueChanged(_ sender: UISegmentedControl) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(sender.selectedSegmentIndex == 0, forKey: UserDefaultsSettingsKeys.timeFormatSettings)
    }
    
    @objc private func notificationControlValueChanged(_ sender: UISegmentedControl) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(sender.selectedSegmentIndex == 0, forKey: UserDefaultsSettingsKeys.notificationSettings)
    }

    public var applySettingsHandler : UiViewClickHandler?
    
    @objc private func applySettingsButtonClicked() {
        applySettingsHandler?()
    }
    
    //MARK: Layout and Views Setup

    private func setupLayout() {
        self.addSubview(cloudImageOne)
        self.addSubview(cloudImageTwo)
        self.addSubview(cloudImageThree)
        self.addSubview(controlPanelItem)
        
        let constraints = [
            cloudImageOne.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 37),
            cloudImageOne.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -129),
            cloudImageOne.heightAnchor.constraint(equalToConstant: 58),
            cloudImageOne.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            
            cloudImageTwo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 121),
            cloudImageTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
            cloudImageTwo.heightAnchor.constraint(equalToConstant: 94),
            cloudImageTwo.widthAnchor.constraint(equalToConstant: 182),
            
            cloudImageThree.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cloudImageThree.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -95),
            cloudImageThree.widthAnchor.constraint(equalToConstant: 216),
            cloudImageThree.heightAnchor.constraint(equalToConstant: 65),
            
            controlPanelItem.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            controlPanelItem.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 241),
            controlPanelItem.widthAnchor.constraint(equalToConstant: 320),
            controlPanelItem.heightAnchor.constraint(equalToConstant: 330)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupControlPanelItem() {
        controlPanelItem.addSubview(controlPanelItemHeader)
        controlPanelItem.addSubview(settingsItemsStackViewItem)
        controlPanelItem.addSubview(settingsLabelsStackViewItem)
        controlPanelItem.addSubview(applySettingsButton)
        
        let constraints = [
            controlPanelItemHeader.widthAnchor.constraint(equalToConstant: 112),
            controlPanelItemHeader.heightAnchor.constraint(equalToConstant: 20),
            controlPanelItemHeader.leadingAnchor.constraint(equalTo: controlPanelItem.leadingAnchor, constant: 20),
            controlPanelItemHeader.topAnchor.constraint(equalTo: controlPanelItem.topAnchor, constant: 27),
            
            settingsLabelsStackViewItem.topAnchor.constraint(equalTo: controlPanelItemHeader.bottomAnchor, constant: 10),
            settingsLabelsStackViewItem.leadingAnchor.constraint(equalTo: controlPanelItem.leadingAnchor),
            settingsLabelsStackViewItem.widthAnchor.constraint(equalToConstant: 160),
            settingsLabelsStackViewItem.heightAnchor.constraint(equalToConstant: 220),
            
            settingsItemsStackViewItem.topAnchor.constraint(equalTo: controlPanelItemHeader.bottomAnchor, constant: 10),
            settingsItemsStackViewItem.trailingAnchor.constraint(equalTo: controlPanelItem.trailingAnchor),
            settingsItemsStackViewItem.widthAnchor.constraint(equalToConstant: 160),
            settingsItemsStackViewItem.heightAnchor.constraint(equalToConstant: 220),
            
            applySettingsButton.widthAnchor.constraint(equalToConstant: 250),
            applySettingsButton.heightAnchor.constraint(equalToConstant: 40),
            applySettingsButton.centerXAnchor.constraint(equalTo: controlPanelItem.centerXAnchor),
            applySettingsButton.bottomAnchor.constraint(equalTo: controlPanelItem.bottomAnchor, constant: -10)

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupControlPanelContent() {
        settingsLabelsStackViewItem.addArrangedSubview(temperatureLabel)
        settingsLabelsStackViewItem.addArrangedSubview(windSpeedLabel)
        settingsLabelsStackViewItem.addArrangedSubview(timeFormatLabel)
        settingsLabelsStackViewItem.addArrangedSubview(notificationLabel)
        
        settingsItemsStackViewItem.addArrangedSubview(temperatureSwitchStack)
        settingsItemsStackViewItem.addArrangedSubview(windSpeedSwitchStack)
        settingsItemsStackViewItem.addArrangedSubview(timeFormatSwitchStack)
        settingsItemsStackViewItem.addArrangedSubview(notificationSwitchStack)
    }
    
    private func setupViews() {
        self.layer.backgroundColor = UIColor(red : 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
                
        setupLayout()
        setupControlPanelItem()
        setupControlPanelContent()
    }
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for SettingsView")
    }
}

//MARK: Settings Item Factory

class SettingItemFactory {
    
    static func createControlItem(leftLabel : String,
                                  rightLabel : String,
                                  selectedIndex : Int,
                                  target : Any?,
                                  handler : Selector
                                ) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        
        let view = UISegmentedControl()
        view.selectedSegmentTintColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.setTitleTextAttributes(titleTextAttributes, for: .selected)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insertSegment(withTitle: leftLabel, at: 0, animated: false)
        view.insertSegment(withTitle: rightLabel, at: 1, animated: false)
        view.selectedSegmentIndex = selectedIndex
        view.setWidth(40, forSegmentAt: 0)
        view.setWidth(40, forSegmentAt: 1)
        view.addTarget(target, action: handler, for: .valueChanged)
                
        stackView.addArrangedSubview(view)
        return stackView
    }
    
    static func createLabelItem(text : String) -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = text
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = .gray
        return view
    }
}

