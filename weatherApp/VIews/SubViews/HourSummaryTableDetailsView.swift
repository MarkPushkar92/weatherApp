//
//  HourSummaryTableDetailsView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

import Foundation
import UIKit

// completed view

class HourSummaryTableDetailsView : UIView {
    
    private var modelData = UiPerHourDetails()
    
    private let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func applyDataForView(uiData : UiPerHourDetails) {
        modelData = uiData
        tableView.reloadData()
    }
    
    //MARK: Setup Methods
    
    private func setupTableView() {
        tableView.register(HourDetailsTableCell.self, forCellReuseIdentifier: String(describing: HourDetailsTableCell.self))
        
        tableView.dataSource = self

        tableView.delegate = self
    }
    
    private func setupView() {
        backgroundColor = .red
        
        setupTableView()
        
        ViewFiller.fillAreaWithView(area: self, filler: tableView)
    }
    
    //MARK: Init
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented for HourSummaryTableDetailsView")
    }
}

//MARK: Extensions

extension HourSummaryTableDetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HourDetailsTableCell.self)) as! HourDetailsTableCell
        
        let dataItem = modelData.items[indexPath.section]
        cell.calendarDate = dataItem.calendarDate
        cell.dayTime = dataItem.dayTime
        cell.temperature = dataItem.temperature
        cell.temperatureDescription = dataItem.temperatureDescription
        cell.windDescription = dataItem.windDescription
        cell.humidity = dataItem.humidity
        cell.cloudy = dataItem.cloudy
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelData.items.count
    }
}

extension HourSummaryTableDetailsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow,
             indexPathForSelectedRow == indexPath {
             tableView.deselectRow(at: indexPath, animated: false)
             return nil
        }
        return indexPath
    }
}
