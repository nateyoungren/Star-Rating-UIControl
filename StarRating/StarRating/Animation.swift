//
//  Animation.swift
//  StarRating
//
//  Created by Nathanael Youngren on 2/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {

        UIView.animate(withDuration: 0.3, animations: {
            var t = CGAffineTransform.identity
            t = t.rotated(by: CGFloat.pi)
            t = t.scaledBy(x: 1.6, y: 1.6)
            self.transform = t
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
}
