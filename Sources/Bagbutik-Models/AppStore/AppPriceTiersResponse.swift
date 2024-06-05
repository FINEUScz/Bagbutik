import Bagbutik_Core
import Foundation

/**
 # AppPriceTiersResponse
 A response that contains a list of App Price Tier resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricetiersresponse>
 */
public struct AppPriceTiersResponse: Codable, PagedResponse {
    public typealias Data = AppPriceTier

    /// The resource data.
    public let data: [AppPriceTier]
    /// The requested relationship data. Note: `AppPricePoint` is deprecated.
    public var included: [AppPricePoint]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [AppPriceTier],
                included: [AppPricePoint]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AppPriceTier].self, forKey: "data")
        included = try container.decodeIfPresent([AppPricePoint].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}
