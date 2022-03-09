//
//  DaySummarySelectorCell.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 20.02.2022.
//

import Foundation
import UIKit

//Completed View

class DaySummarySelectorCell: UICollectionViewCell {
    
    var dateLabelValue : String {
        get {
            return dateLabel.text ?? ""
        }
        
        set(newValue) {
            dateLabel.text = newValue
        }
    }
    
    private let cellArea : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()

    private let dateLabel : UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "16/04 ПТ"
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Layout
    
    private func setupViews() {
        ViewFiller.fillAreaWithView(area: contentView, filler: cellArea)
    }
        
    private func setItems() {
        ViewFiller.fillAreaWithView(area: cellArea, filler: dateLabel)
    }
    
    //MARK: Init, Reuse, isSelected
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setItems()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .white
    }
    
    private var isViewSelected : Bool = false
    var isCellSelected : Bool? {
        didSet {
            if let isSelected = isCellSelected {
                if isSelected && isViewSelected == false {
                    dateLabel.textColor = .white
                    cellArea.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
                    isViewSelected = true
                } else if isSelected == false && isViewSelected == true {
                    dateLabel.textColor = .black
                    cellArea.backgroundColor = .white
                    isViewSelected = false
                }
            }
        }
    }
}


