//
//  StarRating.swift
//  StarRating
//
//  Created by Nathanael Youngren on 2/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class StarRating: UIControl {

    var value: Int = 1
    var labels: [UILabel] = []
    
    let componentDimension: CGFloat = 40
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        
        for n in 1...componentCount {
            
            let label = UILabel()
            label.tag = n
            
            let componentsWidth = Int(CGFloat(n - 1) * componentDimension)
            let xPosition = CGFloat(componentsWidth + (8 * n))
            
            print(xPosition)
            label.frame = CGRect(x: xPosition, y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "✶"
            label.textAlignment = .center
            
            if n == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }

}
