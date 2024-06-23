

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player :  AVAudioPlayer?
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabrl: UILabel!
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 6]

    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    @IBAction func hardnesSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabrl.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer) ,userInfo:nil, repeats: true)
    }
        
    @objc func updateTimer()   {
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed)/Float(totalTime)
        
        }else{
            timer.invalidate()
            titleLabrl.text = "Done!"
        }
        
       
        }
        
    }

