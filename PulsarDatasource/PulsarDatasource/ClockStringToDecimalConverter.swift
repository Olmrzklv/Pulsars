//
//  ClockStringToDecimalConverter.swift
//  PulsarDatasource
//
//  Created by EsmaGO on 11/24/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import Foundation

protocol ClockStringToDecimalConverter {
    func convert(clock: String) -> Float
}

extension ClockStringToDecimalConverter {
    /// Takes a clock format  string, "degrees: minutes: seconds" e.g. "+18:34:59" and converts it to a Float value.
    func convert(clock: String) -> Float {
        var clock = clock
        var alpha: Float = 0.0
        
        if clock[clock.startIndex] == "+" {
           clock = clock.replacingOccurrences(of: "+", with: "")
        }
        
        let clockArray: [String] = clock.components(separatedBy: ":")
        for i in 0...(clockArray.count - 1) {
           if let clockNumber = NumberFormatter().number(from: clockArray[i]) {
               alpha = alpha + abs(clockNumber.floatValue) / powf(60, Float(i))
           }
        }
        
        if clock[clock.startIndex] == "-" {
              alpha = -alpha
        }
        return alpha
    }
}
