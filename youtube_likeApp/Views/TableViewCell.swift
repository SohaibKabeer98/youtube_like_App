//
//  TableViewCell.swift
//  youtube_likeApp
//
//  Created by Avanza on 8/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        
        self.video = v
        
        //ensure that we have a video
        guard self.video != nil else{
            return
        }
        
        // set the tilte and date label
        self.titleLable.text = video?.title
        
        // for formating the date object we set in Video class
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLable.text = df.string(from: video!.published)
        
        // set the thumbnail
        guard self.video!.thumbnail != "" else{
            return
        }
        
        //check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            // set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //get the shared URL session object
        
        let session = URLSession.shared
        
        // create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil{
                
                // save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data) 
                
                //check that the downloaded url matches the video thumbnail url that this cell is currently set tot display
                
                if url!.absoluteString != self.video!.thumbnail{
                    
                    //video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                //create the image object
                let image = UIImage(data: data!)
                
                //set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
        
    }

}
