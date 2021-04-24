//
//  Trip.swift
//  CarouselSlider
//
//  Created by Sheikh Bayazid on 4/23/21.
//

import SwiftUI

struct Trip: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    
    static let example: [Trip] = [
        Trip(image: "p1", title: "Ocean"),
        // Trip(image: "p2", title: "Mountain"),
        Trip(image: "p3", title: "Road"),
        Trip(image: "p4", title: "Development"),
        Trip(image: "p5", title: "Occupy Mars"),
        Trip(image: "p6", title: "macOS")
    ]
}
