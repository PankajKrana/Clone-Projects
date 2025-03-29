//
//  CardStackView.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/24/25.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardViewModel(service: CardService())
    var body: some View {
        ZStack {
            ForEach (viewModel.cardModels) { card in
                CardView(model: card)
            }
        }
    }
}


#Preview {
    CardStackView()
}
