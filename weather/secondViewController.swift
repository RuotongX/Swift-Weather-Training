//
//  secondViewController.swift
//  weather
//
//  Created by RuotongX on 2019/3/27.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class secondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var secondTable: UITableView!
    var locate = location()
    var weathers: [weatherf] = [];
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherf = weathers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellTableViewCell") as! TableCellTableViewCell
        cell.setWeatherf(weatherf: weatherf)
        
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        getWeathers()
    }
    
    func getWeathers() {
        let id = locate.id
        let apiKey = "d1580a5eaffdf2ae907ca97ceaff0235"
        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=\(id)&APPID=\(apiKey)").responseJSON{
            response in
            if let responseStr = response.result.value{
                let jsonResponse = JSON(responseStr)
                for i in 0...5 {
                    let jsonDay = jsonResponse["list"].array![i]
                    let jsonWeather = jsonDay["weather"].array![0]
                    let jsonTemp = jsonDay["main"]
                    let iconName = jsonWeather["icon"].stringValue
                    
                    let name = self.locate.name
                    let image = UIImage(named: iconName)
                    let temp = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                    let date = jsonDay["dt_txt"].stringValue
                    
                    let forcast = weatherf()
                    forcast.locationLabel = name
                    forcast.weatherImage = image!;
                    forcast.tempLabel = temp
                    forcast.dateLabel = date
                    
                    self.weathers.append(forcast)
                }
            }
        }
    }
    

    

}
