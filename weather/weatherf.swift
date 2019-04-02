//
//  File.swift
//  weather
//
//  Created by RuotongX on 2019/4/2.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import Foundation
import UIKit

class weatherf{
    var weatherImage: UIImage
    var dateLabel: String
    var tempLabel: String
    var locationLabel: String
    
    init(image: UIImage, date:String,temp:String,location:String){
        self.weatherImage = image
        self.dateLabel = date
        self.tempLabel = temp
        self.locationLabel = location
    }
    init(){
        self.weatherImage = UIImage(named: "01d")!
        self.dateLabel = "date"
        self.tempLabel = "temp"
        self.locationLabel = "location"
    }
}
