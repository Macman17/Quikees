//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Naqui Darby on 2/24/26.
//

import Foundation


enum ReadingStatus: String, CaseIterable, Codable, Hashable {
    case planToRead = "plan to read"
    case reading = "reading"
    case dropped = "dropped"
    case finshed = "finished"
    
    case unknown = "unknown"
    
}
