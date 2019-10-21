import Vapor
import Leaf

struct WebsiteController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: indexHandler)
        router.get("quote", "create", use: addQuotePageHandler)
        router.post(
          Quote.self, at: "quote", "create",
          use: addQuoteHandler)
    }
    
    func indexHandler(_ req: Request) throws -> Future<View> {
        let quotes = Quote.query(on: req).all()
        let context = QuotesContext(title: "All Quotes", quotes: quotes)
        
        return try req.view().render("index", context)
    }
    
    func addQuotePageHandler(_ req: Request) throws -> Future<View>{
        return try req.view().render("addPage")
    }
    
    func addQuoteHandler(_ req: Request, quote: Quote) throws -> Future<Response> {
      return quote.save(on: req).map(to: Response.self) { acronym in
        guard let id = acronym.id else {
          throw Abort(.internalServerError)
        }
        return req.redirect(to: "/")
        
      }
    }
}

struct QuotesContext: Encodable {
    let title: String
    let quotes: Future<[Quote]>
}
