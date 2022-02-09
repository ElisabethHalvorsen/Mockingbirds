import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../.env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'request_assistance.dart';
import '../models/directions_details.dart';

class DirectionsManager {
  static Future<DirectionsDetails?> getDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    try {
      String directionURL =
          "https://maps.googleapis.com/maps/api/directions/json&destination=${finalPosition.latitude},${finalPosition.longitude}&mode=bicycling&origin=${initialPosition.latitude},${initialPosition.longitude}&key=${googleAPIKey}";

      var res = await RequestAssistance.getRequest(directionURL);

      DirectionsDetails directionsDetails = DirectionsDetails();

      directionsDetails.distanceText =
          res["routes"][0]["legs"][0]["distance"]["text"];
      directionsDetails.distanceValue =
          res["routes"][0]["legs"][0]["distance"]["value"];

      directionsDetails.durationText =
          res["routes"][0]["legs"][0]["duration"]["text"];
      directionsDetails.durationValue =
          res["routes"][0]["legs"][0]["duration"]["value"];

      //directionsDetails.instructions = //routes, legs, steps

      return directionsDetails;
    } catch (exp) {
      print(exp);
      return null;
    }
  }
}






//   final String key =
//       "AIzaSyB7YSQkjjqm-YU1LAz91lyYAvCpqFRhFdU"; //google cloud API KEY

//   //returns the id of the place the user inputs
//   Future<String> getPlaceId(String input) async {
//     try {
//       final String url =
//           "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";
//       var response = await http.get(Uri.parse(url));
//       var json = convert.jsonDecode(response.body);
//       var placeId = json['candidates'][0]['place_id'] as String;
//       print(placeId);
//       return placeId;
//     } catch (exp) {
//       return "Something went wrong when loading the data";
//     }
//   }

//   //returns a map of the string and the object of the place user inputs
//   Future<Map<String, dynamic>> getPlace(String input) async {
//     final placeId = await getPlaceId(input);
//     final String url =
//         "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
//     var response = await http.get(Uri.parse(url));
//     var json = convert.jsonDecode(response.body);
//     var results = json['result'] as Map<String, dynamic>;
//     print(results);
//     return results;
//   }

//   //When the user provides some input, search through the api to find the input place. Limited to Great Britain results - for now (change to london specific!!)
//   void findPlace(String placeName) async {
//     if (placeName.length > 1) {
//       String autoCompleteUrl =
//           "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$key&components=country:gb";
//       var res = await RequestAssistance.getRequest(autoCompleteUrl);

//       if (res == "Failed") {
//         return;
//       }

//       print("PLACES PREDICTION:");
//       print(res);
//     }
//   }
// }

// /*
// * Given a url, it performs requests for us.
// */
// class RequestAssistance {
//   //If request valid, returns the object that was requested
//   static Future<dynamic> getRequest(String url) async {
//     http.Response response = await http.get(Uri.parse(url));

//     try {
//       if (response.statusCode == 200) {
//         String jsonData = response.body;
//         var decodeData = convert.jsonDecode(jsonData);
//         return decodeData;
//       } else {
//         return "Failed, No response!";
//       }
//     } catch (exp) {
//       return "Failed";
//     }
//   }
// }
