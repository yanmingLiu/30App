//
//  ViewController.swift
//  01-SimpleStopWatch
//
//  Created by lym on 2021/4/1.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter: Float = 0.0 {
        // 属性观察器
        didSet {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }
    
    var timer: Timer? = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 0.0
    }


    @IBAction func reset(_ sender: Any) {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func play(_ sender: Any) {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true

        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] (_) in
            self?.counter += 0.1
        }
        isPlaying = true
    }
    
    @IBAction func pause(_ sender: Any) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
    }
}

