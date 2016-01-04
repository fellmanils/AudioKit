//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
//:
//: ---
//:
//: ## AKDynamicsProcessor
//: ### Add description
import XCPlayground
import AudioKit

let audiokit = AKManager.sharedInstance

let bundle = NSBundle.mainBundle()
let file = bundle.pathForResource("mixloop", ofType: "wav")
var player = AKAudioPlayer(file!)
player.looping = true
var dynamicsProcessor = AKDynamicsProcessor(player)

//: Set the parameters of the dynamics processor here
dynamicsProcessor.threshold = -20 // dB
dynamicsProcessor.headRoom = 5 // dB
dynamicsProcessor.expansionRatio = 2 // rate
dynamicsProcessor.expansionThreshold = 2 // rate
dynamicsProcessor.attackTime = 0.001 // secs
dynamicsProcessor.releaseTime = 0.05 // secs
dynamicsProcessor.masterGain = 0 // dB
dynamicsProcessor.compressionAmount = 0 // dB
dynamicsProcessor.inputAmplitude = 0 // dB
dynamicsProcessor.outputAmplitude = 0 // dB

audiokit.audioOutput = dynamicsProcessor
audiokit.start()

player.play()

//: Toggle processing on every loop
AKPlaygroundLoop(every: 3.428) { () -> () in
    if dynamicsProcessor.isBypassed {
        dynamicsProcessor.start()
    } else {
        dynamicsProcessor.bypass()
    }
    dynamicsProcessor.isBypassed ? "Bypassed" : "Processing" // Open Quicklook for this
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
