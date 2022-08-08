//
//  Model.swift
//  youtube_likeApp
//
//  Created by Avanza on 8/5/22.
//

import Foundation

class Model{
    
    func getVideos() {
        
        // Create a URL object
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // get a URLSession object
        
        let session = URLSession.shared
        
        // get a dataTask from the URLSession object
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // check if there are any errors
            
            if error != nil || data == nil{
                return
            }
            do{
                // parsing the data into vvideo objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch{
                
            }
            
           
        }
        
        // kick of the task
        
        dataTask.resume()
        
    }
    
}
