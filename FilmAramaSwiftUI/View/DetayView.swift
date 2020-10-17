//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Atil Samancioglu on 17.10.2020.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack(alignment:.leading, spacing:5){
            HStack{
                Spacer()
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film Ismi Gösterilecek").font(.title).foregroundColor(.blue).padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
            
            Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
            
            Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")").padding()
            
            Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
            
            Text("Yıl: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")").padding()
            
            Spacer()
            
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
