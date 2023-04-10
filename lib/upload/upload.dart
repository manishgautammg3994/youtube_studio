import '../generate_hash/generate_hash.dart';
import 'api_request.dart';

final frontendUploadId = generateFrontendUploadId();
upload(
    {required String channelId,
    String? newTitle = "unmamed-Video",
    String? newDescription,
    String? newPrivacy = "PRIVATE",
    dynamic stream,
    bool isDraft = false,
    Map<String, String>? headers,
    dynamic config, // TODO
    sessionToken}) async {
  //String? newTitle = "unmamed-${DateTime.now()}"
//TODO referrer: YT_STUDIO_URL,
  var uploadUrl = await CustomBaseClient()
      .StartinguploadFile(
        uploadURL: "https://upload.youtube.com/upload/studio",
        headers: headers,
        // stream: stream
      )
      .then((resp) => resp.headers['x-goog-upload-url']);

  var scottyResourceId = await CustomBaseClient()
      .uploadFile(uploadURL: uploadUrl!, headers: headers, stream: stream);

  var createVideoBody = {
    "channelId": channelId,
    "resourceId": {
      "scottyResourceId": {"id": scottyResourceId}
    },
    "frontendUploadId": frontendUploadId,
    "initialMetadata": {
      "title": {"newTitle": newTitle},
      "description": {"newDescription": newDescription, "shouldSegment": true},
      "privacy": {"newPrivacy": newPrivacy},
      "draftState": {"isDraft": isDraft}
    },
    "context": {
      "client": {
        "clientName": 62,
        "clientVersion": "1.20201130.03.00",
        "hl": "en-GB",
        "gl": "PL",
        "experimentsToken": "",
        "utcOffsetMinutes": 60
      },
      "request": {
        "returnLogEntry": true,
        "internalExperimentFlags": [],
        "sessionInfo": {"token": sessionToken}
      },
      "user": {
        "onBehalfOfUser": config.DELEGATED_SESSION_ID,
        "delegationContext": {
          "roleType": {"channelRoleType": "CREATOR_CHANNEL_ROLE_TYPE_OWNER"},
          "externalChannelId": channelId
        },
        "serializedDelegationContext": ""
      },
      "clientScreenNonce": ""
    },
    "delegationContext": {
      "roleType": {"channelRoleType": "CREATOR_CHANNEL_ROLE_TYPE_OWNER"},
      "externalChannelId": channelId
    }
  };

  return await CustomBaseClient().uploadingResponse(
      //TODO change here
      uploadURL:
          "https://studio.youtube.com/youtubei/v1/upload/createvideo?alt=json&key=${config.INNERTUBE_API_KEY}",
      headers: headers,
      createVideoBody: createVideoBody);
}
