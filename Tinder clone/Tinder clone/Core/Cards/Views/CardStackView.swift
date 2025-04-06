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
        NavigationStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach (viewModel.cardModels) { card in
                        CardView(viewModel: viewModel, model: card)
                    }
                }
                if !viewModel.cardModels.isEmpty {
                    SwipeActionButtonView(viewModel: viewModel)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 88)
                }
            }
        }
    }
}


#Preview {
    CardStackView()
}
