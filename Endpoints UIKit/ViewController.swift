//
//  ViewController.swift
//  Endpoints UIKit
//
//  Created by Joseph Rork on 9/3/20.
//  Copyright © 2020 Joseph Rork. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var endpoints = [Endpoint]()

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData() 
    }
    
    func fetchData() {
        let url = URL(string: "http://localhost:8080/endpoints")!
        
        URLSession.shared.dataTask(with: url) { data, response, error
            in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            let decoder = JSONDecoder()
            
            if let points = try? decoder.decode([Endpoint].self, from: data) {
                DispatchQueue.main.async {
                    self.endpoints = points
                    self.tableView.reloadData()
                    print("Loaded \(points.count) endpoints.")
                }
            } else {
                print("Unable to parse JSON response.")
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return endpoints.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let endpoint = endpoints[indexPath.row]
    
        cell.textLabel?.text = endpoint.name
        cell.detailTextLabel?.text = endpoint.url
        
        return cell
    }
}

    
