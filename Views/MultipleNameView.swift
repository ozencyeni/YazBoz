//
//  MultipleNameView.swift
//  YazBoz101
//
//  Created by Özenç Yeni on 17.05.2023.
//

import SwiftUI

struct MultipleNameView: View {
    @Environment(\.dismiss) var dismiss
    @State var team1 = ""
    @State var team2 = ""
    @State var name1 = ""
    @State var name2 = ""
    @State var name3 = ""
    @State var name4 = ""
    @State var isEmpty = false
    @State var check = false
    @State var check1 = UserDefaults.standard.string(forKey: "TEAM1") ?? ""
    var body: some View {
        VStack {
            Text("YazBoz App")
                .font(.system(size: 40))
            
            Spacer()
            Group {
                Text("Takım 1")
                Section {
                    
                    VStack {
                        TextField("Oyuncu 1", text: $name1)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        TextField("Oyuncu 2", text: $name2)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                    }
                    
                }.frame(maxHeight: 200)
                    .ignoresSafeArea()
                Text("Takım 2")
                Section {
                    
                    VStack {
                        TextField("Oyuncu 3", text: $name3)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        TextField("Oyuncu 4", text: $name4)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                    }
                }.frame(maxHeight: 150)
                if isEmpty {
                    Text("Kutuların Hepsini Doldurun ve Tekrar Kaydet Tuşuna Basın")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                }

            }
            Spacer()
            HStack {
                Button {
                    if name1.isEmpty || name2.isEmpty || name2.isEmpty || name4.isEmpty {
                        self.isEmpty = true
                    } else {
                        savePlayerNames()
                        self.isEmpty = false
                        self.check = true
                    }
                } label: {
                    Text("Kaydet")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                }.padding(.horizontal)
                
                if check {
                    NavigationLink{
                        MultipleGameView()
                    } label: {
                        Text("Oyuna Başla")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }.padding(.horizontal)
                }
                
            }
            if !(check1 == ""){
                NavigationLink {
                    MultipleGameView()
                } label: {
                    Text("Oyuna Devam Et")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                }.padding(.vertical)

            }

            Spacer()
            Spacer()
            

        }
    }
    
    func savePlayerNames() {
        team1 = "\(name1) & \(name2)"
        team2 = "\(name3) & \(name4)"
        UserDefaults.standard.set(team1, forKey: "TEAM1")
        UserDefaults.standard.set(team2, forKey: "TEAM2")
        UserDefaults.standard.set([""], forKey: "TEAMSCORE1")
        UserDefaults.standard.set([""], forKey: "TEAMSCORE2")
        UserDefaults.standard.set([""], forKey: "TEAMPUNISH1")
        UserDefaults.standard.set([""], forKey: "TEAMPUNISH2")
        UserDefaults.standard.set([""], forKey: "TEAMSCORES1")
        UserDefaults.standard.set([""], forKey: "TEAMSCORES2")
        UserDefaults.standard.set([""], forKey: "TEAMROUNDS")
    }
}

struct MultipleNameView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleNameView()
    }
}
