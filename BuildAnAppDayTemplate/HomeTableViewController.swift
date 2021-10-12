//
//  HomeTableViewController.swift
//  BuildAnAppDayTemplate
//
//  Created by Nipun Singh on 10/11/21.
//

import UIKit

class HomeTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var mainSearchBar: UISearchBar!
    var exampleData = ["This", "Is", "What", "Your", "TableView", "Looks", "Like"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainSearchBar.delegate = self

        self.title = "Main View 👋"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareLink))
        
        getData()
    }
    
    func getData() {
        //Call API, decode JSON response to Swift, display on tableview.
        print("Getting Data")
        let url = "apiURl+params"
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (fetchedData, response, error) in
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }
        
            if let fetchedData = fetchedData {
                do {
                    //let dataModel = try JSONDecoder().decode(DataModel.self, from: fetchedData)
                    //data = DataModel
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        })
        task.resume()
    }
                                                                 
    @objc func shareLink() {
        //Generate a deep link and share it by opening the share sheet
    }
                                                                 
    // MARK: Search bar delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleData.count //data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)

        let cellData = exampleData[indexPath.row]
        
        cell.textLabel?.text = cellData
        cell.detailTextLabel?.text = "#\(indexPath.row + 1)"
        
        return cell
    }
}
