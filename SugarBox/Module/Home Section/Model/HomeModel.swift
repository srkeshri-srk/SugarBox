//
//  HomeModel.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import Foundation


// MARK: - HomeModel
struct HomeModel: Codable {
    let data: [DataModel]?
    let pagination: Pagination?
}

// MARK: - Datum
struct DataModel: Codable {
    let id, contentID, createdAt, description: String?
    let title, updatedAt: String?
    let contents: [Content]?
    let datumID, addedOn: String?
    let designID: DesignID?
    let designMeta: DesignMeta?
    let designSlug: DesignSlug?
    let widgetType: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case contentID = "contentId"
        case createdAt, description, title, updatedAt, contents
        case datumID = "id"
        case addedOn
        case designID = "designId"
        case designMeta, designSlug, widgetType
    }
}

enum DesignSlug: String, Codable {
    case carousal = "CarousalWidget"
    case ottContent = "OTTWidget"
}

// MARK: - Content
struct Content: Codable {
    let id, contentID: String?
    let assets: [Asset]?
    let contentType: ContentType?
    let description: String?
    let isLicensed: Bool?
    let metaData: MetaData?
    let partnerContentID: String?
    let partnerID: Int?
    let releaseDate, title: String?
    let partnerDetails: PartnerDetails?
    let partnerName: PartnerName?
    let addedOn: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case contentID = "contentId"
        case assets, contentType, description, isLicensed, metaData
        case partnerContentID = "partnerContentId"
        case partnerID = "partnerId"
        case releaseDate, title, partnerDetails, partnerName, addedOn
    }
}

extension Content {
    var thumbnailImageAsset: [Asset] {
        assets?.filter{ $0.assetType == .image && $0.type == .thumbnailList } ?? []
    }
}

// MARK: - Asset
struct Asset: Codable {
    let assetType: AssetType?
    let sourceURL: String?
    let type: TypeEnum?
    let sourcePath: String?

    enum CodingKeys: String, CodingKey {
        case assetType
        case sourceURL = "sourceUrl"
        case type, sourcePath
    }
}

enum AssetType: String, Codable {
    case image = "IMAGE"
    case video = "VIDEO"
}

enum TypeEnum: String, Codable {
    case dash = "dash"
    case detail = "detail"
    case hls = "hls"
    case thumbnail = "thumbnail"
    case thumbnailList = "thumbnail_list"
}

enum ContentType: String, Codable {
    case movie = "Movie"
    case show = "Show"
}

// MARK: - MetaData
struct MetaData: Codable {
    let duration: Int?
    let isNonCompressed: Bool?
    let episodeNumber: Int?
    let enableDownloadOnDongle, hasAssets, shouldHaveChildren: Bool?
    let ageRating: AgeRating?

    enum CodingKeys: String, CodingKey {
        case duration, isNonCompressed
        case episodeNumber = "episode_number"
        case enableDownloadOnDongle, hasAssets, shouldHaveChildren, ageRating
    }
}

enum AgeRating: String, Codable {
    case a = "A"
    case u = "U"
    case uA13 = "U/A 13+"
    case uA16 = "U/A 16+"
    case uA7 = "U/A 7+"
}

// MARK: - PartnerDetails
struct PartnerDetails: Codable {
    let partnerID: Int?
    let partnerName: PartnerName?
    let partnerShortName: PartnerShortName?

    enum CodingKeys: String, CodingKey {
        case partnerID = "partnerId"
        case partnerName, partnerShortName
    }
}

enum PartnerName: String, Codable {
    case zee5 = "ZEE5"
}

enum PartnerShortName: String, Codable {
    case zee5 = "zee5"
}

// MARK: - DesignID
struct DesignID: Codable {
    let id, designSlug: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case designSlug
    }
}

// MARK: - DesignMeta
struct DesignMeta: Codable {
    let title, backgroundImage: String?
    let isSpacerViewReq, isItemTitleReq: Bool?
}

// MARK: - Pagination
struct Pagination: Codable {
    let totalPages, currentPage, perPage, totalCount: Int?
}
