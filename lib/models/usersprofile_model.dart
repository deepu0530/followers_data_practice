// To parse this JSON data, do
//
//     final usersProfileModel = usersProfileModelFromJson(jsonString);

import 'dart:convert';

UsersProfileModel usersProfileModelFromJson(String str) => UsersProfileModel.fromJson(json.decode(str));

String usersProfileModelToJson(UsersProfileModel data) => json.encode(data.toJson());

class UsersProfileModel {
    UsersProfileModel({
        required this.login,
        required this.id,
        required this.nodeId,
        required this.avatarUrl,
        required this.gravatarId,
        required this.url,
        required this.htmlUrl,
        required this.followersUrl,
        required this.followingUrl,
        required this.gistsUrl,
        required this.starredUrl,
        required this.subscriptionsUrl,
        required this.organizationsUrl,
        required this.reposUrl,
        required this.eventsUrl,
        required this.receivedEventsUrl,
        required this.type,
        required this.siteAdmin,
        required this.name,
        required this.company,
        required this.blog,
        required this.location,
        this.email,
        this.hireable,
        this.bio,
        this.twitterUsername,
        required this.publicRepos,
        required this.publicGists,
        required this.followers,
        required this.following,
        required this.createdAt,
        required this.updatedAt,
    });

    String login;
    int id;
    String nodeId;
    String avatarUrl;
    String gravatarId;
    String url;
    String htmlUrl;
    String followersUrl;
    String followingUrl;
    String gistsUrl;
    String starredUrl;
    String subscriptionsUrl;
    String organizationsUrl;
    String reposUrl;
    String eventsUrl;
    String receivedEventsUrl;
    String type;
    bool siteAdmin;
    String name;
    String company;
    String blog;
    String location;
    dynamic email;
    dynamic hireable;
    dynamic bio;
    dynamic twitterUsername;
    int publicRepos;
    int publicGists;
    int followers;
    int following;
    String createdAt;
    String updatedAt;

    factory UsersProfileModel.fromJson(Map<String, dynamic> json) => UsersProfileModel(
        login: json["login"] == null ? null : json["login"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        gravatarId: json["gravatar_id"] == null ? null : json["gravatar_id"],
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        followersUrl: json["followers_url"] == null ? null : json["followers_url"],
        followingUrl: json["following_url"] == null ? null : json["following_url"],
        gistsUrl: json["gists_url"] == null ? null : json["gists_url"],
        starredUrl: json["starred_url"] == null ? null : json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"] == null ? null : json["subscriptions_url"],
        organizationsUrl: json["organizations_url"] == null ? null : json["organizations_url"],
        reposUrl: json["repos_url"] == null ? null : json["repos_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        receivedEventsUrl: json["received_events_url"] == null ? null : json["received_events_url"],
        type: json["type"] == null ? null : json["type"],
        siteAdmin: json["site_admin"] == null ? null : json["site_admin"],
        name: json["name"] == null ? null : json["name"],
        company: json["company"] == null ? null : json["company"],
        blog: json["blog"] == null ? null : json["blog"],
        location: json["location"] == null ? null : json["location"],
        email: json["email"],
        hireable: json["hireable"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"] == null ? null : json["public_repos"],
        publicGists: json["public_gists"] == null ? null : json["public_gists"],
        followers: json["followers"] == null ? null : json["followers"],
        following: json["following"] == null ? null : json["following"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "gravatar_id": gravatarId == null ? null : gravatarId,
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "followers_url": followersUrl == null ? null : followersUrl,
        "following_url": followingUrl == null ? null : followingUrl,
        "gists_url": gistsUrl == null ? null : gistsUrl,
        "starred_url": starredUrl == null ? null : starredUrl,
        "subscriptions_url": subscriptionsUrl == null ? null : subscriptionsUrl,
        "organizations_url": organizationsUrl == null ? null : organizationsUrl,
        "repos_url": reposUrl == null ? null : reposUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "received_events_url": receivedEventsUrl == null ? null : receivedEventsUrl,
        "type": type == null ? null : type,
        "site_admin": siteAdmin == null ? null : siteAdmin,
        "name": name == null ? null : name,
        "company": company == null ? null : company,
        "blog": blog == null ? null : blog,
        "location": location == null ? null : location,
        "email": email,
        "hireable": hireable,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos == null ? null : publicRepos,
        "public_gists": publicGists == null ? null : publicGists,
        "followers": followers == null ? null : followers,
        "following": following == null ? null : following,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
    };
}
