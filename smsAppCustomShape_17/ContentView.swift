//
//  ContentView.swift
//  smsAppCustomShape_17
//
//  Created by emm on 02/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//                ContentView()
//                   .environment(\.colorScheme, .light)
//
//                ContentView()
//                   .environment(\.colorScheme, .dark)
//             }
//    }
//}


struct Home: View {
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var selectedTab = "Chats"
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ZStack {
                    
                    HStack {
                        
                        Button(action: {}, label: {
                            Image(systemName: "camera")
                                .font(.system(size: 22))
                        })
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 22))
                        })
                    }
                    Text("ModyChat")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                .padding(.top, edges!.top)
                .foregroundColor(.white)
                
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { title in
                        TabButton(selectedTab: $selectedTab, title: title, animation: animation)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(15)
                .padding(.vertical)
            }
            .padding(.bottom)
            .background(Color("top"))
            .clipShape(CustomCorner(corner: .bottomLeft, size: 65))
            
            ZStack {
                Color("top")
                
                Color("bg")
                    .clipShape(CustomCorner(corner: .topRight, size: 65))
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 20) {
                        HStack {
                            Text("All Chats")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {}, label: {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.system(size: 22))
                                    .foregroundColor(.primary)
                            })
                        }
                        .padding()
                    }
                    .padding(.vertical)
                })
            }
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}

var tabs = ["Chats","Status","Calls"]




////////////////////      Tab button    \\\\\\\\\\\\\\\\\\\\
struct TabButton: View {
    
    @Binding var selectedTab: String
    var title: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation{
                selectedTab = title
            }
        }, label: {
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
            
            // sliding effect...
                .background(
                    ZStack {
                        if selectedTab == title {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("top"))
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        })
    }
}


////////////////////      custom corner    \\\\\\\\\\\\\\\\\\\\
struct CustomCorner: Shape {
    var corner: UIRectCorner
    var size: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size , height: size))
        return Path(path.cgPath)
    }
}


////////////////////      Model and sample data   \\\\\\\\\\\\\\\\\\\\
struct Chat: Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var msg: String
    var time: String
}

struct HomeData {
    var groupName: String
    var groupData: [Chat]
}

var FriendsChat: [Chat] = [
Chat(name: "memoji1", image: <#T##String#>, msg: <#T##String#>, time: <#T##String#>)
]
