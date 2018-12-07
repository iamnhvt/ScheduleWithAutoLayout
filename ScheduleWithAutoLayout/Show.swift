//
//  Show.swift
//  Schedule
//
//  Created by Tuong Pham on 5/12/18.
//  Copyright © 2018 Tuong Pham. All rights reserved.
//

import UIKit

class Show: Decodable {
    //Mark: Properties
    var title: String
    var startTime: String
    var endTime: String
    var rating: String
    var imageChannel: String
    
    init (title: String,
          startTime: String,
          endTime: String,
          rating: String,
          imageChannel: String) {
        
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.rating = rating
        self.imageChannel = imageChannel
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "name", startTime = "start_time", endTime = "end_time",
        rating = "rating", imageChannel = "channel"
    }
    
    
}
