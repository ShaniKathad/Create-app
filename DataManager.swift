//
//  DataManager.swift
//  Talabtech
//
//  Created by Nirav Sapariya on 19/05/18.
//  Copyright © 2018 NMS. All rights reserved.
//

import UIKit

class User: NSObject
{
    private let keys = ["userId","firstName","lastName","profileName","email","userType","emailActive","address","userImage"]
    
    @objc var userId = ""
    @objc var firstName = ""
    @objc var lastName = ""
    @objc var profileName = ""
    @objc var email = ""
    @objc var userType = ""
    @objc var address = ""
    @objc var userImage = ""
    
    override init()
    {
        super.init()
    }
    
    init(dic:[String:Any])
    {
        super.init()
        self.userId = dic["userId"] as? String ?? "nn"
        self.firstName = dic["firstName"] as? String ?? "nn"
        self.lastName = dic["lastName"] as? String ?? "nn"
        self.profileName = dic["profileName"] as? String ?? "nn"
        self.email = dic["email"] as? String ?? "nn"
        self.userType = dic["userType"] as? String ?? "nn"
        self.address = dic["address"] as? String ?? "$nn"
        self.userImage = dic["userImage"] as? String ?? "nn"
    }
    
    init(userData dic:[String:Any])
    {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    var dictionary:[String:Any]
    {
        return self.dictionaryWithValues(forKeys: keys)
    }
    
}
class discoverMusic
{
    var noofplay:String
    var perLink:String
    var profileLink:String
    var title:String
    var trackId:String
    var trackImage:String
    var trackPath:String
    var userId:String
    var user_name:String
    var surahs:String
    var verse:String

