//
//  ClockStringToDecimalConverterTests.swift
//  PulsarDatasourceTests
//
//  Created by EsmaGO on 11/24/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import XCTest
@testable import PulsarDatasource

class ClockStringToDecimalConverterTests: XCTestCase, ClockStringToDecimalConverter {

    func testConvertClockStringToDecimal() {
        let clockString1 = "00:06:04.8"
        let decimal1 = convert(clock: clockString1)
        XCTAssert(decimal1 >= 0.101333 && decimal1 < 0.101334)
        
        let clockString2 = "-72:04:42.342"
        let decimal2 = convert(clock: clockString2)
        XCTAssert(decimal2 <= -72.0784  && decimal2 > -72.0785 )

        let clockString3 = "11:07:58.7"
        let decimal3 = convert(clock: clockString3)
        XCTAssert(decimal3 >= 11.1329  && decimal3 < 11.1330)

        let clockString4 = "+78:23"
        let decimal4 = convert(clock: clockString4)
        XCTAssert(decimal4 >= 78.3833 && decimal4 < 78.3834)

    }

}
