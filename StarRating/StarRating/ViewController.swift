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
        updateViews(number: 1)
    }
    
    @IBAction func updateRating(_ sender: StarRating) {
        let value = sender.value
        updateViews(number: value)
    }
    
    func updateViews(number: Int) {
        switch number {
        case 1:
            navigationItem.title = "User Rating: \(number) Star"
            view.backgroundColor = .white
        case 5:
            navigationItem.title = "User Rating: \(number) Stars"
            view.backgroundColor = .yellow
        default:
            navigationItem.title = "User Rating: \(number) Stars"
            view.backgroundColor = .white
        }
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

}

