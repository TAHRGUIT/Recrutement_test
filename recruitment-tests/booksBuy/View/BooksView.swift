//
//  BooksView.swift
//  recruitment-tests
//
//  Created by ytahrgui on 15/4/2022.
//

import SwiftUI

import SDWebImageSwiftUI

struct BooksView: View {
    
    @ObservedObject var booksVM = BooksViewModel()
    let columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    LazyVGrid(columns: columns){
                        ForEach(self.booksVM.books,id: \.self) { book in
                            showAllBooks(books: book)
                                .onTapGesture {
                                    showingAlert = true
                                }
                                .alert("Sorry, i didn't complet the test ", isPresented: $showingAlert) {
                                            Button("OK", role: .cancel) { }
                                        }
                        }
                    }
                    //.padding(.bottom, 80)
                }
                
            }.onAppear(){
                booksVM.getBooks()
            }
            
        }.navigationBarTitle("")
            .navigationBarHidden(true)
        
    }
}


struct showAllBooks : View{
    var books = BooksModel()
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 10){
            
            HStack{
                
                WebImage(url: URL(string: books.cover))
                    .placeholder {
                        Image("")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 180).cornerRadius(15)
                    }
                    .onSuccess { image, data, cacheType in  }
                    .onFailure { error in print(error)}
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 180).cornerRadius(15)
                
            }.offset(y : 90)
            
            HStack{
                ZStack{
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text(books.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size : 16))
                                .padding(.leading, 10)
                                .frame(width: UIScreen.main.bounds.width / 2 - 25, alignment: .leading)
                                .offset(y : 0)
                                .lineLimit(2)
                            
                        }
                        HStack{
                            Text("\(String(format: "%.0f", books.price)) $")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 11))
                                .padding(.leading, 10)
                                .lineLimit(1)
                        }
                        
                        
                    }
                    
                }
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(15)
                .offset(y : 0)
                
            }
            .offset(y : 30)
            .padding(.bottom, 0)
            
        }
        
        .padding(.bottom, -20)
        .offset(y: -80)
        
    }
}


struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