    init(data:[String:Any])
    {
        self.noofplay = data["noofplay"] as? String ?? ""
        self.perLink = data["perLink"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
        self.user_name = data["user_name"] as? String ?? ""
        self.surahs = data["surahs"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
    }
}
    
class MusicFeedList
{
    var final_img:String
    var perLink:String
    var profileName:String
    var user_img:String
    var desc:String
    var title:String
    var trackId:String
    var noofplay:String
    var likes:String
    var totReposted:String
    var totComments:String
    var timeLength:String
    var userProfileName:String
    var by_uploader_image:String
    var type_text:String
    var isVisible:String
    var reposted_exists:String
    var like_exists:String
    var stream_url:String
    var type1:String
    var cdate:String
    var shareUrl:String
    var surahs:String
    var verse:String
    
    init(data:[String:Any])
    {
        self.final_img = data["final_img"] as? String ?? ""
        self.perLink = data["perLink"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.user_img = data["user_img"] as? String ?? ""
        self.desc = data["desc"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.likes = data["likes"] as? String ?? ""
        self.totReposted = data["totReposted"] as? String ?? ""
        self.totComments = data["totComments"] as? String ?? ""
        self.timeLength = data["timeLength"] as? String ?? ""
        self.userProfileName = data["userProfileName"] as? String ?? ""
        self.by_uploader_image = data["by_uploader_image"] as? String ?? ""
        self.type_text = data["type_text"] as? String ?? ""
        self.isVisible = data["isVisible"] as? String ?? ""
        self.reposted_exists = data["reposted_exists"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.stream_url = data["stream_url"] as? String ?? ""
        self.type1 = data["type1"] as? String ?? ""
        self.cdate = data["cdate"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.surahs = data["surahs"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
    }
}
class PlaysetsList
{
    var playlistId:String
    var name:String
    var playset_image:String
    var total_tracks:String
    var like_exists:String
    var totShare:String
    var shareUrl:String
    var profileName:String
    var profileLink:String
    var createdDate:String
    
    init(data:[String:Any])
    {
        self.playlistId = data["playlistId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.playset_image = data["playset_image"] as? String ?? ""
        self.total_tracks = data["total_tracks"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.totShare = data["totShare"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.createdDate = data["createdDate"] as? String ?? ""
    }
}
class HomePageClass
{
    var exclusiveAlbumHome = [ExclusiveAlbumHome]()
    var newAlbum = [ExclusiveAlbumHome]()
    var newTrackHome = [NewTrackHome]()
    var topPlayListHome = [TopPlayListHome]()
    var newMemberList = [NewMemberList]()
    
    init(data:[String:Any])
    {
        let exclusiveAlbum = data["exclusiveAlbum"] as? [Any] ?? [Any]()
        self.exclusiveAlbumHome = exclusiveAlbum.map({ExclusiveAlbumHome(data: $0 as! [String:Any])})
        self.newAlbum = (data["newAlbum"] as! [Any]).map({ExclusiveAlbumHome(data: $0 as! [String:Any])})
        self.newTrackHome = (data["newTrack"] as! [Any]).map({NewTrackHome(data: $0 as! [String:Any])})
        self.topPlayListHome = (data["topPlayList"] as! [Any]).map({TopPlayListHome(data: $0 as! [String:Any])})
        self.newMemberList = (data["newMemberList"] as! [Any]).map({NewMemberList(data: $0 as! [String:Any])})
    }
}

class HomePageWithOutLoginClass
{
    var newMemberList = [NewMemberList]()
    var siteImage:String
    var description:String

    init(data:[String:Any])
    {
        self.siteImage = data["siteImage"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.newMemberList = (data["newMemberList"] as! [Any]).map({NewMemberList(data: $0 as! [String:Any])})
    }
}
class ExclusiveAlbumHome
{
    var albumId:String
    var name:String
    var album_image:String
    var albumLink:String

    init(data:[String:Any])
    {
        self.albumId = data["albumId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.album_image = data["album_image"] as? String ?? ""
        self.albumLink = data["albumLink"] as? String ?? ""
    }
}
class NewTrackHome
{
    var newTrack:String
    var trackId:String
    var trackImage:String
    var trackLink:String
    
    init(data:[String:Any])
    {
        self.newTrack = data["newTrack"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackLink = data["trackLink"] as? String ?? ""
    }
}
class TopPlayListHome
{
    var playlistId:String
    var name:String
    var playset_image:String
    var profileName:String
    var playListLink:String
    var profileLink:String
    
    init(data:[String:Any])
    {
        self.playlistId = data["playlistId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.playset_image = data["playset_image"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.playListLink = data["playListLink"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
    }
}

class NewMemberList
{
    var profileName:String
    var profilePic:String
    var profileLink:String
    var userId:String
    
    init(data:[String:Any])
    {
        self.profileName = data["profileName"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
    }
}

class PlayerTrackList
{
    var trackName:String
    var trackImage:String
    var trackLink:String
    
    init(trackName:String,trackImage:String,trackLink:String)
    {
        self.trackName = trackName
        self.trackImage = trackImage
        self.trackLink = trackLink
    }
}
class MyMusicList
{
    var trackId:String
    var title:String
    var desc:String
    var userId:String
    var likes:String
    var noofplay:String
    var totShare:String
    var totComments:String
    var totReposted:String
    var isActive:String
    var download_enable:String
    var trackImage:String
    var trackPath:String
    var dir:String
    var firstName:String
    var lastName:String
    var profileLink:String
    var profileName:String
    var profilePic:String
    var userpicdir:String
    var track_dir:String
    var like_exists:String
    var surah:String
    var verse:String
    var shareUrl:String
    var isExclusive:String

    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.desc = data["desc"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
        self.likes = data["likes"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.totShare = data["totShare"] as? String ?? ""
        self.totComments = data["totComments"] as? String ?? ""
        self.totReposted = data["totReposted"] as? String ?? ""
        self.isActive = data["isActive"] as? String ?? ""
        self.download_enable = data["download_enable"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.dir = data["dir"] as? String ?? ""
        self.firstName = data["firstName"] as? String ?? ""
        self.lastName = data["lastName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.userpicdir = data["userpicdir"] as? String ?? ""
        self.track_dir = data["userpicdir"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.surah = data["surah"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.isExclusive = data["isExclusive"] as? String ?? ""
    }
}
class MyCreatedGroup
{
    var groupId:String
    var groupName:String
    var groupImage:String
    var totTracks:String
    var groupUrl:String
    var createdDate:String
    var creatorId:String
    var isEditDelete:String

    init(data:[String:Any])
    {
        self.groupId = data["groupId"] as? String ?? ""
        self.groupName = data["groupName"] as? String ?? ""
        self.groupImage = data["groupImage"] as? String ?? ""
        self.totTracks = data["totTracks"] as? String ?? ""
        self.groupUrl = data["groupUrl"] as? String ?? ""
        self.createdDate = data["createdDate"] as? String ?? ""
        self.creatorId = data["creatorId"] as? String ?? ""
        self.isEditDelete = data["isEditDelete"] as? String ?? ""
    }
}
class GroupYouToJoin
{
    var groupId:String
    var groupName:String
    var groupImage:String
    var totTracks:String
    var groupUrl:String
    var groupMembers:String
    var isJoinGroup:String
    var creatorId:String

    init(data:[String:Any])
    {
        self.groupId = data["groupId"] as? String ?? ""
        self.groupName = data["groupName"] as? String ?? ""
        self.groupImage = data["groupImage"] as? String ?? ""
        self.totTracks = data["totTracks"] as? String ?? ""
        self.groupUrl = data["groupUrl"] as? String ?? ""
        self.groupMembers = data["groupMembers"] as? String ?? ""
        self.isJoinGroup = data["isJoinGroup"] as? String ?? ""
        self.creatorId = data["creatorId"] as? String ?? ""
    }
}
class Dashboard{
    var count_today:String = ""
    var count_yesterday:String = ""
    var total_count:String = ""
    
    init(data:[String:Any]) {
        self.count_today = data["count_today"] as? String ?? ""
        self.count_yesterday = data["count_yesterday"] as? String ?? ""
        self.total_count = data["total_count"] as? String ?? ""
    }
}

class DashboardTrackYouLike
{
    var trackId:String = ""
    var title:String = ""
    var trackImage:String = ""
    var trackPath:String = ""
    var trackUrl:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var surahs:String = ""
    var verse:String = ""
    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.trackUrl = data["trackUrl"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.surahs = data["surahs"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
    }
}

class DashboardMyPlaylist
{
    var playlistId:String = ""
    var name:String = ""
    var playset_image:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    
    init(data:[String:Any])
    {
        self.playlistId = data["playlistId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.playset_image = data["playset_image"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
    }
}

class DashboardCommentList
{
    var commentId:String = ""
    var trackId:String = ""
    var commentatorId:String = ""
    var comment:String = ""
    var profilePic:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var timeDuration:String = ""
    
    init(data:[String:Any])
    {
        self.commentId = data["commentId"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.commentatorId = data["commentatorId"] as? String ?? ""
        self.comment = data["comment"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.timeDuration = data["timeDuration"] as? String ?? ""
    }
}

class TrackDetails
{
    var id:String = ""
    var title:String = ""
    var userId:String = ""
    var trackPath:String = ""
    var profileName:String = ""
    var shareUrl:String = ""
    var noofplay:String = ""
    var totShare:String = ""
    var totReposted:String = ""
    var totlikes:String = ""
    var downloadPath:String = ""
    var total_comments:String = ""
    var like:String = ""
    var count_today_records:String = ""
    var count_yester_records:String = ""
    var total_play:String = ""
    
    var verse_id:String = ""
    var surahs_id:String = ""
    var verse:String = ""
    var surahs:String = ""
    var track_disable_comment:String = ""
    var isVisible:String = ""
    var in_playset_number:String = ""
    var isCommenetable:String = ""
    var isDownloadable:String = ""
    var description:String = ""
    var trackImage:String = ""
    var licensing:String = ""
    var share_alike:String = ""
    var non_deraverative:String = ""
    var attribution:String = ""
    var non_commercial:String = ""
   
    var similarTracks = [SimilarTracks]()
    var albums = [EditAlbumTagList]()
    var comments = [TrackDetailsComment]()

    init(data:[String:Any])
    {
        self.trackImage = data["trackImage"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.totShare = data["totShare"] as? String ?? ""
        self.totReposted = data["totReposted"] as? String ?? ""
        self.totlikes = data["totlikes"] as? String ?? ""
        self.downloadPath = data["downloadPath"] as? String ?? ""
        self.total_comments = data["total_comments"] as? String ?? ""
        self.like = data["like"] as? String ?? ""
        self.count_today_records = data["count_today_records"] as? String ?? ""
        self.count_yester_records = data["count_yester_records"] as? String ?? ""
        self.total_play = data["total_play"] as? String ?? ""
        
        self.verse_id = data["verse_id"] as? String ?? ""
        self.surahs_id = data["surahs_id"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
        self.surahs = data["surahs"] as? String ?? ""
        self.track_disable_comment = data["track_disable_comment"] as? String ?? ""
        self.isVisible = data["isVisible"] as? String ?? ""
        self.in_playset_number = data["in_playset_number"] as? String ?? ""
        self.isCommenetable = data["isCommenetable"] as? String ?? ""
        self.isDownloadable = data["isDownloadable"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        
        self.licensing = data["licensing"] as? String ?? ""
        self.share_alike = data["share_alike"] as? String ?? ""
        self.non_deraverative = data["non_deraverative"] as? String ?? ""
        self.attribution = data["attribution"] as? String ?? ""
        self.non_commercial = data["non_commercial"] as? String ?? ""
        
        self.similarTracks = (data["similar_track"] as! [Any]).map({SimilarTracks(data: $0 as! [String:Any])})
        self.albums = (data["albums"] as! [Any]).map({EditAlbumTagList(data: $0 as! [String:Any])})
        self.comments = (data["comments"] as! [Any]).map({TrackDetailsComment(data: $0 as! [String:Any])})
    }
}

class SimilarTracks
{
    var trackId:String = ""
    var like:String = ""
    var title:String = ""
    var profileName:String = ""
    var trackImage:String = ""
    var noofplay:String = ""
    var likes:String = ""
    var totComments:String = ""
    var trackPath:String = ""
    var surahs:String=""
    var verse:String=""

    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.like = data["like"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.likes = data["likes"] as? String ?? ""
        self.totComments = data["totComments"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.surahs = data["surahs"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
    }
}

class TrackDetailsComment
{
    var comment_id:String = ""
    var trackId:String = ""
    var comment:String = ""
    var time_ago:String = ""
    var isparent:String = ""
    var from:TrackDetailsFromComment
    
    init(data:[String:Any])
    {
        self.comment_id = data["comment_id"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.comment = data["comment"] as? String ?? ""
        self.time_ago = data["time_ago"] as? String ?? ""
        self.isparent = data["isparent"] as? String ?? ""
        self.from = TrackDetailsFromComment(data: data["from"] as? dictionary ?? [:])
    }
}
class TrackDetailsFromComment
{
    var id:String = ""
    var kind:String = ""
    var permalink:String = ""
    var username:String = ""
    var uri:String = ""
    var permalink_url:String = ""
    var avatar_url:String = ""
    var country:String = ""
    var first_name:String = ""
    var last_name:String = ""
    var full_name:String = ""
    var description:String = ""
    var city:String = ""
    var track_count:String = ""
    var playlist_count:String = ""
    var followings_count:String = ""
    var followers_count:String = ""
    
    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.kind = data["kind"] as? String ?? ""
        self.permalink = data["permalink"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.uri = data["uri"] as? String ?? ""
        self.permalink_url = data["permalink_url"] as? String ?? ""
        self.avatar_url = data["avatar_url"] as? String ?? ""
        self.country = data["country"] as? String ?? ""
        self.first_name = data["first_name"] as? String ?? ""
        self.last_name = data["last_name"] as? String ?? ""
        self.full_name = data["full_name"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.city = data["city"] as? String ?? ""
        self.track_count = data["track_count"] as? String ?? ""
        self.playlist_count = data["playlist_count"] as? String ?? ""
        self.followings_count = data["followings_count"] as? String ?? ""
        self.followers_count = data["followers_count"] as? String ?? ""
    }
}

class MyGroupList
{
    var groupId:String = ""
    var groupName:String = ""
    var groupImage:String = ""
    var totTracks:String = ""
    var trackImage:String = ""
    var createdDate:String = ""
    
    init(data:[String:Any])
    {
        self.groupId = data["groupId"] as? String ?? ""
        self.groupName = data["groupName"] as? String ?? ""
        self.groupImage = data["groupImage"] as? String ?? ""
        self.totTracks = data["totTracks"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.createdDate = data["createdDate"] as? String ?? ""
    }
}

class OtherUserDetails
{
    var profile_name:String = ""
    var isVerified:String = ""
    var isFollow:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var aboutme:String = ""
    var fb:String = ""
    var twitter:String = ""
    var gplus:String = ""
    var youtube:String = ""
    var other5:String = ""
    var other6:String = ""
    var other7:String = ""
    var other8:String = ""
    var profession:String = ""
    var tags = [OtherUserProfileTags]()

    init(data:[String:Any])
    {
        self.profile_name = data["profile_name"] as? String ?? ""
        self.isVerified = data["isVerified"] as? String ?? ""
        self.isFollow = data["isFollow"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.aboutme = data["aboutme"] as? String ?? ""
        self.fb = data["fb"] as? String ?? ""
        self.twitter = data["twitter"] as? String ?? ""
        self.gplus = data["gplus"] as? String ?? ""
        self.youtube = data["youtube"] as? String ?? ""
        self.other5 = data["other5"] as? String ?? ""
        self.other6 = data["other6"] as? String ?? ""
        self.other7 = data["other7"] as? String ?? ""
        self.other8 = data["other8"] as? String ?? ""
        self.profession = data["profession"] as? String ?? ""
        self.twitter = data["twitter"] as? String ?? ""
        self.tags = (data["tags"] as! [Any]).map({OtherUserProfileTags(data: $0 as! [String:Any])})
    }
}

class TrackDetailsTagList
{
    var categoryName:String = ""
    
    init(data:[String:Any])
    {
        self.categoryName = data["categoryName"] as? String ?? ""
    }
}
class TrackDetailsCommentList
{
    var comment_id:String = ""
    var username:String = ""
    var profileLink:String = ""
    var permalink_url:String = ""
    var commentatorId:String = ""
    var trackId:String = ""
    var comment:String = ""
    var timeDuration:String = ""
    var date:String = ""
    
    init(data:[String:Any])
    {
        self.comment_id = data["comment_id"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.permalink_url = data["permalink_url"] as? String ?? ""
        self.commentatorId = data["commentatorId"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.comment = data["comment"] as? String ?? ""
        self.timeDuration = data["timeDuration"] as? String ?? ""
        self.date = data["date"] as? String ?? ""
    }
}

class TrackTags
{
    var tag:String
    
    init(data:[String:Any])
    {
        self.tag = data["tag"] as? String ?? ""
    }
}

class OtherUserProfileTags
{
    var categoryName:String = ""
    init(data:[String:Any])
    {
        self.categoryName = data["categoryName"] as? String ?? ""
    }
}
class AlbumDetailsData
{
    
    var album_name:String = ""
    var album_image:String = ""
    var shareUrl:String = ""
    var album_own_userId:String = ""
    var track = [AlbumTrackList]()
    
    init(data:[String:Any])
    {
        self.album_name = data["album_name"] as? String ?? ""
        self.album_image = data["album_image"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.album_own_userId = data["album_own_userId"] as? String ?? ""
        self.track = (data["track"] as! [Any]).map({AlbumTrackList(data: $0 as! [String:Any])})
    }
}
class AlbumTrackList
{
    var trackName:String
    var trackId:String
    var noofplay:String
    var trackUrl:String
    var trackImage:String
    
    init(data:[String:Any])
    {
        self.trackName = data["newTrack"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.trackUrl = data["trackUrl"] as? String ?? ""
    }
}
class NotificationList
{
    var userId:String
    var img:String
    var profileName:String
    var notification_text:String
    var date:String
    var link_name:String
    var notificationId:String
    var isRead:String
    var attach_name:String
    var from_userid:String
    var action:String

    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.img = data["img"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.notification_text = data["notification_text"] as? String ?? ""
        self.date = data["date"] as? String ?? ""
        self.link_name = data["link_name"] as? String ?? ""
        self.notificationId = data["notificationId"] as? String ?? ""
        self.isRead = data["isRead"] as? String ?? ""
        self.attach_name = data["attach_name"] as? String ?? ""
        self.from_userid = data["from_userid"] as? String ?? ""
        self.action = data["action"] as? String ?? ""
    }
}
class MyProfileSocialDetails
{
    var fb:String
    var twitter:String
    var gplus:String
    var youtube:String
    var other5:String
    var other6:String
    var other7:String
    var other8:String
    
    init(data:[String:Any])
    {
        self.fb = data["fb"] as? String ?? ""
        self.twitter = data["twitter"] as? String ?? ""
        self.gplus = data["gplus"] as? String ?? ""
        self.youtube = data["youtube"] as? String ?? ""
        self.other5 = data["other5"] as? String ?? ""
        self.other6 = data["other6"] as? String ?? ""
        self.other7 = data["other7"] as? String ?? ""
        self.other8 = data["other8"] as? String ?? ""
    }
}
class MyProfileBasicDetails
{
    var profile_name:String
    var profileLink:String
    var full_name:String
    var profile_photo:String
    var userType:String
    var firstname:String
    var middlename:String
    var lastname:String
    var paypal_email:String
    var description:String
    var countryId:String
    var stateId:String
    var cityId:String
    var countryName:String
    var stateName:String
    var cityName:String
    var address:String
    var jobName:String
    
    init(data:[String:Any])
    {
        self.profile_name = data["profile_name"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
       
        self.full_name = data["full_name"] as? String ?? ""
        self.profile_photo = data["profile_photo"] as? String ?? ""
        self.userType = data["userType"] as? String ?? ""
        self.firstname = data["firstname"] as? String ?? ""
        self.middlename = data["middlename"] as? String ?? ""
        self.lastname = data["lastname"] as? String ?? ""
        self.paypal_email = data["paypal_email"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.countryId = data["countryId"] as? String ?? ""
        self.stateId = data["stateId"] as? String ?? ""
        self.cityId = data["cityId"] as? String ?? ""
        self.countryName = data["countryName"] as? String ?? ""
        self.stateName = data["stateName"] as? String ?? ""
        self.cityName = data["cityName"] as? String ?? ""
        self.address = data["address"] as? String ?? ""
        self.jobName = data["jobName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
    }
}
class MyProfileDetails
{
    var profile_name:String
    var profileLink:String
    var full_name:String
    var profilePic:String
    var favoriteBands:String
    var aboutme:String
    var profession:String
    var isVerified:String
    var fb:String
    var twitter:String
    var gplus:String
    var youtube:String
    var other5:String
    var other6:String
    var other7:String
    var other8:String
    var location:String
    var isFollow:String
    var userType:String
    var myMusicList = [MyMusicList]()
    var myProfileFavouriteRecitals = [MyProfileFavouriteRecitals]()
    var myProfileFollowers = [MyProfileFollowers]()
    
    init(data:[String:Any])
    {
        self.profile_name = data["profile_name"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.full_name = data["full_name"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.favoriteBands = data["favoriteBands"] as? String ?? ""
        self.aboutme = data["aboutme"] as? String ?? ""
        self.profession = data["profession"] as? String ?? ""
        self.isVerified = data["isVerified"] as? String ?? ""
        self.fb = data["fb"] as? String ?? ""
        self.twitter = data["twitter"] as? String ?? ""
        self.gplus = data["gplus"] as? String ?? ""
        self.youtube = data["youtube"] as? String ?? ""
        self.other5 = data["other5"] as? String ?? ""
        self.other6 = data["other6"] as? String ?? ""
        self.other7 = data["other7"] as? String ?? ""
        self.other8 = data["other8"] as? String ?? ""
        self.location = data["location"] as? String ?? ""
        self.isFollow = data["isFollow"] as? String ?? ""
        self.userType = data["userType"] as? String ?? ""
        self.myMusicList = (data["my_musics"] as! [Any]).map({MyMusicList(data: $0 as! [String:Any])})
        self.myProfileFavouriteRecitals = (data["my_fav_recital"] as! [Any]).map({MyProfileFavouriteRecitals(data: $0 as! [String:Any])})
        self.myProfileFollowers = (data["my_followers"] as! [Any]).map({MyProfileFollowers(data: $0 as! [String:Any])})
    }
}

class MyProfileFavouriteRecitals
{
    var trackId:String
    var title:String
    var trackImage:String
    var like_exists:String
    var isEditDelete:String
    var totShare:String
    var shareUrl:String
    var trackPath:String
    var profileName:String
    
    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.isEditDelete = data["isEditDelete"] as? String ?? ""
        self.totShare = data["totShare"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
    }
}
class MyProfileFollowers
{
    var userId:String
    var profileName:String
    var profileLink:String
    var profilePic:String
    var totalTrack:String
    var totalFollowers:String
    var isFollowed:String
    var address:String
    
    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.totalTrack = data["totalTrack"] as? String ?? ""
        self.totalFollowers = data["totalFollowers"] as? String ?? ""
        self.isFollowed = data["isFollowed"] as? String ?? ""
        self.address = data["address"] as? String ?? ""
    }
}

class MyUploadedTrack
{
    var title:String
    var id:String
    var date:String
   
    init(data:[String:Any])
    {
        self.title = data["title"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.date = data["date"] as? String ?? ""
    }
}
class MyProfileBasicDetails123
{
    var profile_name:String
    var profileLink:String
    var full_name:String
    var firstname:String
    var middlename:String
    var lastname:String
    var birth_date:String
    var discription:String
    var countryId:String
    var stateId:String
    var cityId:String
    var gender:String
    var address:String
    var favoriteBands:String
    var aboutme:String
    var paypalEmail:String
    var pay_point:String
    var paymentMethod:String
    var professional_id:String
    var countryName:String
    var stateName:String
    var cityName:String
    var profession:String

    init(data:[String:Any])
    {
        self.profile_name = data["profile_name"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.full_name = data["full_name"] as? String ?? ""
        self.firstname = data["firstname"] as? String ?? ""
        self.middlename = data["middlename"] as? String ?? ""
        self.lastname = data["lastname"] as? String ?? ""
        self.birth_date = data["birth_date"] as? String ?? ""
        self.discription = data["discription"] as? String ?? ""
        self.countryId = data["countryId"] as? String ?? ""
        self.stateId = data["stateId"] as? String ?? ""
        self.cityId = data["cityId"] as? String ?? ""
        self.gender = data["gender"] as? String ?? ""
        self.address = data["address"] as? String ?? ""
        self.favoriteBands = data["favoriteBands"] as? String ?? ""
        self.aboutme = data["aboutme"] as? String ?? ""
        self.paypalEmail = data["paypalEmail"] as? String ?? ""
        self.pay_point = data["pay_point"] as? String ?? ""
        self.paymentMethod = data["paymentMethod"] as? String ?? ""
        self.professional_id = data["professional_id"] as? String ?? ""
        self.countryName = data["countryName"] as? String ?? ""
        self.stateName = data["stateName"] as? String ?? ""
        self.cityName = data["cityName"] as? String ?? ""
        self.profession = data["cityName"] as? String ?? ""
    }
}
class CountryList
{
    var CountryId:String
    var countryName:String
    
    init(data:[String:Any])
    {
        self.CountryId = data["CountryId"] as? String ?? ""
        self.countryName = data["countryName"] as? String ?? ""
    }
}
class StateList
{
    var StateID:String
    var stateName:String
    
    init(data:[String:Any])
    {
        self.StateID = data["StateID"] as? String ?? ""
        self.stateName = data["stateName"] as? String ?? ""
    }
}
class CityList
{
        var CityId:String
        var cityName:String
        
        init(data:[String:Any])
        {
            self.CityId = data["CityId"] as? String ?? ""
            self.cityName = data["cityName"] as? String ?? ""
        }
}
class ProfessionList
{
    var jobId:String
    var jobName:String
    
    init(data:[String:Any])
    {
        self.jobId = data["jobId"] as? String ?? ""
        self.jobName = data["jobName"] as? String ?? ""
    }
}
class GenderList
{
    var genderId:String
    var genderName:String
    
    init(data:[String:Any])
    {
        self.genderId = data["genderId"] as? String ?? ""
        self.genderName = data["genderName"] as? String ?? ""
    }
}
class AccountSettingDetails
{
    var email:String
    var moderationForTrack:String
    var messageSendMe:String
    var trackActivity:String
    var followYou:String
    var albumAddAdmin:String
    var membershipPlan:String
    var verifyByAdmin:String
    var display_name:String
    var set_licensing:String
    var recieve_msg_set:String
    
    init(data:[String:Any])
    {
        self.email = data["email"] as? String ?? ""
        self.moderationForTrack = data["moderationForTrack"] as? String ?? ""
        self.messageSendMe = data["messageSendMe"] as? String ?? ""
        self.trackActivity = data["trackActivity"] as? String ?? ""
        self.followYou = data["followYou"] as? String ?? ""
        self.albumAddAdmin = data["albumAddAdmin"] as? String ?? ""
        self.membershipPlan = data["membershipPlan"] as? String ?? ""
        self.verifyByAdmin = data["verifyByAdmin"] as? String ?? ""
        self.display_name = data["display_name"] as? String ?? ""
        self.set_licensing = data["set_licensing"] as? String ?? ""
        self.recieve_msg_set = data["recieve_msg_set"] as? String ?? ""
    }
}
class TreandingCategoryList
{
    var categoryId:String
    var categoryName:String
    var categoriesParName:String
    var categoryDesc:String
    var isActive:String
    var isDisplay:String
    var createdDate:String
   
    init(data:[String:Any])
    {
        self.categoryId = data["categoryId"] as? String ?? ""
        self.categoryName = data["categoryName"] as? String ?? ""
        self.categoriesParName = data["categoriesParName"] as? String ?? ""
        self.categoryDesc = data["categoryDesc"] as? String ?? ""
        self.isActive = data["isActive"] as? String ?? ""
        self.isDisplay = data["isDisplay"] as? String ?? ""
        self.createdDate = data["createdDate"] as? String ?? ""
    }
}
class MessageList
{
    var profileName:String
    var profilePic:String
    var profileLink:String
    var userFromId:String
    var userToId:String
    var usermessageId:String
    var messageDate:String
    var subject:String
    var desc:String
    var isReaded:String
    var parentMessageId:String
    var randomNumber:String
    var isSpam:String

    init(data:[String:Any])
    {
        self.profileName = data["profileName"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.userFromId = data["userFromId"] as? String ?? ""
        self.userToId = data["userToId"] as? String ?? ""
        self.usermessageId = data["usermessageId"] as? String ?? ""
        self.messageDate = data["messageDate"] as? String ?? ""
        self.subject = data["subject"] as? String ?? ""
        self.desc = data["desc"] as? String ?? ""
        self.isReaded = data["isReaded"] as? String ?? ""
        self.parentMessageId = data["parentMessageId"] as? String ?? ""
        self.randomNumber = data["randomNumber"] as? String ?? ""
        self.isSpam = data["isSpam"] as? String ?? ""
    }
}
class MessageUserList
{
    var id:String = ""
    var name:String = ""
    var photo:String = ""
    
    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.photo = data["photo"] as? String ?? ""
    }
}
class UserChatList
{
    var usermessageId:String
    var parentMessageId:String
    var profileName:String
    var profileLink:String
    var userToId:String
    var userId:String
    var desc:String
    var messageDate:String
    var profilePic:String
    var randomNumber:String
    
    init(data:[String:Any])
    {
        self.usermessageId = data["usermessageId"] as? String ?? ""
        self.parentMessageId = data["parentMessageId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.userToId = data["userToId"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
        self.desc = data["desc"] as? String ?? ""
        self.messageDate = data["messageDate"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.randomNumber = data["randomNumber"] as? String ?? ""
    }
}
class PlaySetList
{
    var playlistId:String
    var name:String
    var playset_image:String
    var total_tracks:String
    var like_exists:String
    var totShare:String
    var shareUrl:String
    var profileName:String
    var profileLink:String
    var createdDate:String
    
    init(data:[String:Any])
    {
        self.playlistId = data["playlistId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.playset_image = data["playset_image"] as? String ?? ""
        self.total_tracks = data["total_tracks"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.totShare = data["totShare"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.createdDate = data["createdDate"] as? String ?? ""
    }
}
class PlaySetsTrackList
{
    var trackId:String
    var title:String
    var trackImage:String
    var noofplay:String
    var trackUrl:String
    var isDelete:String
    
    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.trackUrl = data["trackUrl"] as? String ?? ""
        self.isDelete = data["isDelete"] as? String ?? ""
    }
}
class MyFavouriteTrackList
{
    var like_exists:String
    var price:String
    var profileName:String
    var profileLink:String
    var shareUrl:String
    var title:String
    var totShare:String
    var trackId:String
    var trackImage:String
    var trackUrl:String
    
    init(data:[String:Any])
    {
        self.like_exists = data["like_exists"] as? String ?? ""
        self.price = data["price"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.totShare = data["totShare"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackUrl = data["trackUrl"] as? String ?? ""
    }
}

class TransactionHistory
{
    var currentPlan:String = ""
    var history = [TransactionPlanList]()
    
    init(data:[String:Any])
    {
        self.currentPlan = data["currentPlan"] as? String ?? ""
        self.history = (data["history"] as! [Any]).map({TransactionPlanList(data: $0 as! [String:Any])})
    }
}

class TransactionPlanList
{
    var plan_name:String = ""
    var price:String = ""
    var purchaseDate:String = ""
    var paymentMode:String = ""
    var expiresDate:String = ""
    var txn_id:String = ""
    
    init(data:[String:Any])
    {
        self.plan_name = data["plan_name"] as? String ?? ""
        self.price = data["price"] as? String ?? ""
        self.purchaseDate = data["purchaseDate"] as? String ?? ""
        self.paymentMode = data["paymentMode"] as? String ?? ""
        self.expiresDate = data["expiresDate"] as? String ?? ""
        self.txn_id = data["txn_id"] as? String ?? ""
    }
}
class PaymentDetailsDownloadDetailsList
{
    var trackPrice:String = ""
    var trackCommision:String = ""
    var totalDownloads:String = ""
    var minPayPoint:String = ""

    init(data:[String:Any])
    {
        self.trackPrice = data["trackPrice"] as? String ?? ""
        self.trackCommision = data["trackCommision"] as? String ?? ""
        self.totalDownloads = data["totalDownloads"] as? String ?? ""
        self.minPayPoint = data["minPayPoint"] as? String ?? ""
    }
}

class PaymentDetailsDownloadSongList
{
    var profileName:String = ""
    var profilePic:String = ""
    var trackId:String = ""
    var title:String = ""
    var total_amount:String = ""
    var paymentDate:String = ""
    
    init(data:[String:Any])
    {
        self.profileName = data["profileName"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.total_amount = data["total_amount"] as? String ?? ""
        self.paymentDate = data["paymentDate"] as? String ?? ""
    }
}

class AudioStreamingBaseValue
{
    var baseFreeMember:String = ""
    var basePremiumMember:String = ""
    var minPayPoint:String = ""
    
    init(data:[String:Any])
    {
        self.baseFreeMember = data["baseFreeMember"] as? String ?? ""
        self.basePremiumMember = data["basePremiumMember"] as? String ?? ""
        self.minPayPoint = data["minPayPoint"] as? String ?? ""
    }
}
class PaymentDetailsAudioStreamingList
{
    var profileName:String = ""
    var profilePic:String = ""
    var trackId:String = ""
    var title:String = ""
    var freePlayed:String = ""
    var premimumPlayed:String = ""
    var todayPlayed:String = ""
    var monthPlayed:String = ""
    var paidAmount:String = ""

    init(data:[String:Any])
    {
        self.profileName = data["profileName"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.freePlayed = data["freePlayed"] as? String ?? ""
        self.premimumPlayed = data["premimumPlayed"] as? String ?? ""
        self.todayPlayed = data["todayPlayed"] as? String ?? ""
        self.monthPlayed = data["monthPlayed"] as? String ?? ""
        self.paidAmount = data["paidAmount"] as? String ?? ""
    }
}
class MembershipPlanList
{
    var planId:String = ""
    var plan_name:String = ""
    var plan_price:String = ""
    var plan_duration:String = ""
    var plan_features:String = ""
    var plan_type:String = ""
    
    init(data:[String:Any])
    {
        self.planId = data["planId"] as? String ?? ""
        self.plan_name = data["plan_name"] as? String ?? ""
        self.plan_price = data["plan_price"] as? String ?? ""
        self.plan_duration = data["plan_duration"] as? String ?? ""
        self.plan_features = data["plan_features"] as? String ?? ""
        self.plan_type = data["plan_type"] as? String ?? ""
    }
}
class MyFollowings
{
    var userId:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var totalTrack:String = ""
    var totalFollowers:String = ""
    var address:String = ""
    var isFollow:String = ""

    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.totalTrack = data["totalTrack"] as? String ?? ""
        self.totalFollowers = data["totalFollowers"] as? String ?? ""
        self.address = data["address"] as? String ?? ""
        self.isFollow = data["isFollow"] as? String ?? ""
    }
}
class MyFollowers
{
    var userId:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var totalTrack:String = ""
    var totalFollowers:String = ""
    var isFollowed:String = ""
    var address:String = ""
    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.totalTrack = data["totalTrack"] as? String ?? ""
        self.totalFollowers = data["totalFollowers"] as? String ?? ""
        self.isFollowed = data["isFollowed"] as? String ?? ""
        self.address = data["address"] as? String ?? "" 
    }
}
class MySuggestedFollower
{
    var userId:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var totalTrack:String = ""
    var totalFollowers:String = ""
    var address:String = ""

    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.totalTrack = data["totalTrack"] as? String ?? ""
        self.totalFollowers = data["totalFollowers"] as? String ?? ""
        self.address = data["address"] as? String ?? ""
    }
}
class PerfomanceTrackList
{
    var trackId:String = ""
    var title:String = ""
    var trackImage:String = ""
    var trackUrl:String = ""
    var trackPath:String = ""
    var noofplay:String = ""
    
    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackUrl = data["trackUrl"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
    }
}
class PerfomanceBaseValue
{
    var total_Plays:String = ""
    var today_count:String = ""
    var count_yesterday:String = ""
    var total_count:String = ""
    var headerImage:String = ""
    init(data:[String:Any])
    {
        self.headerImage = data["headerImage"] as? String ?? ""
        self.total_Plays = data["total_Plays"] as? String ?? ""
        self.today_count = data["today_count"] as? String ?? ""
        self.count_yesterday = data["count_yesterday"] as? String ?? ""
        self.total_count = data["total_count"] as? String ?? ""
    }
}
class MainCommentList
{
    var commentId:String = ""
    var commentatorId:String = ""
    var trackId:String = ""
    var title:String = ""
    var comment:String = ""
    var trackImage:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var trackUrl:String = ""

    init(data:[String:Any])
    {
        self.commentId = data["commentId"] as? String ?? ""
        self.commentatorId = data["commentatorId"] as? String ?? ""
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.comment = data["comment"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.trackUrl = data["comment"] as? String ?? ""
    }
}

class PurchasedHistory
{
    var trackId:String = ""
    var title:String = ""
    var trackLink:String = ""
    var trackImage:String = ""
    var trackPath:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var price:String = ""
    var transaction_id:String = ""
    var purchaseDate:String = ""
    
    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackLink = data["trackLink"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.price = data["price"] as? String ?? ""
        self.transaction_id = data["transaction_id"] as? String ?? ""
        self.purchaseDate = data["purchaseDate"] as? String ?? ""
    }
}
class SoldHistory
{
    var trackId:String = ""
    var buyer_id:String = ""
    var trackImage:String = ""
    var title:String = ""
    var price:String = ""
    var admin_amount:String = ""
    var seller_amount:String = ""
    var date:String = ""
    var downloadedBy:String = ""
    var profileLink:String = ""
    var trackUrl:String = ""

    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.buyer_id = data["buyer_id"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.price = data["price"] as? String ?? ""
        self.admin_amount = data["admin_amount"] as? String ?? ""
        self.seller_amount = data["seller_amount"] as? String ?? ""
        self.date = data["date"] as? String ?? ""
        self.downloadedBy = data["downloadedBy"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.trackUrl = data["trackUrl"] as? String ?? ""
    }
}
class GroupDetails
{
    var groupId:String = ""
    var groupName:String = ""
    var groupDesc:String = ""
    var fullDesc:String = ""
    var groupImage:String = ""
    var today_play:String = ""
    var yesterday_play:String = ""
    var total_play:String = ""
    var shareUrl:String = ""
    var creatorId:String = ""
    var isJoinGroup:String = ""
    var trackApproval:String = ""
    
    init(data:[String:Any])
    {
        self.groupId = data["groupId"] as? String ?? ""
        self.groupName = data["groupName"] as? String ?? ""
        self.groupDesc = data["groupDesc"] as? String ?? ""
        self.fullDesc = data["fullDesc"] as? String ?? ""
        self.groupImage = data["groupImage"] as? String ?? ""
        self.today_play = data["today_play"] as? String ?? ""
        self.yesterday_play = data["yesterday_play"] as? String ?? ""
        self.total_play = data["total_play"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.creatorId = data["creatorId"] as? String ?? ""
        self.isJoinGroup = data["isJoinGroup"] as? String ?? ""
        self.trackApproval = data["trackApproval"] as? String ?? ""
    }
}
class GroupAudioTrackList
{
   
    
    var trackId:String = ""
    var userId:String = ""
    var trackImage:String = ""
    var title:String = ""
    var noofplay:String = ""
    var likes:String = ""
    var totReposted:String = ""
    var totComments:String = ""
    var trackPath:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var shareUrl:String = ""
    var download_enable:String = ""
    var downloadUrl:String = ""
    var like_exists:String = ""
    var isApproved:String = ""
    var surahs:String = ""
    var verse:String = ""

    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.likes = data["likes"] as? String ?? ""
        self.totReposted = data["totReposted"] as? String ?? ""
        self.totComments = data["totComments"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.download_enable = data["download_enable"] as? String ?? ""
        self.downloadUrl = data["downloadUrl"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.isApproved = data["isApproved"] as? String ?? ""
        self.surahs = data["surahs"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
    }
}
class GroupMemberList
{
    var userId:String = ""
    var profilePic:String = ""
    var profileName:String = ""
    var profileLink:String = ""

    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
    }
}
class SearchAudioTrackList
{
    var trackId:String = ""
    var trackImage:String = ""
    var title:String = ""
    var profileName:String = ""
    var trackLink:String = ""
    var shareUrl:String = ""
    var isShare:String = ""
    var isEditDelete:String = ""
    var reposted:String = ""
    var like_exists:String = ""
    var tags = [OtherUserProfileTags]()

    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.trackLink = data["trackLink"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.isShare = data["isShare"] as? String ?? ""
        self.isEditDelete = data["isEditDelete"] as? String ?? ""
        self.reposted = data["reposted"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.tags = (data["tags"] as! [Any]).map({OtherUserProfileTags(data: $0 as! [String:Any])})
    }
}

class SearchGroupList
{
    var groupId:String = ""
    var groupName:String = ""
    var groupImage:String = ""
    var groupusers:String = ""
    var group_tracks:String = ""
    var isJoin:String = ""
    
    init(data:[String:Any])
    {
        self.groupId = data["groupId"] as? String ?? ""
        self.groupName = data["groupName"] as? String ?? ""
        self.groupImage = data["groupImage"] as? String ?? ""
        self.groupusers = data["groupusers"] as? String ?? ""
        self.group_tracks = data["group_tracks"] as? String ?? ""
        self.isJoin = data["isJoin"] as? String ?? ""
    }
}
class SearchPeopleList
{
    var userId:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var totalFollowers:String = ""
    
    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.totalFollowers = data["totalFollowers"] as? String ?? ""
    }
}
class SearchPlaysetsList
{
    var playlistId:String = ""
    var name:String = ""
    var playset_image:String = ""
    var total_tracks:String = ""
    var like_exists:String = ""
    var shareUrl:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var isDelete:String = ""
    
    init(data:[String:Any])
    {
        self.playlistId = data["playlistId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.playset_image = data["playset_image"] as? String ?? ""
        self.total_tracks = data["total_tracks"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.isDelete = data["isDelete"] as? String ?? ""
    }
}

class Track
{
    var trackId:String = ""
    var title:String = ""
    var trackImage:String = ""
    var trackUrl:String = ""
    var trackPath:String = ""
    var noofplay:String = ""
    
    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackUrl = data["trackUrl"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
    }
}

class Performance
{
    var today_count:String = ""
    var count_yesterday:String = ""
    var total_count:String = ""
    var track = [Track]()
    
    init(data:[String:Any])
    {
        self.today_count = data["today_count"] as? String ?? ""
        self.count_yesterday = data["today_count"] as? String ?? ""
        self.today_count = data["today_count"] as? String ?? ""
        self.track = (data["today_count"] as! [Any]).map({Track(data: $0 as! [String:Any])})
    }
}

class Tags
{
    var categoryName:String = ""
    init(data:[String:Any])
    {
        self.categoryName = data["categoryName"] as? String ?? ""
    }
}
class OtherUserAlbum
{
    
    var albumId:String = ""
    var name:String = ""
    var album_image:String = ""
    var shareUrl:String = ""
    var totalTrack:String = ""
    var tags = [Tags]()
    
    init(data:[String:Any])
    {
        self.albumId = data["albumId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.album_image = data["album_image"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.totalTrack = data["totalTrack"] as? String ?? ""
        self.tags = (data["tags"] as! [Any]).map({Tags(data: $0 as! [String:Any])})
    }
}
class MyFollowing
{
    var userId:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var totalTrack:String = ""
    var totalFollowers:String = ""
    
    init(dic:[String:Any]) {
        self.userId = dic["userId"] as? String ?? ""
        self.profileName = dic["profileName"] as? String ?? ""
        self.profileLink = dic["profileLink"] as? String ?? ""
        self.profilePic = dic["profilePic"] as? String ?? ""
        self.totalTrack = dic["totalTrack"] as? String ?? ""
        self.totalFollowers = dic["totalFollowers"] as? String ?? ""
    }
}
class OtherUserMyMusicList
{
    var trackId:String
    var title:String
    var desc:String
    var userId:String
    var likes:String
    var noofplay:String
    var totShare:String
    var totComments:String
    var totReposted:String
    var isActive:String
    var download_enable:String
    var trackImage:String
    var trackPath:String
    var dir:String
    var firstName:String
    var lastName:String
    var profileLink:String
    var profileName:String
    var profilePic:String
    var userpicdir:String
    var like_exists:String
    var tags = [Tags]()
    var shareUrl:String
    
    init(data:[String:Any])
    {
        self.trackId = data["trackId"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.desc = data["desc"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
        self.likes = data["likes"] as? String ?? ""
        self.noofplay = data["noofplay"] as? String ?? ""
        self.totShare = data["totShare"] as? String ?? ""
        self.totComments = data["totComments"] as? String ?? ""
        self.totReposted = data["totReposted"] as? String ?? ""
        self.isActive = data["isActive"] as? String ?? ""
        self.download_enable = data["download_enable"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.trackPath = data["trackPath"] as? String ?? ""
        self.dir = data["dir"] as? String ?? ""
        self.firstName = data["firstName"] as? String ?? ""
        self.lastName = data["lastName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.userpicdir = data["userpicdir"] as? String ?? ""
        self.like_exists = data["like_exists"] as? String ?? ""
        self.tags = (data["tags"] as! [Any]).map({Tags(data: $0 as! [String:Any])})
        self.shareUrl = data["shareUrl"] as? String ?? ""
    }
}
class TrackUploadAdvanceStastics
{
    var name:String = ""
    var cnt:String = ""
    
    init(data:[String:Any])
    {
        self.name = data["name"] as? String ?? ""
        self.cnt = data["cnt"] as? String ?? ""
    }
}
class OtherAdvanceStasticsDetails
{
    var name:String = ""
    var cnt:String = ""
    var title:String = ""
    
    init(data:[String:Any])
    {
        self.name = data["name"] as? String ?? ""
        self.cnt = data["cnt"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
    }
}
class AdvanceStatistics
{
    var trackUploadAdvanceStastics = [TrackUploadAdvanceStastics]()
    var trackPlayStasticsDetails = [OtherAdvanceStasticsDetails]()
    var trackCommentStasticsDetails = [OtherAdvanceStasticsDetails]()
    var trackLikeStasticsDetails = [OtherAdvanceStasticsDetails]()
    var trackRepostStasticsDetails = [OtherAdvanceStasticsDetails]()
    var trackFollowingStasticsDetails = [OtherAdvanceStasticsDetails]()
    var trackFollowerStasticsDetails = [OtherAdvanceStasticsDetails]()
    var trackStreamingStasticsDetails = [OtherAdvanceStasticsDetails]()
    var trackStreamingDayStasticsDetails = [OtherAdvanceStasticsDetails]()

    init(data:[String:Any])
    {
        self.trackUploadAdvanceStastics = (data["trackUpload"] as! [Any]).map({TrackUploadAdvanceStastics(data: $0 as! [String:Any])})
        self.trackPlayStasticsDetails = (data["trackPlay"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
        self.trackCommentStasticsDetails = (data["trackComment"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
        self.trackLikeStasticsDetails = (data["trackLike"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
        self.trackRepostStasticsDetails = (data["trackRepost"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
        self.trackFollowingStasticsDetails = (data["trackFollowing"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
        self.trackFollowerStasticsDetails = (data["trackFollower"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
        self.trackStreamingStasticsDetails = (data["trackStreaming"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
        self.trackStreamingDayStasticsDetails = (data["trackStreamingDay"] as! [Any]).map({OtherAdvanceStasticsDetails(data: $0 as! [String:Any])})
    }
}
class AdvanceStasticYear
{
    var year:String = ""
    
    init(data:[String:Any])
    {
        self.year = data["year"] as? String ?? ""
    }
}

class TrackReportLikeUser
{
    var userId:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var total_tracks:String = ""
    var total_followers:String = ""
    
    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.total_tracks = data["total_tracks"] as? String ?? ""
        self.total_followers = data["total_followers"] as? String ?? ""
    }
}

class TrackReportPlays
{
    var userId:String = ""
    var profileName:String = ""
    var profileLink:String = ""
    var profilePic:String = ""
    var userplays:String = ""

    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileName = data["profileName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
        self.profilePic = data["profilePic"] as? String ?? ""
        self.userplays = data["userplays"] as? String ?? ""
    }
}
class StaticPagesLink
{
    var pId:String = ""
    var pageName:String = ""
    var pageTitle:String = ""
    var metaKeyword:String = ""
    var metaDesc:String = ""
    var linkType:String = ""
    var url:String = ""
    var pageDesc:String = ""
    
    init(data:[String:Any])
    {
        self.pId = data["pId"] as? String ?? ""
        self.pageName = data["pageName"] as? String ?? ""
        self.pageTitle = data["pageTitle"] as? String ?? ""
        self.metaKeyword = data["metaKeyword"] as? String ?? ""
        self.metaDesc = data["metaDesc"] as? String ?? ""
        self.linkType = data["linkType"] as? String ?? ""
        self.url = data["url"] as? String ?? ""
        self.pageDesc = data["pageDesc"] as? String ?? ""
    }
}
class HomeWithOutLogin
{
    var userId:String = ""
    var popularSongHome = [PopularSongHome]()
    var midContentHome:MidContentHome
    var recentArtistHome = [RecentArtistHome]()
    
    init(data:[String:Any])
    {
        self.popularSongHome = (data["popular_song"] as! [Any]).map({PopularSongHome(data: $0 as! [String:Any])})
        self.midContentHome = MidContentHome(data:(data["mid_content"] as? [Any] ?? [Any]()).first as! [String:Any])
        self.recentArtistHome = (data["recent_artist"] as! [Any]).map({RecentArtistHome(data: $0 as! [String:Any])})
    }
}
class PopularSongHome
{
    var type:String = ""
    var duration:String = ""
    var dir:String = ""
    var trackImage:String = ""
    var time:String = ""
    var id:String = ""
    var user_id:String = ""
    var commentable:String = ""
    var permalink:String = ""
    var permalink_url:String = ""
    var streamable:String = ""
    var title:String = ""
    var stream_url:String = ""
    var surahs:String = ""
    var verse:String = ""
    var slideshow_img:String = ""
    var is_display:String = ""

    init(data:[String:Any])
    {
        self.type = data["type"] as? String ?? ""
        self.duration = data["duration"] as? String ?? ""
        self.dir = data["dir"] as? String ?? ""
        self.trackImage = data["trackImage"] as? String ?? ""
        self.time = data["time"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.user_id = data["user_id"] as? String ?? ""
        self.commentable = data["commentable"] as? String ?? ""
        self.permalink = data["permalink"] as? String ?? ""
        self.permalink_url = data["permalink_url"] as? String ?? ""
        self.streamable = data["streamable"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.stream_url = data["stream_url"] as? String ?? ""
        self.surahs = data["surahs"] as? String ?? ""
        self.verse = data["verse"] as? String ?? ""
        self.slideshow_img = data["slideshow_img"] as? String ?? ""
        self.is_display = data["is_display"] as? String ?? ""
    }
}
class MidContentHome
{
    var mid_title:String = ""
    var mid_content:String = ""
    
    init(data:[String:Any])
    {
        self.mid_title = data["mid_title"] as? String ?? ""
        self.mid_content = data["mid_content"] as? String ?? ""
    }
}
class RecentArtistHome
{
    var userId:String = ""
    var profileImg:String = ""
    var userName:String = ""
    var profileLink:String = ""
    
    init(data:[String:Any])
    {
        self.userId = data["userId"] as? String ?? ""
        self.profileImg = data["profileImg"] as? String ?? ""
        self.userName = data["userName"] as? String ?? ""
        self.profileLink = data["profileLink"] as? String ?? ""
    }
}
class DisplayLanguage
{
    var id:String = ""
    var languageName:String = ""
    var lang_code:String = ""
    var type:String = ""
    
    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.languageName = data["languageName"] as? String ?? ""
        self.lang_code = data["lang_code"] as? String ?? ""
        self.type = data["type"] as? String ?? ""
    }
}
class PaymentHistory
{
    var id:String = ""
    var ad_name:String = ""
    var url:String = ""
    var amount:String = ""
    var date:String = ""

    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.ad_name = data["ad_name"] as? String ?? ""
        self.url = data["url"] as? String ?? ""
        self.amount = data["amount"] as? String ?? ""
        self.date = data["date"] as? String ?? ""
    }
}
class PostedBannerAds
{
    var id:String = ""
    var title:String = ""
    var image:String = ""
    var page:String = ""
    var ad_url:String = ""
    var slot:String = ""
    var per_day_price:String = ""
    var start_date:String = ""
    var end_date:String = ""
    var total_price:String = ""
    
    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.image = data["image"] as? String ?? ""
        self.page = data["page"] as? String ?? ""
        self.ad_url = data["ad_url"] as? String ?? ""
        self.slot = data["slot"] as? String ?? ""
        self.per_day_price = data["per_day_price"] as? String ?? ""
        self.start_date = data["start_date"] as? String ?? ""
        self.end_date = data["end_date"] as? String ?? ""
        self.total_price = data["total_price"] as? String ?? ""
    }
}
class MyAlbum
{
    var albumId:String = ""
    var name:String = ""
    var album_image:String = ""
    var shareUrl:String = ""
    var totalTrack:String = ""
   
    init(data:[String:Any])
    {
        self.albumId = data["albumId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.album_image = data["album_image"] as? String ?? ""
        self.shareUrl = data["shareUrl"] as? String ?? ""
        self.totalTrack = data["totalTrack"] as? String ?? ""
    }
}
class SurahList
{
    var id:String = ""
    var categoryName:String = ""
    
    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.categoryName = data["categoryName"] as? String ?? ""
    }
}
class VerseList
{
    var id:String = ""
    var categoryName:String = ""
    
    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.categoryName = data["categoryName"] as? String ?? ""
    }
}
class EditAlbumTagList
{
    var albumId:String
    var name:String
    
    init(data:[String:Any])
    {
        self.albumId = data["albumId"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
    }
}
class AdList
{
    var id:String
    var ad_url:String
    var image:String

    init(data:[String:Any])
    {
        self.id = data["id"] as? String ?? ""
        self.ad_url = data["ad_url"] as? String ?? ""
        self.image = data["image"] as? String ?? ""
    }
}
