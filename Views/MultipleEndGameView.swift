//
//  MultipleEndGameView.swift
//  YazBoz101
//
//  Created by Özenç Yeni on 19.05.2023.
//

import SwiftUI

struct MultipleEndGameView: View {
    @State var rounds: Int
    @Environment(\.dismiss) var dismiss
    @State var showingAlert = false
    var body: some View {
        VStack{
            Spacer()
            Text("Skor Tablosu")
                .font(.largeTitle)
            Text("Oynanan Rounds Sayısı \(rounds)")
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.gray)
                    .frame(width: 350, height: 60)
                HStack{
                    Spacer()
                    Text(UserDefaults.standard.string(forKey: "TEAM1") ?? "Empty")
                        .font(.system(size: 25))
                    Spacer()
                    Text(UserDefaults.standard.string(forKey: "TEAMSCORES1") ?? "0")
                        .font(.system(size: 25))
                    Spacer()
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.gray)
                    .frame(width: 350, height: 60)
                HStack{
                    Spacer()
                    Text(UserDefaults.standard.string(forKey: "TEAM2") ?? "Empty")
                        .font(.system(size: 25))
                    Spacer()
                    Text(UserDefaults.standard.string(forKey: "TEAMSCORES2") ?? "0")
                        .font(.system(size: 25))
                    Spacer()
                }
            }
            Button {
                showingAlert = true
            } label: {
                Text("Oyunu Bitir")
                    .font(.system(size: 25))
                    .foregroundColor(.red)
                    .opacity(0.6)
            }.buttonStyle(.bordered)
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Oyunu sonlandırmak istediğinize emin misiniz?"),
                    primaryButton: .default(Text("Vazgeç")),
                    secondaryButton: .destructive(Text("Bitir")){
                        UserDefaults.standard.set("", forKey: "TEAM1")
                        UserDefaults.standard.set("", forKey: "TEAM2")
                        UserDefaults.standard.set("", forKey: "TEAMSCORES1")
                        UserDefaults.standard.set("", forKey: "TEAMSCORES2")
                        UserDefaults.standard.set([""], forKey: "TEAMPUNISH1")
                        UserDefaults.standard.set([""], forKey: "TEAMPUNISH2")
                        UserDefaults.standard.set([""], forKey: "TEAMSCORE1")
                        UserDefaults.standard.set([""], forKey: "TEAMSCORE2")
                        UserDefaults.standard.set("", forKey: "TEAMROUNDS")
                        dismiss()
                        dismiss()
                    })
            }
            Spacer()
            
        }
        
    }
}

struct MultipleEndGameView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleEndGameView(rounds: 10)
    }
}
