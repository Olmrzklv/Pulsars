//
//  EquatorialToSphericalConverterTests.swift
//  PulsarDatasourceTests
//
//  Created by EsmaGO on 11/24/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import XCTest
@testable import PulsarDatasource

class EquatorialToSphericalConverterTests: XCTestCase, EquatorialToSphericalConverter {

    func testCalculatePhi() {
        let hour: Float = 0.101333
        let phi = calculatePhi(with: hour)
        XCTAssertTrue(phi >= 0.0265289 && phi < 0.0265290)
        
        let hour2: Float = 11.1329
        let phi2 = calculatePhi(with: hour2)
        XCTAssertTrue(phi2 >= 2.91458 && phi2 < 2.91459)

    }

    func testCalculateTheta() {
        let degree: Float = -72.0784
        let theta = calculateTheta(with: degree)
        XCTAssertTrue(theta <= -1.25800 && theta > -1.25801)
        
        let degree2: Float = 78.3833
        let theta2 = calculateTheta(with: degree2)
        XCTAssertTrue(theta2 >= 1.36804 && theta2 < 1.36805)

    }
}
