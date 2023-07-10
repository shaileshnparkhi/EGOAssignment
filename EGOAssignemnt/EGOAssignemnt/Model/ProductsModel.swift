//
//  ProductsModel.swift
//  EDG iOS Test
//
//  Created by Shailesh on 08/07/23.
//

import Foundation
    
struct ProductsResponse:Decodable {
    var id: String?
    
    var productsList : [ProductsList]?
    
    enum CodingKeys:CodingKey{
        case products
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ProductsResponse.CodingKeys> = try decoder.container(keyedBy: ProductsResponse.CodingKeys.self)
        self.productsList = try container.decodeIfPresent([ProductsList].self, forKey: ProductsResponse.CodingKeys.products)
    }
    
}
    
    struct ProductsList : Decodable {
        
        var citrusId : String?
        var title : String?
        var id : String?
        var imageURL : String?
        var price : [Price]?
        var brand : String?
        var badges : [String]?
        var ratingCount : Double?
        var messages : Messages?
        var isAddToCartEnable : Bool?
        var addToCartButtonText : String?
        var isInTrolley : Bool?
        var isInWishlist : Bool?
        var purchaseTypes : [PurchaseTypes]?
        var isFindMeEnable : Bool?
        var saleUnitPrice : Double?
        var totalReviewCount : Int?
        var isDeliveryOnly : Bool?
        var isDirectFromSupplier : Bool?
        
        var isFavorite : Bool = false
        
        enum CodingKeys:CodingKey {
            
            case citrusId
            case title
            case id
            case imageURL
            case price
            case brand
            case badges
            case ratingCount
            case messages
            case isAddToCartEnable
            case addToCartButtonText
            case isInTrolley
            case isInWishlist
            case purchaseTypes
            case isFindMeEnable
            case saleUnitPrice
            case totalReviewCount
            case isDeliveryOnly
            case isDirectFromSupplier
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            citrusId = try values.decodeIfPresent(String.self, forKey: .citrusId)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
            price = try values.decodeIfPresent([Price].self, forKey: .price)
            brand = try values.decodeIfPresent(String.self, forKey: .brand)
            badges = try values.decodeIfPresent([String].self, forKey: .badges)
            ratingCount = try values.decodeIfPresent(Double.self, forKey: .ratingCount)
            messages = try values.decodeIfPresent(Messages.self, forKey: .messages)
            isAddToCartEnable = try values.decodeIfPresent(Bool.self, forKey: .isAddToCartEnable)
            addToCartButtonText = try values.decodeIfPresent(String.self, forKey: .addToCartButtonText)
            isInTrolley = try values.decodeIfPresent(Bool.self, forKey: .isInTrolley)
            isInWishlist = try values.decodeIfPresent(Bool.self, forKey: .isInWishlist)
            purchaseTypes = try values.decodeIfPresent([PurchaseTypes].self, forKey: .purchaseTypes)
            isFindMeEnable = try values.decodeIfPresent(Bool.self, forKey: .isFindMeEnable)
            saleUnitPrice = try values.decodeIfPresent(Double.self, forKey: .saleUnitPrice)
            totalReviewCount = try values.decodeIfPresent(Int.self, forKey: .totalReviewCount)
            isDeliveryOnly = try values.decodeIfPresent(Bool.self, forKey: .isDeliveryOnly)
            isDirectFromSupplier = try values.decodeIfPresent(Bool.self, forKey: .isDirectFromSupplier)
        }
        
    
    
        struct Messages : Decodable,Identifiable {
            var id: String?
            
        var secondaryMessage : String?
        
        
        enum CodingKeys: String, CodingKey {
            
            case secondaryMessage = "secondaryMessage"
            
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            secondaryMessage = try values.decodeIfPresent(String.self, forKey: .secondaryMessage)
            
        }
        
    }
    
    
    struct Price : Decodable {
        var message : String?
        var value : Double?
        var isOfferPrice : Bool?
        
        enum CodingKeys: String, CodingKey {
            
            case message = "message"
            case value = "value"
            case isOfferPrice = "isOfferPrice"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            value = try values.decodeIfPresent(Double.self, forKey: .value)
            isOfferPrice = try values.decodeIfPresent(Bool.self, forKey: .isOfferPrice)
        }
        
    }
    
    struct PurchaseTypes : Codable {
        var purchaseType : String?
        var displayName : String?
        var unitPrice : Double?
        var minQtyLimit : Int?
        var maxQtyLimit : Int?
        var cartQty : Int?
        
        enum CodingKeys: String, CodingKey {
            
            case purchaseType = "purchaseType"
            case displayName = "displayName"
            case unitPrice = "unitPrice"
            case minQtyLimit = "minQtyLimit"
            case maxQtyLimit = "maxQtyLimit"
            case cartQty = "cartQty"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            purchaseType = try values.decodeIfPresent(String.self, forKey: .purchaseType)
            displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
            unitPrice = try values.decodeIfPresent(Double.self, forKey: .unitPrice)
            minQtyLimit = try values.decodeIfPresent(Int.self, forKey: .minQtyLimit)
            maxQtyLimit = try values.decodeIfPresent(Int.self, forKey: .maxQtyLimit)
            cartQty = try values.decodeIfPresent(Int.self, forKey: .cartQty)
        }
        
    }
    }

    

