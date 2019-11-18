//
//  Pulsar.swift
//  PulsarDatasource
//
//  Created by EsmaGO on 11/8/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import UIKit

public class Pulsar {
    var name: String!
    var RAJ: String!
    var DECJ: String
    var frequency: Double!
    var x: Float!
    var y: Float!
    var z: Float!
    
    private let R: Float = 9.80
    
    var color: UIColor {
        return .randomColor
    }

    
    init(name: String, RAJ: String, DECJ: String, frequency: Double) {
        self.name = name
        self.RAJ = RAJ
        self.DECJ = DECJ
        self.frequency = frequency
        
        let theta = calculateTheta(with: DECJ)
        let phi = calculatePhi(with: RAJ)
        
        self.x = -R * cos(theta) * sin(phi)
        self.y = R * sin(theta)
        self.z = -R * cos(theta) * cos(phi)
    }
    
    
    private func calculateTheta(with DECJ: String) -> Float {
        var DEC = DECJ
        var theta: Float = 0.0
        
        if DEC[DEC.startIndex] == "+" {
            DEC = DEC.replacingOccurrences(of: "+", with: "")
        }
        let DECJcomponents: [String] = DEC.components(separatedBy: ":")
        
        for i in 0...(DECJcomponents.count - 1) {
            if let DECJnumber = NumberFormatter().number(from: DECJcomponents[i]) {
                let DECJFloat = DECJnumber.floatValue
                theta = theta + abs(DECJFloat) / Float(90) * Float(90) * Float( Double.pi / 2) / powf(60, Float(i))
            }
        }
        
        if DEC[DEC.startIndex] == "-" {
            theta = -theta
        }
        return theta
    }
    
    private func calculatePhi(with RAJ: String) -> Float {
        var phi: Float = 0.0
        let RAJarray: [String] = RAJ.components(separatedBy: ":")
        
        for i in 0...(RAJarray.count - 1) {
            if let RAJnumber = NumberFormatter().number(from: RAJarray[i]) {
                let RAJfloat = RAJnumber.floatValue
                phi = phi + abs(RAJfloat) / Float(90 / 15) * Float(Double.pi / 2) / powf(60, Float(i))
            }
        }
        
        if RAJ[RAJ.startIndex] == "-" {
            phi = -phi
        }
        return phi
    }
    
}
