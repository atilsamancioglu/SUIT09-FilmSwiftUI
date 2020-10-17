//
//  FilmDetayViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Atil Samancioglu on 17.10.2020.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    
    @Published var filmDetayi : FilmDetaylariViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId : String) {
        
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
                }
                
            }
        }
        
    }
    
}

struct FilmDetaylariViewModel {
    
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    
    var poster : String {
        detay.poster
    }
    
    var year : String {
        detay.year
    }
    
    var imdbId : String {
        detay.imdbId
    }
    
    var director : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var awards : String {
        detay.awards
    }
    
    var plot : String {
        detay.plot
    }
    
}
