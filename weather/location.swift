//
//  File.swift
//  weather
//
//  Created by RuotongX on 2019/4/1.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import Foundation
import UIKit

class location{
    var name: String
    var id: String
    var lat: Double
    var long: Double
    
    init(name: String,id: String, lat:Double, long:Double){
        self.name = name
        self.id = id
        self.lat = lat
        self.long = long
    }
    init(){
        self.name = "name"
        self.id = "id"
        self.lat = 2.00
        self.long = 2.00
    }
}
