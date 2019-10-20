import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    let quotesCollection = QuotesController()
    try router.register(collection: quotesCollection)
}