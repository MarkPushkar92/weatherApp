//
//  PerDayAreaView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 08.02.2022.
//

import Foundation
import UIKit

// completed view

class PerDayAreaView : UIView {
    
    //MARK: Collection prop
    
    private lazy var dayItemsCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(WeatherPerDayCell.self,
                      forCellWithReuseIdentifier: String(describing: WeatherPerDayCell.self))
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Model Data
    
    private var modelData : [UiPerDayCollectionDataItem] = []
    
    func updateWithModelData(data : [UiPerDayCollectionDataItem]) {
        modelData = data
        dayItemsCollection.reloadData()
    }
    
    //MARK: LayOut SetUp
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(dayItemsCollection)
        let constraints = [
            dayItemsCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            dayItemsCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            dayItemsCollection.topAnchor.constraint(equalTo: self.topAnchor),
            dayItemsCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Init
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for PerDayAreaView")
    }
}

//MARK: Extensions

extension PerDayAreaView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelData.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        dayItemsCollection.dequeueReusableCell(withReuseIdentifier: String(describing: WeatherPerDayCell.self), for: indexPath) as! WeatherPerDayCell

        
        let modelItem = modelData[indexPath.row]
        let loc = Localization.localizedString(key: modelItem.description)
        cell.calendarDate = modelItem.calendarDate
        cell.humidity = modelItem.humidity
        cell.forecastTemperature = modelItem.forecastTemperature
        cell.forecastDescription = loc
        return cell
    }
}

extension PerDayAreaView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width-32, height: 56)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

