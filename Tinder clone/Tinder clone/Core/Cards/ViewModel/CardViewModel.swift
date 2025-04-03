//
//  CardViewModel.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/24/25.
//

import Foundation

@MainActor
class CardViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    private let service: CardService
    init(service: CardService) {
        self.service = service
        
        Task { await fetchCardModels()}
    }
    
    func fetchCardModels()  async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG: failed to fetch cards with \(error)")
        }
    }
    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: {$0.id == card.id}) else { return }
        cardModels.remove(at: index)
    }
}
