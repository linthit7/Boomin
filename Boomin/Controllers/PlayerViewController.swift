//
//  ViewController.swift
//  Boomin
//
//  Created by Lin Thit Khant on 12/7/22.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var songs: [Song]?
    var songRow: Int?
    var inputCover: UIImage?
    var player: AVAudioPlayer?
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var coverView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverView.image = inputCover
        songLabel.text = songs![self.songRow!].name
        playSong(at: songRow!)
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        playOrStopSong(at: songRow!)
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
        
        skipSong(at: songRow!)
    }
    
    @IBAction func backwardButtonPressed(_ sender: UIButton) {
        
        rewindSong(at: songRow!)
    }
    
    
    func playSong(at row: Int) {
        let trackName = songs![row].trackName
        let url = Bundle.main.url(forResource: trackName, withExtension: "mp3")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            guard let player = player else {return}
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
        
    }
    
    func playOrStopSong(at row: Int) {
        let trackName = songs![row].trackName
        
        let url = Bundle.main.url(forResource: trackName, withExtension: "mp3")!
        
        if player?.isPlaying == true {
            player?.pause()
        } else {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
                
            } catch let error as NSError {
                print(error.description)
            }
        }
    }
    
    func skipSong(at row: Int) {
        var row = songRow! + 1
        
        if row < songs!.count {
            songRow = row
            playSong(at: row)
        } else {
            row = songs!.count - 1
            songRow = row
            playSong(at: row)
        }
    }
    
    func rewindSong(at row: Int) {
        var row = songRow! - 1
        
        if row > -1 {
            songRow = row
            playSong(at: row)
        } else {
            row = 0
            songRow = row
            playSong(at: row)
        }
    }
    
}
