//
//  OBChooseServiceViewController.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit


class OBChooseServiceViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchField: UITextField!
    
    var dataSource : [Service] = [Service]()
    var fullDataSource : [Service] = [Service]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Выберите услугу"
        tableView.dataSource = self
        tableView.delegate = self
        fullDataSource = Service.getTestData() // emulate api request
        dataSource = fullDataSource
        
        tableView.reloadData()
        searchField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell") as! ServiceCell
        cell.service.text = dataSource[indexPath.row].service
        cell.queue.text = "Перед вами в очереди \(dataSource[indexPath.row].queue) человек"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toOrderedService", sender: dataSource[indexPath.row])
    }
    
    
    func textFieldDidChange(_ textField: UITextField) {
        if let searchString = searchField.text{
            var filteredDataSource = [Service]()
            if(searchString == ""){
                filteredDataSource = fullDataSource
            }
            else{
                for service in fullDataSource{
                    if service.service.contains(searchString){
                    filteredDataSource.append(service)
                    }
                }
            }
            dataSource = filteredDataSource
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderedService"{
            var destViewController = segue.destination as! OBOrderedServiceViewController
            destViewController.service = sender as? Service
        }
    }
    

}
    


