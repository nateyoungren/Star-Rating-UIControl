//
//  ViewController.swift
//  StarRating
//
//  Created by Nathanael Youngren on 2/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavTitle(number: 1)
    }
    
    @IBAction func updateRating(_ sender: StarRating) {
        let value = sender.value
        updateNavTitle(number: value)
    }
    
    func updateNavTitle(number: Int) {
        if number != 1 {
            navigationItem.title = "User Rating: \(number) stars"
        } else {
            navigationItem.title = "User Rating: \(number) star"
        }
    }

}

