//
//  EmojiFilter.swift
//  SummerRoadTrip
//
//  Created by Ryan Belan on 6/13/20.
//  Copyright © 2020 University of Rochester. All rights reserved.
//

import UIKit

//This class supports button array with index
class EmojiFilter: UIButton {
    var index = 0
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.numberOfLines = 0
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
