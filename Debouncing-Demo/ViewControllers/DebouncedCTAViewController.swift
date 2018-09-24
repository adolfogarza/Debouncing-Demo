//
//  ViewController.swift
//  Debouncing-Demo
//
//  Created by Adolfo Garza on 9/24/18.
//  Copyright © 2018 Adolfo Garza. All rights reserved.
//

import UIKit

class DebouncedCTAViewController: UIViewController {
    
    var debouncedFunction: Debouncer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDebounceFunction()
    }
    
    private func setupDebounceFunction() {
        let debouncedScenario = Debouncer(delay: 0.50) { [weak self] in
            self?.changeBackgroundColor()
        }
        
        debouncedFunction = debouncedScenario
    }
    
    private func changeBackgroundColor() {
        UIView.animate(withDuration: 0.10) { [weak self] in
            self?.view.backgroundColor = RandomColor.generateRandomColor()
        }
    }
    
    @IBAction func didPressDebouncedButton(_ sender: Any) {
        debouncedFunction?.call()
    }
    
    @IBAction func didPressNormalButton(_ sender: Any) {
        changeBackgroundColor()
    }
}
