//
//  Extensions.swift
//  BuildAnAppDayTemplate
//
//  Created by Nipun Singh on 10/13/21.
//

import Foundation
import UIKit

class Extensions: UIViewController {
    
    func getData(url: String, completion: @escaping (Data) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }

            if let data = data {
                completion(data)
            }
        })
        
        task.resume()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

