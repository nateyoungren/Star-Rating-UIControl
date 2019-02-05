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
    var oldValue: Int = 1
    
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
        
        self.backgroundColor = .clear
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(touch: touch)
        sendActions(for: [.valueChanged, .touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(touch: touch)
            sendActions(for: [.valueChanged, .touchDragInside])
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(touch: touch)
            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        self.oldValue = self.value
        
        for label in labels {
            
            if label.tag <= self.oldValue {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            if label.frame.contains(touchPoint) {
                self.value = label.tag
                label.performFlare()
                sendActions(for: .valueChanged)
            }
        }
    }
}
