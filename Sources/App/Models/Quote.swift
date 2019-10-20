//
//  Quote.swift
//  App
//
//  Created by Mihai Pantiru on 14/10/2019.
//

import Foundation
import Vapor
import FluentPostgreSQL

struct Quote: PostgreSQLModel {
    var id: Int?
    var text: String
}

// Allows `Quote` to be used as a dynamic migration.
extension Quote: Migration { }

/// Allows `Quote` to be encoded to and decoded from HTTP messages.
extension Quote: Content { }

/// Allows `Quote` to be used as a dynamic parameter in route definitions.
extension Quote: Parameter { }
