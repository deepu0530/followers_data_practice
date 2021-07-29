// To parse this JSON data, do
//
//     final organizationsModel = organizationsModelFromJson(jsonString);

import 'dart:convert';

List<OrganizationsModel> organizationsModelFromJson(String str) => List<OrganizationsModel>.from(json.decode(str).map((x) => OrganizationsModel.fromJson(x)));

String organizationsModelToJson(List<OrganizationsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrganizationsModel {
    OrganizationsModel({
        required this.login,
        required this.id,
        required this.nodeId,
        required this.url,
        required this.reposUrl,
        required this.eventsUrl,
        required this.hooksUrl,
        required this.issuesUrl,
        required this.membersUrl,
        required this.publicMembersUrl,
        required this.avatarUrl,
        required this.description,
    });

    String login;
    int id;
    String nodeId;
    String url;
    String reposUrl;
    String eventsUrl;
    String hooksUrl;
    String issuesUrl;
    String membersUrl;
    String publicMembersUrl;
    String avatarUrl;
    String description;

    factory OrganizationsModel.fromJson(Map<String, dynamic> json) => OrganizationsModel(
        login: json["login"] == null ? null : json["login"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        url: json["url"] == null ? null : json["url"],
        reposUrl: json["repos_url"] == null ? null : json["repos_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        hooksUrl: json["hooks_url"] == null ? null : json["hooks_url"],
        issuesUrl: json["issues_url"] == null ? null : json["issues_url"],
        membersUrl: json["members_url"] == null ? null : json["members_url"],
        publicMembersUrl: json["public_members_url"] == null ? null : json["public_members_url"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "url": url == null ? null : url,
        "repos_url": reposUrl == null ? null : reposUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "hooks_url": hooksUrl == null ? null : hooksUrl,
        "issues_url": issuesUrl == null ? null : issuesUrl,
        "members_url": membersUrl == null ? null : membersUrl,
        "public_members_url": publicMembersUrl == null ? null : publicMembersUrl,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "description": description == null ? null : description,
    };
}
