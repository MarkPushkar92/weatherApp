//
//  perHourView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 08.02.2022.
//

import Foundation
import UIKit

// completed view

class PerHourView : UIView {
    
    //MARK: PROPERTIES
    
    private lazy var weatherItemsCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(PerHourCell.self,
                      forCellWithReuseIdentifier: String(describing: PerHourCell.self))
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Layout SetUp
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(weatherItemsCollection)
        let constraints = [
            weatherItemsCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            weatherItemsCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            weatherItemsCollection.topAnchor.constraint(equalTo: self.topAnchor),
            weatherItemsCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: INIT

    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for PerHourDataView")
    }
}

//MARK: EXTENSIONS

extension PerHourView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = weatherItemsCollection.cellForItem(at: indexPath) as? PerHourCell {
            cell.isCellSelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = weatherItemsCollection.cellForItem(at: indexPath) as? PerHourCell {
            cell.isCellSelected = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        weatherItemsCollection.dequeueReusableCell(withReuseIdentifier:
                                                String(describing: PerHourCell.self),
                                              for: indexPath) as! PerHourCell

        return cell
    }
}

extension PerHourView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

