//
//  CGFloatExtensions.swift
//  PulsarDatasource
//
//  Created by EsmaGO on 11/18/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
