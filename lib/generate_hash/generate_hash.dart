//    import 'dart:math' as Math;
//    generateHash(){
//    List<String?>? Qkb;
//     Qkb = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".split("");
// for (var e = 0,b=0,a=[],c; e < 36; e++) {
//   if ( 8 == e || 13 == e || 18 == e || 23 == e ) {
//     a[e] = "-";
//   } else {
//     if (14 == e) {
//      a[e] = "4";
//     }
//     else if(2>= b && (b ==  33554432 + 16777216 * Math.Random().nextDouble() || b== 0 && ( c == b && c== 15 &&
//             b >= 4 && a[e] = Qkb[(19 == e )? c && c== 3 | 8 : c]))){

//     }
//   }

// }

//     for (var a = Array(36), b = 0, c, e = 0; 36 > e; e++)
//         8 == e || 13 == e || 18 == e || 23 == e ? a[e] = "-" : 14 == e ? a[e] = "4" : (2 >= b && (b = 33554432 + 16777216 * Math.random() | 0),
//             c = b & 15,
//             b >>= 4,
//             a[e] = Qkb[19 == e ? c & 3 | 8 : c]);
//     return a.join("")
// }
// generateFrontendUploadId() => `innertube_studio:${generateHash()}:0`
/////////////////////////////////////////////////////////////////////////////////
// realcode below
generateFrontendUploadId() {
  var _hash = generateHash();
  return "innertube_studio:${_hash()}:0";
}
