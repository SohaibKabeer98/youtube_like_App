//
//  ViewController.swift
//  youtube_likeApp
//
//  Created by Avanza on 8/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideos()
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // get a refrence to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // get a refrence to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // set the video property of the detail view controller
        detailVC.video = selectedVideo
        
    }
    // MARK: - Model delegate methods
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        
        self.videos = videos
        
        // Refresh the table
     
            self.tableView.reloadData()
        
        
    }

    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! TableViewCell
        
        // configure the cell with the data
        
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        // return the cell
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
}

