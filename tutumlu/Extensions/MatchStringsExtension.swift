//
//  MatchStringsExtension.swift
//  tutumlu
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 2.01.2024.
//

import Foundation

extension String {
    func matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let range = NSRange(startIndex..., in: self)
        let matches = regex.matches(in: self, options: [], range: range)

        return matches.map { match in
            (0..<match.numberOfRanges).compactMap { Range(match.range(at: $0), in: self).map { String(self[$0]) } }
        }
    }
}
