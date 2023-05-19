//
//  MultipleGameView.swift
//  YazBoz101
//
//  Created by Özenç Yeni on 17.05.2023.
//

import SwiftUI

struct MultipleGameView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var isDone: Bool
    @State var teamrounds = UserDefaults.standard.stringArray(forKey: "TEAMROUNDS") ?? [""]
    @State var teamroundCheck = 0
    @State var isPresented = false
    @State var team1: String = UserDefaults.standard.string(forKey: "TEAM1") ?? "empty"
    @State var team2: String = UserDefaults.standard.string(forKey: "TEAM2") ?? "empty"
    @State var teamscores1 = UserDefaults.standard.string(forKey: "TEAMSCORES1") ?? "0"
    @State var teamscores2 = UserDefaults.standard.string(forKey: "TEAMSCORES2") ?? "0"
    @State var input1 = ""
    @State var input2 = ""
    @State var teamscore1 = UserDefaults.standard.stringArray(forKey: "TEAMSCORE1") ?? [""]
    @State var teamscore2 = UserDefaults.standard.stringArray(forKey: "TEAMSCORE2") ?? [""]
    @State var teampunish1 = UserDefaults.standard.stringArray(forKey: "TEAMPUNISH1") ?? [""]
    @State var teampunish2 = UserDefaults.standard.stringArray(forKey: "TEAMPUNISH2") ?? [""]
    
    
    var body: some View {
        VStack {
            HStack {
                Text(team1).font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                Text(team2).font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width * 0.4)
            }
            .padding(.vertical, 7)
            HStack{
                Text(teamscores1).font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                Text(teamscores2).font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width * 0.4)
            }
            Text("Skorlar")
                .font(.system(size: 30))
                .padding(.vertical)
            HStack{
                if teamroundCheck >= 1 {
                    ScrollView{
                        ForEach(teamrounds, id: \.self) { i in
                            Text("\(i). El")
                                .foregroundColor(Color.gray)
                            
                        }.frame(maxHeight: 150)
                    }.padding(.horizontal)
                }
                Divider()
                ScrollView{
                    ForEach(teamscore1, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(teamscore2, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
            }
            Text("Cezalar")
                .font(.system(size: 30))
                .padding(.vertical)
            HStack{
                
                ScrollView{
                    ForEach(teampunish1, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(teampunish2, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
            }
            HStack{
                VStack {
                    TextField("", text: $input1).keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: UIScreen.main.bounds.width * 0.15)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    .focused($isDone)
                    Button("Ceza") {
                        if !input1.isEmpty {
                            teampunish1.append(input1)
                            teamscores1 = String((Int(input1)!) + (Int(teamscores1) ?? 0))
                            UserDefaults.standard.set(teamscores1, forKey: "TEAMSCORES1")
                            UserDefaults.standard.set(teampunish1, forKey: "TEAMPUNISH1")
                            UserDefaults.standard.set(teamscore1, forKey: "TEAMSCORE1")
                        }
                        input1 = ""
                        isDone = false
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            teampunish1.append("101")
                            teamscores1 =  String((101) + (Int(teamscores1) ?? 0))
                            UserDefaults.standard.set(teamscores1, forKey: "TEAMSCORES1")
                            UserDefaults.standard.set(teampunish1, forKey: "TEAMPUNISH1")
                    } label: {
                        Text("101")
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            input1 = "202"
                    } label: {
                        Text("202")
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)

                }
                VStack {
                    TextField("", text: $input2).keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: UIScreen.main.bounds.width * 0.15)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    .focused($isDone)
                    Button("Ceza") {
                            teampunish2.append(input2)
                            teamscores2 = String((101) + (Int(teamscores2) ?? 0))
                            UserDefaults.standard.set(teamscores2, forKey: "TEAMSCORES2")
                            UserDefaults.standard.set(teampunish2, forKey: "TEAMPUNISH2")
                            UserDefaults.standard.set(teamscore2, forKey: "TEAMSCORE2")
                        input2 = ""
                        isDone = false
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            teampunish2.append("101")
                            teamscores2 =  String((101) + (Int(teamscores2) ?? 0))
                            UserDefaults.standard.set(teamscores2, forKey: "TEAMSCORES2")
                            UserDefaults.standard.set(teampunish2, forKey: "TEAMPUNISH2")
                    } label: {
                        Text("101")
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            input2 = "202"
                    } label: {
                        Text("202")
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                }
            }
            HStack{
                Spacer()
                    Button {
                        if !input1.isEmpty {
                            teamroundCheck += 1
                            teamscores1 = String((Int(input1)!) + (Int(teamscores1) ?? 0))
                            teamscore1.append(input1)
                            UserDefaults.standard.set(teamscore1, forKey: "TEAMSCORE1")
                            UserDefaults.standard.set(teamscores1, forKey: "TEAMSCORES1")
                            input1 = ""
                        } else {
                            teamscore1.append("0")
                            teamroundCheck += 1
                        }
                        if !input2.isEmpty {
                            teamroundCheck += 1
                            teamscores2 = String(Int(input2)! + (Int(teamscores2) ?? 0))
                            teamscore2.append(input2)
                            UserDefaults.standard.set(teamscore2, forKey: "TEAMSCORE2")
                            UserDefaults.standard.set(teamscores2, forKey: "TEAMSCORES2")
                            input2 = ""
                        } else{
                            teamscore2.append("0")
                            teamroundCheck += 1
                        }
                        
                        if teamroundCheck == 2{
                            teamrounds.removeFirst()
                            UserDefaults.standard.set(teamrounds, forKey: "TEAMROUNDS")
                            teamscore1.removeFirst()
                            UserDefaults.standard.set(teamscore1, forKey: "TEAMSCORE1")
                            teamscore2.removeFirst()
                            UserDefaults.standard.set(teamscore2, forKey: "TEAMSCORE2")
                        }
                        isDone = false
                        teamrounds.append("\(teamroundCheck/2)")
                        UserDefaults.standard.set(teamrounds, forKey: "TEAMROUNDS")
                    } label: {
                        Text("Round Sonu")
                            .font(.system(size: 30))
                            .opacity(0.8)
                }.padding(.vertical)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle(radius: 15))
                
                Spacer()
                
                NavigationLink {
                    MultipleEndGameView(rounds: teamrounds.count)
                } label: {
                    Text("Oyun Sonu")
                        .font(.system(size: 20))
                }.buttonStyle(.plain)
                Spacer()

            }
            Spacer()

        }.navigationBarBackButtonHidden(true)
    }
}

struct MultipleGameView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleGameView()
    }
}
