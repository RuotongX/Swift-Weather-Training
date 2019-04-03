//
//  TableCellTableViewCell.swift
//  weather
//
//  Created by RuotongX on 2019/3/24.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell{

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var WeatherImage: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    
    func setWeatherf(weatherf:weatherf){
        WeatherImage.image = weatherf.weatherImage
        locationLabel.text = weatherf.locationLabel
        dateLabel.text = weatherf.dateLabel
        tempLabel.text = weatherf.tempLabel
    }
}
