//
//  TableCellTableViewCell.swift
//  weather
//
//  Created by RuotongX on 2019/3/24.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell{
    @IBOutlet weak var WeatherImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    func setWeatherf(weatherf:weatherf){
        WeatherImage.image = weatherf.weatherImage
        locationLabel.text = weatherf.locationLabel
        dateLabel.text = weatherf.dateLabel
        tempLabel.text = weatherf.tempLabel
    }
}
