//
//  ProductTableViewController.swift
//  DummyProducts
//
//  Created by Cameron Cooks on 10/19/21.
//

import UIKit

class ProductTableViewController: UITableViewController {
    
    var productData: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        
        //productSearchBar.delegate = self
        self.hideKeyboardWhenTappedAround()

        //Customize the main view's title here.
        self.title = "Home View 👋"
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareLink))
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "productDataCell")
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Change this line to set your tableview cell count to equal your fetched data count.
        return 2//productData?.count ?? 0//4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productDataCell", for: indexPath)
        
        if(indexPath.row == 0) {
            let name = "title"
            let value: String = productData?.title ?? ""
            cell.textLabel?.text = name + " " + value
            cell.detailTextLabel?.text = name + value
        }
        if(indexPath.row == 1) {
            let name = "price"
            let value: Double = productData?.price ?? 0
            cell.textLabel?.text = name + " \(value)"
            cell.detailTextLabel?.text = "\(value)"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Do something when a row is tapped. Eg. Present alert, navigate to new view, etc.
        shareLink()
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
    
    
}
    
