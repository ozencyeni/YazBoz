//
//  SingleGameView.swift
//  YazBoz101
//
//  Created by Özenç Yeni on 17.05.2023.
//

import SwiftUI

struct SingleGameView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var isDone: Bool
    @State var rounds = UserDefaults.standard.stringArray(forKey: "ROUNDS") ?? [""]
    @State var roundCheck = 0
    @State var isPresented = false
    @State var name1: String = UserDefaults.standard.string(forKey: "NAME1") ?? "empty"
    @State var name2: String = UserDefaults.standard.string(forKey: "NAME2") ?? "empty"
    @State var name3: String = UserDefaults.standard.string(forKey: "NAME3") ?? "empty"
    @State var name4: String = UserDefaults.standard.string(forKey: "NAME4") ?? "empty"
    @State var scores1 = UserDefaults.standard.string(forKey: "SCORES1") ?? "0"
    @State var scores2 = UserDefaults.standard.string(forKey: "SCORES2") ?? "0"
    @State var scores3 = UserDefaults.standard.string(forKey: "SCORES3") ?? "0"
    @State var scores4 = UserDefaults.standard.string(forKey: "SCORES4") ?? "0"
    @State var input1 = ""
    @State var input2 = ""
    @State var input3 = ""
    @State var input4 = ""
    @State var score1 = UserDefaults.standard.stringArray(forKey: "SCORE1") ?? [""]
    @State var score2 = UserDefaults.standard.stringArray(forKey: "SCORE2") ?? [""]
    @State var score3 = UserDefaults.standard.stringArray(forKey: "SCORE3") ?? [""]
    @State var score4 = UserDefaults.standard.stringArray(forKey: "SCORE4") ?? [""]
    @State var punish1 = UserDefaults.standard.stringArray(forKey: "PUNISH1") ?? [""]
    @State var punish2 = UserDefaults.standard.stringArray(forKey: "PUNISH2") ?? [""]
    @State var punish3 = UserDefaults.standard.stringArray(forKey: "PUNISH3") ?? [""]
    @State var punish4 = UserDefaults.standard.stringArray(forKey: "PUNISH4") ?? [""]
    
    
    var body: some View {
        VStack {
            HStack {
                Text(name1).font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                Text(name2).font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                Text(name3).font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                Text(name4).font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
            }
            .padding(.vertical, 7)
            HStack{
                Text(scores1).font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                Text(scores2).font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                Text(scores3).font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                Text(scores4).font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
            }
            Text("Skorlar")
                .font(.system(size: 30))
                .padding(.vertical)
            HStack{
                if roundCheck >= 1 {
                    ScrollView{
                        ForEach(rounds, id: \.self) { i in
                            Text("\(i). El")
                                .foregroundColor(Color.gray)
                            
                        }.frame(maxHeight: 150)
                    }.padding(.horizontal)
                }
                Divider()
                ScrollView{
                    ForEach(score1, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(score2, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(score3, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(score4, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
            }
            Text("Cezalar")
                .font(.system(size: 30))
                .padding(.vertical)
            HStack{
                
                ScrollView{
                    ForEach(punish1, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(punish2, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(punish3, id: \.self) { i in
                        Text(i)
                    }.frame(maxHeight: 150)
                }.padding(.horizontal)
                Divider()
                ScrollView{
                    ForEach(punish4, id: \.self) { i in
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
                            punish1.append(input1)
                            scores1 = String((Int(input1)!) + (Int(scores1) ?? 0))
                            UserDefaults.standard.set(scores1, forKey: "SCORES1")
                            UserDefaults.standard.set(punish1, forKey: "PUNISH1")
                            UserDefaults.standard.set(score1, forKey: "SCORE1")
                        }
                        input1 = ""
                        isDone = false
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            punish1.append("101")
                            scores1 =  String((101) + (Int(scores1) ?? 0))
                            UserDefaults.standard.set(scores1, forKey: "SCORES1")
                            UserDefaults.standard.set(punish1, forKey: "PUNISH1")
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
                            punish2.append(input2)
                            scores2 = String((101) + (Int(scores2) ?? 0))
                            UserDefaults.standard.set(scores2, forKey: "SCORES2")
                            UserDefaults.standard.set(punish2, forKey: "PUNISH2")
                            UserDefaults.standard.set(score2, forKey: "SCORE2")
                        input2 = ""
                        isDone = false
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            punish2.append("101")
                            scores2 =  String((101) + (Int(scores2) ?? 0))
                            UserDefaults.standard.set(scores2, forKey: "SCORES2")
                            UserDefaults.standard.set(punish2, forKey: "PUNISH2")
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
                VStack {
                    TextField("", text: $input3).keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: UIScreen.main.bounds.width * 0.15)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    .focused($isDone)
                    Button("Ceza") {
                        if !input3.isEmpty {
                            punish3.append(input3)
                            scores3 = String(Int(input3)! + (Int(scores3) ?? 0))
                            UserDefaults.standard.set(scores3, forKey: "SCORES3")
                            UserDefaults.standard.set(punish3, forKey: "PUNISH3")
                            UserDefaults.standard.set(score3, forKey: "SCORE3")
                        }
                        input3 = ""
                        isDone = false
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            punish3.append("101")
                            scores3 =  String((101) + (Int(scores3) ?? 0))
                            UserDefaults.standard.set(scores3, forKey: "SCORES3")
                            UserDefaults.standard.set(punish3, forKey: "PUNISH3")
                    } label: {
                        Text("101")
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            input3 = "202"
                    } label: {
                        Text("202")
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                }
                VStack {
                    TextField("", text: $input4).keyboardType(.numberPad)
                        .font(.system(size: 20))
                        .textFieldStyle(.roundedBorder)
                        .frame(width: UIScreen.main.bounds.width * 0.15)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    .focused($isDone)
                    Button("Ceza") {
                        if !input4.isEmpty {
                            punish4.append(input4)
                            scores4 = String(Int(input4)! + (Int(scores4) ?? 0))
                            UserDefaults.standard.set(scores4, forKey: "SCORES4")
                            UserDefaults.standard.set(punish4, forKey: "PUNISH4")
                            UserDefaults.standard.set(score4, forKey: "SCORE4")
                        }
                        input4 = ""
                        isDone = false
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            punish4.append("101")
                            scores4 =  String((101) + (Int(scores4) ?? 0))
                            UserDefaults.standard.set(scores4, forKey: "SCORES4")
                            UserDefaults.standard.set(punish4, forKey: "PUNISH4")
                    } label: {
                        Text("101")
                    }.font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.20)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .padding(.horizontal,2)
                    Button {
                            input4 = "202"
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
                            roundCheck += 1
                            scores1 = String((Int(input1)!) + (Int(scores1) ?? 0))
                            score1.append(input1)
                            UserDefaults.standard.set(score1, forKey: "SCORE1")
                            UserDefaults.standard.set(scores1, forKey: "SCORES1")
                            input1 = ""
                        } else {
                            score1.append("0")
                            roundCheck += 1
                        }
                        if !input2.isEmpty {
                            roundCheck += 1
                            scores2 = String(Int(input2)! + (Int(scores2) ?? 0))
                            score2.append(input2)
                            UserDefaults.standard.set(score2, forKey: "SCORE2")
                            UserDefaults.standard.set(scores2, forKey: "SCORES2")
                            input2 = ""
                        } else{
                            score2.append("0")
                            roundCheck += 1
                        }
                        if !input3.isEmpty {
                            roundCheck += 1
                            scores3 = String(Int(input3)! + (Int(scores3) ?? 0))
                            score3.append(input3)
                            UserDefaults.standard.set(score3, forKey: "SCORE3")
                            UserDefaults.standard.set(scores3, forKey: "SCORES3")
                            input3 = ""
                        } else {
                            score3.append("0")
                            roundCheck += 1
                        }
                        if !input4.isEmpty {
                            roundCheck += 1
                            scores4 = String(Int(input4)! + (Int(scores4) ?? 0))
                            score4.append(input4)
                            UserDefaults.standard.set(score4, forKey: "SCORE3")
                            UserDefaults.standard.set(scores4, forKey: "SCORES4")
                            input4 = ""
                        } else {
                            score4.append("0")
                            roundCheck += 1
                        }
                        
                        if roundCheck == 4{
                            rounds.removeFirst()
                            UserDefaults.standard.set(rounds, forKey: "ROUNDS")
                            score1.removeFirst()
                            UserDefaults.standard.set(score1, forKey: "SCORE1")
                            score2.removeFirst()
                            UserDefaults.standard.set(score2, forKey: "SCORE2")
                            score3.removeFirst()
                            UserDefaults.standard.set(score3, forKey: "SCORE3")
                            score4.removeFirst()
                            UserDefaults.standard.set(score4, forKey: "SCORE4")
                        }
                        isDone = false
                        rounds.append("\(roundCheck/4)")
                        UserDefaults.standard.set(rounds, forKey: "ROUNDS")
                    } label: {
                        Text("Round Sonu")
                            .font(.system(size: 30))
                            .opacity(0.8)
                }.padding(.vertical)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle(radius: 15))
                
                Spacer()
                NavigationLink {
                    SingleEndGameView(rounds: rounds.count)
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

struct SingleGameView_Previews: PreviewProvider {
    static var previews: some View {
        SingleGameView()
    }
}
