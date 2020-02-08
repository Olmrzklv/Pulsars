//
//  AudioPlayer.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 2/8/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import AudioKit

class AudioPlayer {
    
    private var oscillator: AKOscillator?
    
    init() {
    }
    
    func play(with frequency: Double, amplitude: Double) {
        stop()
        oscillator = AKOscillator() // Create the sound generator
        AudioKit.output = oscillator    // Tell AudioKit what to output
        do {
            try AudioKit.start()    // Start up AudioKit.
        } catch {
            print("Failed starting the AudioKit")
        }
        oscillator?.frequency = frequency
        oscillator?.amplitude = amplitude
        oscillator?.start()    //Start the oscillator.

        
    }
    
    func stop() {
    
        oscillator?.stop()
        do {
            try AudioKit.stop() // Stop AudioKit.
        } catch {
            print("Failed starting the AudioKit")
        }
        
    }
}
