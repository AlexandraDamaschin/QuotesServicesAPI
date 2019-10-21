import Vapor
import Leaf

// 1
struct WebsiteController: RouteCollection {
    // 2
    func boot(router: Router) throws {
        // 3
        router.get(use: indexHandler)
    }
    
    // 4
    func indexHandler(_ req: Request) throws -> Future<View> {
        let quotes = Quote.query(on: req).all()
        let context = QuotesContext(title: "All Quotes", quotes: quotes)
        // 5
        return try req.view().render("index", context)
    }
}

struct QuotesContext: Encodable {
    let title: String
    let quotes: Future<[Quote]>
}
