//
//  Pulsar.swift
//  PulsarDatasource
//
//  Created by EsmaGO on 11/8/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import UIKit

public struct Pulsar {
    var name: String!
    var RAJ: String!
    var DECJ: String
    var frequency: Double!
    var color: UIColor!
    
    private var theta: Float = 0.0
    private var phi: Float = 0.0
    
    var x: Float = 0.0
    var y: Float = 0.0
    var z: Float = 0.0
    
    private var R: Float = 9.80

    
    init(name: String, RAJ: String, DECJ: String, frequency: Double) {

        self.name = name
        self.RAJ = RAJ
        self.DECJ = DECJ
        self.frequency = frequency
    }
    
    
//    private func calculateTheta(with DECJ: String) -> Float {
//
//    }
}
