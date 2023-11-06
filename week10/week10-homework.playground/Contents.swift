import SwiftUI

struct Facts: AsyncSequence {
    typealias AsyncIterator = FactsIterator
    typealias Element = (Int, String)
    
    let counter: Int
    
    func makeAsyncIterator() -> FactsIterator {
        return FactsIterator(counter)
    }
}

struct FactsIterator: AsyncIteratorProtocol {
    typealias Element = (Int, String)
    let counter: Int
    var currentCount: Int
    
    init(_ counter: Int) {
        self.counter = counter
        self.currentCount = 0
    }
    
    mutating func next() async throws -> (Int, String)? {
        guard currentCount < counter else { return nil }
        try await Task.sleep(until: .now + .seconds(1), clock: .continuous)
        let fact = try await fetchData().fact
        defer {
            currentCount = currentCount + 1
        }
        return (currentCount, fact)
    }
}

public struct Fact: Decodable {
    public let fact: String
    public let length: Int
}

func fetchData() async throws -> Fact {
    let url = URL(string: "https://catfact.ninja/fact")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(Fact.self, from: data)
}

Task {
    for try await item in Facts(counter: 10) {
        print("\(item.0 + 1): \(item.1)\n")
    }
    print("Done!")
}
