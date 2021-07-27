import 'package:dio/dio.dart';




import 'package:userfollowersdata_practice/models/userdata_model.dart';
import 'package:userfollowersdata_practice/network_call/base_network.dart';
import 'package:userfollowersdata_practice/network_call/base_response.dart';



class UsersManager{
    Future<ResponseData> fetchUsers() async {

    Response response;
    try {
      response = await dioClient.ref!
          .get<dynamic>("https://api.github.com/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users");

      if(response.statusCode == 200) {
        final model =UsersDataModel.fromJson(response.data);
        //final model = UserData.userDataFromJson(response.data);
        return ResponseData("", ResponseStatus.SUCCESS, data: model);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( err.toString(), ResponseStatus.FAILED);
    }

  }
   
}
UsersManager userManager = UsersManager();
