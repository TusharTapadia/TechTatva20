import Foundation
struct Instagram: Decodable {
    let entry_data: ProfilePage
}

struct ProfilePage: Decodable {
    let ProfilePage: [Graphql1]
}

struct Graphql1: Decodable {
    let graphql: User1
}

struct User1: Decodable {
    let user: Edge_owner_to_timeline_media
}

struct Edge_owner_to_timeline_media: Decodable {
    let edge_owner_to_timeline_media: Edges
}

struct Edges: Decodable {
    let edges: [Node]
}

struct Node: Decodable {
    let node: Media
}

struct Media: Decodable {
    let display_url: String
    let shortcode: String
    let edge_liked_by: Like
    let edge_media_to_comment: Comment
}

struct Like: Decodable {
   let count: Int
}

struct Comment: Decodable {
    let count: Int
}
