//
//  weathercell.swift
//  weather
//
//  Created by RuotongX on 2019/4/8.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import UIKit

class weathercell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var WeatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    func setWeatherf(weatherf:weatherf){
        WeatherImage.image = weatherf.weatherImage
        dateLabel.text = weatherf.dateLabel
        tempLabel.text = weatherf.tempLabel
    }

}
