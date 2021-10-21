//
//  HomeTableViewController.swift
//  BuildAnAppDayTemplate
//
//  Created by Nipun Singh on 10/11/21.
//

// key_live_he1tJFsVLExiWxtf1wzWegplwAcQloD6
// secret_live_375m6CCCT0dqscYXL4mjh4WLTipOrr8W

import UIKit

class HomeTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var mainSearchBar: UISearchBar!
    
    //Change these two variables to your respective API base URL and your custom data model class name.
    var apiURL = "https://fakestoreapi.com/"
    var dataModel: [DataModel]? //or [DataModel]? if you're receiving an array of objects.
    
    //var exampleData = ["This", "Is", "Your", "TableView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI() {
        mainSearchBar.delegate = self
        self.hideKeyboardWhenTappedAround()

        //Customize the main view's title here.
        self.title = "Home View 👋"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareLink))
        
        getData()
        
    }
    @objc func shareLink() {
        //Generate a deep link and share it by opening the share sheet.
        let link = "dummyurl123"
        
        let alert = UIAlertController(title: "Your Branch Link", message: link, preferredStyle: UIAlertController.Style.alert)
        //alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (action: UIAlertAction!) in
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = link
                    print("Handle Ok logic here")
           }))

        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { (action: UIAlertAction!) in
                    print("Handle Cancel Logic here")
                    alert.dismiss(animated: true, completion: nil)
           }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getData() {
        print("Getting data")
        //Call API, decode JSON response to Swift, display on tableview.
        //Edit this line to make your api call using the base API url + any parameters + any text entered into the search bar.
        let urlString = "\(apiURL)products/"
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        //This function makes the API call and returns the responses as a JSON.
        Extensions().getData(url: url) { data in
            do {
                //This line decodes the JSON response from the API to your custom Swift object. Add in your custom object name here.
                let data = try JSONDecoder().decode([DataModel].self, from: data)
                
                // if // \(mainSearchBar.text ?? "")"
                // filter data.title by mainSearchBar.text
                
                self.dataModel = data

                
                //Once your data is added to the dataModel variable, it will display on the tableview. The table view methods below need to be modified first.
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
    }


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Change this line to set your tableview cell count to equal your fetched data count.
        return dataModel?.count ?? 0//4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        
        let cellData = dataModel?[indexPath.row]
        cell.textLabel?.text = cellData?.title
        cell.detailTextLabel?.text = String(format: "%f", cellData?.price as! CVarArg)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Do something when a row is tapped. Eg. Present alert, navigate to new view, etc.
        let pvc = ProductTableViewController()
        pvc.productData = dataModel?[indexPath.row]
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
    // MARK: Search bar delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getData()
        self.mainSearchBar.endEditing(true)
    }
}
