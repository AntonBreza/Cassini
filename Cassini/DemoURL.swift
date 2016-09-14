//
//  URL.swift
//
//  Created by CS193p Instructor.
//  Copyright (c) 2016 Stanford University. All rights reserved.
//

import Foundation

struct DemoURL
{
    static let Stanford = "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png"

    static let NASA = [
        "Cassini" : "http://freshwallpapers.in/download/funpki_hot_girl-1920x1080.jpg",
        // "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg"
        "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    
    static func NASAImageNamed(_ imageName: String?) -> URL? {
        if let urlstring = NASA[imageName ?? ""] {
            return URL(string: urlstring)
        } else {
            return nil
        }
    }
}
