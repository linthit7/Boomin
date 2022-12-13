//
//  SongTableViewController.swift
//  Boomin
//
//  Created by Lin Thit Khant on 12/7/22.
//

import Foundation
import UIKit

class SongTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var songs = [
        Song(name: "Superhero", feature: "Metro Boomin & Future", trackName: "Superhero(Future&Metro)", coverName: "Heroes&Villains"),
        
        Song(name: "Raindrops", feature: "Metro Boomin & Travis Scott", trackName: "Raindrops(Travis&Metro)", coverName: "Heroes&Villains"),
        
        Song(name: "Too Many Nights", feature: "Metro Boomin & Future", trackName: "Superhero(Future&Metro)", coverName: "Heroes&Villains")
    ]
    //MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Boomin"
        tableView.separatorInset = UIEdgeInsets()
        
        
    }
    
    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let aSong = songs[indexPath.row]
        
        cell.textLabel?.text = aSong.name
        cell.textLabel?.font = UIFont(name: "Arial", size: 20)
        cell.detailTextLabel?.text = aSong.feature
        cell.imageView?.image = UIImage(named: aSong.coverName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "songToPlayer", sender: self)
    }
    
    //MARK: - UI Segue Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let playerVC = segue.destination as! PlayerViewController
        
        if let selectedSong = self.tableView.indexPathForSelectedRow {
            
            playerVC.songs = self.songs
            
            playerVC.inputCover = UIImage(named: songs[selectedSong.row].coverName)
            playerVC.songRow = selectedSong.row
        }
    }
    
}
