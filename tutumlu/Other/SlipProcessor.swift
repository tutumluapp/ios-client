//
//  SlipProcessor.swift
//  tutumlu
//
//  Created by ali-kerem on 2.01.2024.
//

import UIKit
import Vision

struct RecognizedText {
    let text: String
    let boundingBox: CGRect
}

class ImagePreProcessor {
    static func preprocessImage(_ image: UIImage) -> UIImage? {
        // Preprocess the image to enhance quality
        guard let ciImage = CIImage(image: image) else { return nil }
        let filter = CIFilter(name: "CIPhotoEffectNoir") // Grayscale
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        if let output = filter?.outputImage, let cgImage = CIContext(options: nil).createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage)
        }
        
        return nil
    }
}

class SlipParser {
    var slipData = SlipDataModel() // Define slipData here

    func performTextRecognition(on image: UIImage, completion: @escaping (SlipDataModel?) -> Void) {
        guard let cgImage = image.cgImage else {
            completion(nil) // Return nil if cgImage is not available
            return
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest { [weak self] (request, error) in
            if let error = error {
                print("Failed to perform text recognition: \(error)")
                completion(nil) // Return nil in case of an error
                return
            }

            self?.handleTextRecognition(request: request, error: error)
            completion(self?.slipData) // Return the updated slipData
        }

        request.recognitionLevel = .accurate // Use .accurate or .fast based on your need

        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform text recognition: \(error)")
            completion(nil) // Return nil in case of an error
        }
    }

    func handleTextRecognition(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNRecognizedTextObservation] else {
            fatalError("Received invalid observations")
        }

        var recognizedTexts = [RecognizedText]()

        for observation in observations {
            guard let topCandidate = observation.topCandidates(1).first else {
                continue
            }
            let text = RecognizedText(text: topCandidate.string, boundingBox: observation.boundingBox)
            recognizedTexts.append(text)
        }

        getTextLineByLine(from: recognizedTexts)
    }

    func getTextLineByLine(from recognizedTexts: [RecognizedText]) {
        // Threshold to determine if texts are on the same line
        let sameLineThreshold: CGFloat = 0.02
        
        // First, sort all texts based on their Y coordinate
        let sortedByY = recognizedTexts.sorted { $0.boundingBox.minY > $1.boundingBox.minY }
        
        // Group texts by lines
        var recognizedLines: [[RecognizedText]] = []
        var currentLine: [RecognizedText] = []
        
        var lastY: CGFloat = 1.0
        for text in sortedByY {
            if currentLine.isEmpty || abs(text.boundingBox.minY - lastY) <= sameLineThreshold {
                currentLine.append(text)
            } else {
                recognizedLines.append(currentLine.sorted { $0.boundingBox.minX < $1.boundingBox.minX })
                currentLine = [text]
            }
            lastY = text.boundingBox.minY
        }
        if !currentLine.isEmpty {
            recognizedLines.append(currentLine.sorted { $0.boundingBox.minX < $1.boundingBox.minX })
        }
        
        var lines: [String] = []
        
        // Now 'lines' contains arrays of RecognizedText, each array representing a line of text
        // Sort each line by X coordinate and process as needed
        
        for line in recognizedLines {
            let lineText = line.map { $0.text }.joined(separator: " ")
            lines.append(lineText)
            // print(lineText)
        }

        processLines(lines)
    }
    
    
    func processLines(_ lines: [String]) {
        for (index, line) in lines.enumerated() {
            // Check for market name in the first few lines
            if index < 3, let marketName = findMarketName(in: line) {
                slipData.marketName = marketName
                continue
            }

            // Check for date
            if slipData.date == nil, let date = findDate(in: line) {
                slipData.date = date
            }

            // Check for time
            if slipData.time == nil, let time = findTime(in: line) {
                slipData.time = time
            }

            // Parse items and prices
            if line.contains("%"), let item = parseItem(from: line) {
                if item.price != 0.25 {
                    slipData.itemData.append(item)
                }
            }
        }
        
        print("Market : \(slipData.marketName ?? "No market found")")
        print("Date : \(slipData.date ?? "No date found")")
        print("Time : \(slipData.time ?? "No time found")")

        if slipData.itemData.isEmpty {
            print("No items available.")
        } else {
            for item in slipData.itemData {
                print("Item Name: \(item.name ?? "null"), Price: \(item.price ?? 0), Barcode ID: \(item.barcodeID ?? "null")")
            }
        }
        
    }

    func findMarketName(in text: String) -> String? {
        let marketNames = ["A101", "Migros", "Şok", "Sok", "Erkoc", "Erkoç"]
        for market in marketNames {
            if text.lowercased().folding(options: .diacriticInsensitive, locale: .current).contains(market.lowercased()) {
                return market
            }
        }
        return nil
    }

    func findDate(in text: String) -> String? {
        let dateRegex = "([0-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/([0-9]{4})"
        let matches = text.matchingStrings(regex: dateRegex)

        if let firstMatch = matches.first, firstMatch.count > 0 {
            // The whole date is the entire match, which is the first element of the firstMatch array
            return firstMatch[0]
        }

        return nil
    }


    func findTime(in text: String) -> String? {
        let timeRegex = "\\b\\d{2}:\\d{2}(?::\\d{2})?\\b"
        let matches = text.matchingStrings(regex: timeRegex)

        if let firstMatch = matches.first, firstMatch.count > 0 {
            // The whole time is the entire match, which is the first element of the firstMatch array
            return firstMatch[0]
        }

        return nil
    }

    func parseItem(from text: String) -> UploadItem? {
        // Updated regex to capture item name and price
        let itemRegex = "([\\w\\s]+) %\\d{1,2} [*,#]?([0-9]{1,4}[.,][0-9]{2})"
        let matches = text.matchingStrings(regex: itemRegex)

        if let firstMatch = matches.first, firstMatch.count >= 3 {
            let name = firstMatch[1].trimmingCharacters(in: .whitespacesAndNewlines)
            let priceString = firstMatch[2].replacingOccurrences(of: ",", with: ".")

            if let price = Double(priceString) {
                return UploadItem(name: name, price: price, barcodeID: nil)
            }
        }
        
        return nil
    }
}




