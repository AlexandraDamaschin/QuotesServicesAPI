//
//  QuotesController.swift
//  App
//
//  Created by Mihai Pantiru on 14/10/2019.
//

import Foundation
import Vapor
import FluentPostgreSQL

class QuotesController: RouteCollection {
    func boot(router: Router) throws {
        let quotesRoute = router.grouped("api", "quotes")
        quotesRoute.post(Quote.self, use: createHandle)
        quotesRoute.get(use: getHandle)
        quotesRoute.get(Quote.parameter, use: getByIdHandle)
        quotesRoute.put(Quote.self, use: putHandle)
        quotesRoute.delete(Quote.parameter, use: deleteHandle)
    }
    
    func createHandle(_ req: Request, quote: Quote) throws -> Future<Quote> {
        return quote.create(on: req)
    }
    
    func getHandle(_ req: Request) throws -> Future<[Quote]>{
        return Quote.query(on: req).all()
    }
    
    func getByIdHandle(_ req: Request) throws -> Future<Quote> {
        return try req.parameters.next(Quote.self)
    }
    
    func putHandle(_ req: Request, quote: Quote) throws -> Future<Quote>{
        return quote.save(on: req)
    }
    
    func deleteHandle(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Quote.self).delete(on: req).transform(to: .noContent)
    }
}
