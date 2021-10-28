//
//  String+Extension.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/28/21.
//

import Foundation


extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
