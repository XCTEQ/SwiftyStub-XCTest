//
//  ViewController.swift
//  SwiftStubs
//
//  Created by Shashikant Jagtap on 16/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import UIKit

struct GitHub: Codable {
    
    let name: String?
    let location: String?
}




class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBAction func networkRequested(_ sender: Any) {
        
       let baseUrl = ProcessInfo.processInfo.environment["BASEURL"]!

        guard let gitUrl = URL(string: baseUrl + "/users/shashikant86") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in

            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GitHub.self, from: data)
                
                DispatchQueue.main.sync {
                    if let glocation = gitData.location {
                        self.locationLabel.text = glocation
                        self.locationLabel.isHidden = false
                    }
                }
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

