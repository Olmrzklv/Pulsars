//
//  PulsarDatasourceTests.swift
//  PulsarDatasourceTests
//
//  Created by EsmaGO on 11/7/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import XCTest
@testable import PulsarDatasource

class PulsarDatasourceTests: XCTestCase, PulsarDatasource {
    
    static let pulsars:[(name: String, RAJ: String, DECJ: String, frequency: Double)] = [
        ("J0006+1834", "00:06:04.8", "+18:34:59", 1.441446282),
        ("J0007+7303", "00:07:01.7", "+73:03:07.4", 3.165827392),
        ("B0021-72C", "00:23:50.35311", "-72:04:31.4926", 173.708219),
        ("B0021-72F", "00:24:03.8539", "-72:04:42.8065", 381.1586637),
        ("J0024-7204Y", "00:24:05.67", "-72:04:52.62", 455.236586),
        ("J1902-5105", "19:02:05", "-51:09:43", 574.712644),
        ("J0034-0534", "00:34:21.8281", "-05:34:36.62", 532.7134297),
    ]

    func testPulsarWithFrequencyRangePerformance() {
        self.measure {
            let _ = Datasource.pulsarWithFrequencyRange(min: 20, max: 1000)
        }
    }
    
    // tests that pulsarWithFrequencyRange(min:Double, max:Double) -> [Pulsar] works right.
    func testPulsarWithFrequencyRange() {
        var audibles = PulsarDatasourceTests.pulsarWithFrequencyRange(min:150, max:1000)
        XCTAssert(audibles.count == 5)
        audibles = PulsarDatasourceTests.pulsarWithFrequencyRange(min: 0, max: 150)
        XCTAssert(audibles.count == 2)
    }
 
}
