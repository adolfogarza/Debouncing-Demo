//
//  DebouncedTableViewController.swift
//  Debouncing-Demo
//
//  Created by Adolfo Garza on 9/24/18.
//  Copyright © 2018 Adolfo Garza. All rights reserved.
//

import UIKit

class DebouncedTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var debounceSwitch: UISwitch!
    
    var countryArray: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        countryArray = Countries.generateCountryArray()
    }
}

extension DebouncedTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.customCell) {
            cell.textLabel?.text = countryArray[indexPath.row].name
            cell.textLabel?.textColor = .white
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            cell.backgroundColor = .clear
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.customCellHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !debounceSwitch.isOn {
            changeBackgroundColor()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if debounceSwitch.isOn {
            changeBackgroundColor()
        }
    }
    
    private func changeBackgroundColor() {
        if let visibleIndexPath = tableView.indexPathsForVisibleRows {
            let middleIndex = visibleIndexPath[(visibleIndexPath.count / 2)].row
            UIView.animate(withDuration: 0.10) { [weak self] in
                self?.view.backgroundColor = self?.countryArray[middleIndex].color
            }
        }
    }
}
