//
//  Design.swift
//  SocialMedia
//
//  Created by ABDELRAHMAN ALHAJ HUSSEIN on 10/14/17.
//  Copyright © 2017 OrderEra. All rights reserved.
//

import UIKit
import Foundation

class Design: NSObject {
    
    class func setupViewCorners(view: UIView, corners: UIRectCorner) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = view.frame
        rectShape.position = view.center
        rectShape.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: 20, height: 20)).cgPath
        view.layer.mask = rectShape
    }
}
