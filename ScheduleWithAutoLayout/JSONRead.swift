//
//  JSONRead.swift
//  Schedule
//
//  Created by Tuong Pham on 6/12/18.
//  Copyright © 2018 Tuong Pham. All rights reserved.
//

import UIKit

class JSONRead : Decodable {
    var result: [Show]
    
    init(result: [Show]) {
        self.result = result
    }
    
    enum CodingKeys: String, CodingKey {
        case result = "results"
    }
    
    
}
