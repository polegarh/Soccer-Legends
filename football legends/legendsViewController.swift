//
//  legendsViewController.swift
//  football legends
//
//  Created by oleg on 3/7/19.
//  Copyright © 2019 DePaul University. All rights reserved.
//

import UIKit

class legendsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return legends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let legend = legends[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: legend.type.rawValue, for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = legend.name
        cell.detailTextLabel?.text = legend.shortDescription
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let title = "List of Football Legends"
        let message = "You have selected \(legends[indexPath.row].name)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        guard let viewController = segue.destination as? ViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        viewController.legend = legends[indexPath.row]
    }
}
