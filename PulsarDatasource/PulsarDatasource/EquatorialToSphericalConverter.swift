//
//  EquatorialToSphericalConverter.swift
//  PulsarDatasource
//
//  Created by EsmaGO on 11/24/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import Foundation

protocol EquatorialToSphericalConverter: ClockStringToDecimalConverter {
    func calculatePhi(with RAJ: Float) -> Float
    func calculateTheta(with DECJ: Float) -> Float
}

extension EquatorialToSphericalConverter {
    ///Takes the DECJ (Declination angle) in degrees,  converts it to radian.
    func calculateTheta(with DECJ: Float) -> Float {
        return DECJ * Float( Double.pi / 180)
    }
       
    ///Takes the RAJ (Right Ascension Angle)  in hours, converts it to radian.
    func calculatePhi(with RAJ: Float) -> Float {
        return RAJ * Float(Double.pi / 12)
    }
}

