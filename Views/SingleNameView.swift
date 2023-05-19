//
//  SingleNameView.swift
//  YazBoz101
//
//  Created by Özenç Yeni on 17.05.2023.
//

import SwiftUI

struct SingleNameView: View {
    @Environment(\.dismiss) var dismiss
    @State var name1 = ""
    @State var name2 = ""
    @State var name3 = ""
    @State var name4 = ""
    @State var check: Bool = false
    @State var isEmpty: Bool = false
    @State var check1 = UserDefaults.standard.string(forKey: "NAME1") ?? ""
    @State var check2 = UserDefaults.standard.string(forKey: "NAME2") ?? ""
    @State var check3 = UserDefaults.standard.string(forKey: "NAME3") ?? ""
    @State var check4 = UserDefaults.standard.string(forKey: "NAME4") ?? ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("YazBoz App")
                .font(.system(size: 40))
            Spacer()
            
            
            Group {
                textfield(name: $name1, placeholder: "Oyuncu 1")
                textfield(name: $name2, placeholder: "Oyuncu 2")
                textfield(name: $name3, placeholder: "Oyuncu 3")
                textfield(name: $name4, placeholder: "Oyuncu 4")
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
                    if name1.isEmpty || name2.isEmpty || name3.isEmpty || name4.isEmpty {
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
                        SingleGameView()
                    } label: {
                        Text("Oyuna Başla")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }.padding(.horizontal)
                }
                
            }
            if !(check1 == ""){
                NavigationLink {
                    SingleGameView()
                } label: {
                    Text("Oyuna Devam Et")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                }.padding(.vertical)

            }

            
            Spacer()
            

        }
    }
    
    func savePlayerNames() {
        UserDefaults.standard.set(name1, forKey: "NAME1")
        UserDefaults.standard.set(name2, forKey: "NAME2")
        UserDefaults.standard.set(name3, forKey: "NAME3")
        UserDefaults.standard.set(name4, forKey: "NAME4")
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
    }
}

struct textfield: View {
    @Binding var name: String
    var placeholder: String
    
    var body: some View {
        ZStack {
            TextField(placeholder, text: $name)
                .multilineTextAlignment(.center)
                .padding(.vertical)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 60)
        }
    }
}

struct SingleNameView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNameView()
    }
}
