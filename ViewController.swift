//
//  ViewController.swift
//  OrchidApp
//
//  Created by Jade Meyer on 2/3/18.
//  Copyright © 2018 Jade Meyer. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var month: UILabel!
    @IBAction func goToday(_ sender: AnyObject) {
        let date = NSDate()
        calendarView.scrollToDate(date as Date)
        calendarView.selectDates([Date()])
    }
    
    let todaysDate = Date()

    let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.locale = Calendar.current.locale
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.reloadData(withanchor: Date())
        calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: true)
        calendarView.selectDates([Date()])
        calendarView.visibleDates { dateSegment in
            self.setupCalendarView(dateSegment: dateSegment)
        }
    }

    func setupCalendarView(dateSegment: DateSegmentInfo) {
        guard let date = dateSegment.monthDates.first?.date else { return }
        formatter.dateFormat = "MMM yyyy"
        month.text = formatter.string(from: date)
    }

    func configureCell(cell: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell  = cell as? CustomCell else { return }
        handleCellTextColor(cell: myCustomCell, cellState: cellState)
        handleCellVisibility(cell: myCustomCell, cellState: cellState)
        handleCellSelection(cell: myCustomCell, cellState: cellState)
    }
    func handleCellTextColor(cell: CustomCell, cellState: CellState) {
        cell.dateLabel.textColor = cellState.isSelected ? UIColor.red : UIColor.white
    }
    func handleCellVisibility(cell: CustomCell, cellState: CellState) {
        cell.isHidden = cellState.dateBelongsTo == .thisMonth ? false : true
    }
    func handleCellSelection(cell: CustomCell, cellState: CellState) {
        cell.selectedView.isHidden = cellState.isSelected ? false : true
    }
}

extension ViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // This function should have the same code as the cellForItemAt function
        let myCustomCell = cell as! CustomCell
        configureCell(cell: myCustomCell, cellState: cellState)
    }
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = formatter.date(from: "2018 12 31")!
        
        let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 5, calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfRow, firstDayOfWeek: .sunday, hasStrictBoundaries: true)
            return parameter
        }
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        configureCell(cell: cell, cellState: cellState)
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupCalendarView(dateSegment: visibleDates)
    }
}
