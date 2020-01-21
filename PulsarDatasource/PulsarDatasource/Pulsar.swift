//
//  Pulsar.swift
//  PulsarDatasource
//
//  Created by EsmaGO on 11/8/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import UIKit

public class Pulsar {
    
    private static let R: Float = 9.80
    private var RAJ: String!
    private var DECJ: String
    
    public var name: String!
    public var frequency: Double!
    public var x: Float!
    public var y: Float!
    public var z: Float!
    public var color: UIColor!
    
    public init(name: String, RAJ: String, DECJ: String, frequency: Double) {
        self.name = name
        self.RAJ = RAJ
        self.DECJ = DECJ
        self.frequency = frequency
        self.color = .randomColor
        
        let theta = calculateTheta(with: convert(clock: DECJ))
        let phi = calculatePhi(with: convert(clock: RAJ))
        
        self.x = -Pulsar.R * cos(theta) * sin(phi)
        self.y = Pulsar.R * sin(theta)
        self.z = -Pulsar.R * cos(theta) * cos(phi)
    }
    
}

//MARK: - Helper functions
extension Pulsar: EquatorialToSphericalConverter { }
