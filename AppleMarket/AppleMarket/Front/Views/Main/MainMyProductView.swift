//
//  MainMyProductView.swift
//  AppleMarket
//
//  Created by youngseo on 2022/12/27.
//

import SwiftUI

struct MyProduct : Identifiable{
    var id: Int
    let imagePath: String
    let productName: String
    let category: String
    let details: String
}

var myProducts: [MyProduct] = [
    MyProduct(id: 0, imagePath: "https://cdn.shopify.com/s/files/1/1684/4603/products/iphone-14-Pro-Max_Graphite_600x.png?v=1662809202", productName: "iPhone 14 Pro", category: "iPhone", details: "iPhone 14 Pro 256GB 스페이스 블랙"),
    MyProduct(id: 1, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-card-40-macbook-pro-13-202206?wid=1200&hei=1000&fmt=p-jpg&qlt=95&.v=1665082744007", productName: "MacBook Pro 13", category: "MacBook Pro", details: "13형 MacBook Pro - 스페이스그레이"),
    MyProduct(id: 2, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-card-40-pro-202210?wid=680&hei=528&fmt=p-jpg&qlt=95&.v=1664578794100", productName: "iPad Pro", category: "iPad", details: "11형 iPad Pro Wi-Fi 128GB - 실버"),
    MyProduct(id: 3, imagePath: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-se-202209_GEO_KR?wid=680&hei=528&fmt=png-alpha&.v=1661812053226", productName: "Apple Watch SE", category: "Apple Watch", details: "Apple Watch")
]

struct MainMyProductView: View {
    
//    let selectedMyProduct: MyProduct
    
    @StateObject private var userProductStore = UserProductStore()
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("기기별로 쇼핑하기")
                .font(.title)
                .fontWeight(.bold)
            
            
        
            // 내 기기
            
//            // 등록된 기기가 없을 때            if{
//
//            NavigationLink(
 
            // destination 임의로 지정
//                destination: MypageView()){
//                    VStack(alignment: .center){
//                        Image(systemName: "plus.square.dashed")
//                            .frame(width: 200, height: 200)
//                        Text("등록된 기기가 없습니다.")
//                    }
//                    .foregroundColor(.gray)
//                }
//
//            //            }
            
            // 등록된 기기가 있을 때           else{
            ScrollView(.horizontal){
                HStack(alignment: .center){
                    
                    Spacer()
                        .frame(width: 50)
                    
                    ForEach(userProductStore.userProductStores){ product in
                        // 내 기기 이미지 사용 예정
                        
                        NavigationLink{
                            MyProductDetailView(myProducts: product)
                        } label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 240, height: 300)
                                .foregroundColor(.white)
                            
                            VStack {
                                AsyncImage(url: URL(string: product.images[0] ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 180)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                Spacer()
                                    .frame(height: 20)
                                // username의 \(product.category)
                                Text("김영서의 \(product.category)")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 1)
                                
                                Text(product.productName)

                                
                            }
                            
                        }
                        .foregroundColor(.black)
                    }
                    }
                }
            }
            
            //            }
        }
        .padding(.top, 50)
        .onAppear{userProductStore.fetchData()}
        
    }
}

struct MainMyProductView_Previews: PreviewProvider {
    static var previews: some View {
        MainMyProductView()
    }
}
