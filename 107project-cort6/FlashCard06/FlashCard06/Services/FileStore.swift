//
//  FileStore.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/14/26.
//

import Foundation


enum FileStoreError: Error {
    case invalidDocumentDirectory
}
struct FileStore{
    private let fileName: String
    
    init(filename: String = "decks.json") {
        self.fileName = filename
    }
   private func fileURL() throws -> URL{
       guard let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
           throw FileStoreError.invalidDocumentDirectory
       }
       return docs.appendingPathComponent(fileName)
        }
    
    func load<T: Decodable>(_ type: T.Type) throws -> T {
        let url = try fileURL()
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func save<T: Encodable>(_ value: T) throws {
        let url = try fileURL()
        let data = try JSONEncoder().encode(value)
        try data.write(to: url, options: [.atomic])
    }
}

