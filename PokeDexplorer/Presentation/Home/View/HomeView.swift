//
//  HomeView.swift
//  PokeDexplorer
//
//  Created by Andria Inasaridze on 28.03.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            logo
            if vm.isLoading {
                Spacer()
                HStack{
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                Spacer()
            } else {
                pokemonList
            }
            
        }
        .ignoresSafeArea()
        .background(
            VStack{
                Image("bg")
                    .padding(.top, -100)
                Spacer()
            }
        )
        .task {
            do{
                try await vm.getPokemons(offset: 0, limit: 10)
            }catch{
                print(error)
            }
        }
    }
}

extension HomeView {
    var logo : some View {
        HStack{
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 48)
            Spacer()
        }
        .padding(.top, 64)
        .padding(.horizontal, 24)
    }
    
    var title : some View {
        Text("Pokédex")
            .font(.system(size: 24, weight: .semibold, design: .rounded))
            .foregroundColor(.black)
            .padding(.horizontal, 24)
    }
    
    var pokemonList : some View {
        ScrollView {
            HStack {
                title
                Spacer()
            }
            
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 150)), GridItem(.adaptive(minimum: 150))], spacing: 16
            ) {
                ForEach(vm.pokemons, id:\.id) { pokemon in
                    PokemonCardView(pokemonEntry: pokemon)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scrollIndicators(.hidden)
    }
}
#Preview {
    HomeView(vm: HomeViewModel(getPokemonsUseCase: GetPokemonsUseImpl(repo: PokemonRepositoryImpl(remote: RemoteDataSource()))))
}
