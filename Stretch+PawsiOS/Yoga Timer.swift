//
//  Yoga Timer.swift
//  Stretch+PawsiOS
//
//  Created by Charlotte Lee on 31/1/22.
//

import Foundation
import AVFoundation

// What kind of data type should this be?
// A class(reference type -> an object somewhere) or struct(value types -> can be copied and shared)?
// Where does the timer need to be shared?

class YogaTimer: ObservableObject {
    
    // Timer states
    @Published var timerActive = false
    @Published var timerPaused = false
    @Published var timerEnded = false
    @Published var timerDuration = 30
    var yogaTimer = Timer()
    var audioPlayer: AVAudioPlayer?

    
    // Timer functionality
    
    // Start the timer
    func startTimer() {
        // Timer becomes active
        // Remove a second from the timer duration & loop over
        // If the timer gets to 0, stop the timer
        
        timerActive = true
        timerPaused = false
        timerEnded = false
        yogaTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
            self.timerDuration -= 1
            if self.timerDuration == 0 {
                self.stopTimer()
            }
        })
    }
    
    // Pause the timer
    func pauseTimer() {
        // Timer stops being active
        // Timer becomes paused
        // Timer stops running
        
        timerActive = false
        timerPaused = true
        yogaTimer.invalidate()
    }
 
    // End the timer
    func stopTimer() {
        // Play a sound
        // Timer has ended
        // Timer stop being active
        // Timer stops running
        // Timer duration resets ready for the next time we run it
        
        playSound(sound: "chime", type: "wav")
        timerEnded = true
        timerActive = false
        yogaTimer.invalidate()
        timerDuration = 30
    }
    
    // Play a sound
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }
    
    //Timer Styles
    
    func setTitleText() -> String {
        if timerEnded {
            return "You Did It!"
            } else {
            return "Hold That Pose"
        }
    }
    
    func setDescriptionText() -> String {
        if timerEnded {
            return "Purrrfect!"
        } else {
            return "Try staying in this pose for 30 seconds, if you need to come out sooner, that’s ok."
        }
    }
}


