//
//  SingleEndGameView.swift
//  YazBoz101
//
//  Created by Özenç Yeni on 19.05.2023.
//

import SwiftUI

struct SingleEndGameView: View {
    @Environment(\.dismiss) var dismiss
    @State var rounds: Int
    @State var showingAlert = false
    var body: some View {
        VStack{
                Spacer()
                Text("Skor Tablosu")
                    .font(.largeTitle)
                Text("Toplam Round Sayısı \(rounds)")
                Spacer()
            Group {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.gray)
                        .frame(width: 350, height: 60)
                    HStack{
                        Spacer()
                        Text(UserDefaults.standard.string(forKey: "NAME1") ?? "Empty")
                            .font(.system(size: 25))
                        Spacer()
                        Text(UserDefaults.standard.string(forKey: "SCORES1") ?? "0")
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
                        Text(UserDefaults.standard.string(forKey: "NAME2") ?? "Empty")
                            .font(.system(size: 25))
                        Spacer()
                        Text(UserDefaults.standard.string(forKey: "SCORES2") ?? "0")
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
                        Text(UserDefaults.standard.string(forKey: "NAME3") ?? "Empty")
                            .font(.system(size: 25))
                        Spacer()
                        Text(UserDefaults.standard.string(forKey: "SCORES3") ?? "0")
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
                        Text(UserDefaults.standard.string(forKey: "NAME4") ?? "Empty")
                            .font(.system(size: 25))
                        Spacer()
                        Text(UserDefaults.standard.string(forKey: "SCORES4") ?? "0")
                            .font(.system(size: 25))
                        Spacer()
                    }
                }
            }
           
            Spacer()
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
                        UserDefaults.standard.set("", forKey: "NAME1")
                        UserDefaults.standard.set("", forKey: "NAME2")
                        UserDefaults.standard.set("", forKey: "NAME3")
                        UserDefaults.standard.set("", forKey: "NAME4")
                        UserDefaults.standard.set("", forKey: "SCORES1")
                        UserDefaults.standard.set("", forKey: "SCORES2")
                        UserDefaults.standard.set("", forKey: "SCORES3")
                        UserDefaults.standard.set("", forKey: "SCORES4")
                        UserDefaults.standard.set([""], forKey: "PUNISH1")
                        UserDefaults.standard.set([""], forKey: "PUNISH2")
                        UserDefaults.standard.set([""], forKey: "PUNISH3")
                        UserDefaults.standard.set([""], forKey: "PUNISH4")
                        UserDefaults.standard.set([""], forKey: "SCORE1")
                        UserDefaults.standard.set([""], forKey: "SCORE2")
                        UserDefaults.standard.set([""], forKey: "SCORE3")
                        UserDefaults.standard.set([""], forKey: "SCORE4")
                        UserDefaults.standard.set("", forKey: "ROUNDS")
                        dismiss()
                        dismiss()
                    })
            }
            Spacer()
            
        }
        
    }
}

struct SingleEndGameView_Previews: PreviewProvider {
    static var previews: some View {
        SingleEndGameView(rounds: 10)
    }
}
