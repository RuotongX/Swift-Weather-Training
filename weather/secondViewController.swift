//
//  secondViewController.swift
//  weather
//
//  Created by RuotongX on 2019/3/27.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import UIKit

class secondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var secondTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = secondTable.dequeueReusableCellw
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
