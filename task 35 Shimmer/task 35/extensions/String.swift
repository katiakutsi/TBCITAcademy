//
//  String.swift
//  task 35
//
//  Created by katia kutsi on 6/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
}
