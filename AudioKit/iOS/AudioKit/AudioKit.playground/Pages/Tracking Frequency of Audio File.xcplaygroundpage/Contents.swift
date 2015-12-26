//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
//:
//: ---
//:
//: ## Tracking Frequency of an Audio File
//: ### Here is a more real-world example of tracking the pitch of an audio stream
x
//: Standard imports and AudioKit setup:
import XCPlayground
import AudioKit

let audiokit = AKManager.sharedInstance

let bundle = NSBundle.mainBundle()
let file = bundle.pathForResource("leadloop", ofType: "wav")

var player = AKAudioPlayer(file!)
player.looping = true

let tracker = AKFrequencyTracker(player, minimumFrequency: 400, maximumFrequency: 600)

audiokit.audioOutput = tracker
audiokit.start()
player.play()

//: And here's where we monitor the results of tracking the amplitude.
let updater = AKPlaygroundLoop(every: 0.1) {
    let amp = tracker.amplitude
    let freq = tracker.frequency
    
}

//: This keeps the playground running so that audio can play for a long time
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)