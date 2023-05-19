//
//  MainView.swift
//  YazBoz101
//
//  Created by Özenç Yeni on 30.04.2023.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Text("Hoşgeldiniz")
                    .font(.system(size: 30))
                Spacer()
                
                HStack {
                    NavigationLink {
                        SingleNameView()
                    } label: {
                        Text("Tekli Oyun")
                            .font(.system(size: 25))
                    }.padding(.horizontal)
                    NavigationLink {
                        MultipleNameView()
                    } label: {
                        Text("Eşli Oyun")
                            .font(.system(size: 25))
                    }.padding(.horizontal)
                    

                }
                Spacer()
                
                

                
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
