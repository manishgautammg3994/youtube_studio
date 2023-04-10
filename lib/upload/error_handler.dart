import 'app_exceptions.dart';

class ErrorHandler {
  //this is Base Controller
  handleError(error) {
    if (error is BadRequestException) {
      //show Dialog
      var message = error.message;
      // DialogHelper.showErrorDialog(
      //   title: "Bad Request",
      //   discription: message,
      //   onPressButton: () {
      //     if (Get.isDialogOpen!) Get.back();
      //   },
      // );
    } else if (error is FetchDataException) {
      var message = error.message;
      // DialogHelper.showErrorDialog(
      //   title: "Fetching Error",
      //   discription: message,
      //   onPressButton: () {
      //     if (Get.isDialogOpen!) Get.back();
      //   },
      // );
    } else if (error is ApiNotRespondingException) {
      // var message = error.message;
      // DialogHelper.showErrorDialog(
      //   title: "Error",
      //   discription: "Oops! it's taking Long To Respond",
      //   onPressButton: () {
      //     if (Get.isDialogOpen!) Get.back();
      //   },
      // );
    } else if (error is UnAuthorizedException) {
      var message = error.message;
      // DialogHelper.showErrorDialog(
      //   title: "UnAuthorized",
      //   discription: message,
      //   onPressButton: () {
      //     if (Get.isDialogOpen!) Get.back();
      //   },
      // );
    }
  }
}
