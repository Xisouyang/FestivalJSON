//
//  ViewController.swift
//  DisplayFestivalJSON
//
//  Created by Stephen Ouyang on 2/7/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

enum dataError: Error {
    case badData(String)
}

class ViewController: UIViewController, UITableViewDelegate,
UITableViewDataSource {
    
    let festivalTable = UITableView()
    let formatter = DateFormatter()
    
    var model: [Festival] = [] {
        didSet{
//            festivalTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setUpTableView()
        path(forResource: "festival", ofType: ".json")
    }
    
    func setUpTableView() {
        festivalTable.register(FestivalCell.self, forCellReuseIdentifier: "cell")
        festivalTable.delegate = self
        festivalTable.dataSource = self
        self.view.addSubview(festivalTable)
        tableViewConstraint(tableView: festivalTable)
    }
    
    func tableViewConstraint(tableView: UITableView) {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
    }
    
    func path(forResource name: String?, ofType extension: String?) {
        
        let path = Bundle.main.path(forResource: "festival", ofType: ".json")
        if let path = path {
            formatter.dateFormat = "MMM d, yyyy"
            let url = URL(fileURLWithPath: path)
            let contents = try! Data(contentsOf: url, options: .alwaysMapped)
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(formatter)
                if let decoded = try? decoder.decode([Festival].self, from: contents){
                    model = decoded
                } else {
                    throw dataError.badData("bad data")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (model.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FestivalCell

        let festival = model[indexPath.row]
        cell.textLabel?.text = festival.name
        formatter.dateFormat = "MMM d, yyyy"
        cell.detailTextLabel?.text = formatter.string(from: festival.date)
        cell.artistLabel.text = "\(festival.lineup.count)"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

