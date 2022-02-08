//
//  PerHourCell.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 08.02.2022.
//

import Foundation
import UIKit

// completed view

class PerHourCell: UICollectionViewCell {
    
    //MARK: PROPERTIES
    
    var isCellSelected : Bool?
        
    private let itemsStack : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let cellArea : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    private let timeLabel : UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 11)
        view.text = "12:00"
        view.textAlignment = .center
        return view
    }()

    private let imageLabel : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "cloud.sun")
        return view
    }()
    
    private let tempLabel : UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 11)
        view.text = "13°"
        view.textAlignment = .center
        return view
    }()

    //MARK: LayOut SetUp
    
    private func setupViews() {
        contentView.addSubview(cellArea)
        let constraints = [
            cellArea.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellArea.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellArea.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellArea.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupItems() {
        cellArea.addSubview(itemsStack)
        let constraints = [
            itemsStack.topAnchor.constraint(equalTo: cellArea.topAnchor),
            itemsStack.leadingAnchor.constraint(equalTo: cellArea.leadingAnchor),
            itemsStack.trailingAnchor.constraint(equalTo: cellArea.trailingAnchor),
            itemsStack.bottomAnchor.constraint(equalTo: cellArea.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setItems() {
        itemsStack.addArrangedSubview(timeLabel)
        itemsStack.addArrangedSubview(imageLabel)
        itemsStack.addArrangedSubview(tempLabel)
    }
    
        
    //MARK: INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupItems()
        setItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .white
    }

}

