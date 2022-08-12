//
//  Constants.swift
//  youtube_likeApp
//
//  Created by Avanza on 8/5/22.
//

import Foundation

struct Constants{
    
    static var API_KEY = "AIzaSyDMI-bjmjJ8-mUbsJ9xLrLa27-l6kHuO28"
    static var PLAYLIST_ID = "PLMRqhzcHGw1ZNevU17Xk8H-1NJk8n7_j-"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
