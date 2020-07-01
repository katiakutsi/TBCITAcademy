//
//  String+Extension.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
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

extension FileManager {
    func urls(for directory: FileManager.SearchPathDirectory, skipsHiddenFiles: Bool = true ) -> [URL]? {
        let documentsURL = urls(for: directory, in: .userDomainMask)[0]
        let fileURLs = try? contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: skipsHiddenFiles ? .skipsHiddenFiles : [] )
        return fileURLs
    }
}
