//
//  ViewState.swift
//  StackViewDemo
//
//  Created by Alexander Kostiev on 10/21/17.
//  Copyright © 2017 Alexander Kostiev. All rights reserved.
//

import UIKit

struct ViewState: Equatable {
    var axis: UILayoutConstraintAxis = .horizontal
    var alignment: UIStackViewAlignment = .fill
    var distribution: UIStackViewDistribution = .fillEqually
    var spacing: CGFloat = 0.0
    var animated: Bool = true
    
    public static func ==(lhs: ViewState, rhs: ViewState) -> Bool {
        let axisEqual = (lhs.axis == rhs.axis)
        let alignmentEqual = (lhs.alignment == rhs.alignment)
        let distributionsEqual = (lhs.distribution == rhs.distribution)
        let spacingsEqual = (lhs.spacing == rhs.spacing)
        let animatedsEqual = (lhs.animated == rhs.animated)
        
        return axisEqual && alignmentEqual && distributionsEqual && spacingsEqual && animatedsEqual
    }
}
