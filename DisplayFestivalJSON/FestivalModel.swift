//
//  FestivalModel.swift
//  DisplayFestivalJSON
//
//  Created by Stephen Ouyang on 2/7/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

struct Participant: Codable{
    let name: String
    let id: String
}

struct City: Codable{
    let name: String
    let id: String
}

struct Festival: Codable {
    let date: Date
    let name: String
    let city: City
    let lineup: [Participant]
}

