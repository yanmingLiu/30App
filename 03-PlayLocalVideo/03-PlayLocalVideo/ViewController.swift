//
//  ViewController.swift
//  03-PlayLocalVideo
//
//  Created by lym on 2021/4/1.
//

import AVFoundation
import AVKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableview: UITableView!

    var data = [
        Video(image: "videoScreenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30"),
    ]

    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
    }
    
    @IBAction func play(_ sender: Any) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let video = data[indexPath.row]

        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source

        return cell
    }
}
