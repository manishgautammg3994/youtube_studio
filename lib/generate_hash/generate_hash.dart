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
import 'dart:math';

/////////////////////////////////////////////////////////////////////////////////
// realcode below

// String generateHash() {
//   var harfler =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
//   var keys = List.filled(36, '');
//   var b = 0;
//   var c = '';
//   var e = 0;

//   while (e < 36) {
//     if (8 == e || 13 == e || 18 == e || 23 == e) {
//       keys[e] = '-';
//     } else {
//       if (14 == e) {
//         keys[e] = '4';
//       } else if (2 >= b) {
//         b = (33554432 + 16777216 * Random().nextDouble()).round();
//       }
//       c = (b & 15) as String;
//       b = b >> 4;
//       keys[e] = harfler[c & 3 | 8 if (19 == e) else c];
//     }
//     e += 1;
//   }

//   return keys.join('');
// }
generateFrontendUploadId() {
  var _hash = generateHash1();
  return "innertube_studio:${_hash}:0";
}
/// php code
//  function generateHashs($randu2) {
//     $Qkb = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
//     $a = array();
//     $b = 0;
//     $c = '';
//     $idku = '';
//     for ($e = 0; $e<36; $e++){
//         if(8 == $e || 13 == $e || 18 == $e || 23 == $e) {
//             $a[$e] = "-";
//         } else if(14 == $e){ 
//             $a[$e] = "4";
//         } else {
//                 2 >= $b && ($b = 33554432 + 16777216 * $randu2 | 0);
//                 $c = $b & 15;
//                 $b >>= 4;
//                 if($e == 19){
//                     $idku = $c & 3 | 8;
//                 }else{
//                     $idku = $c;
//                 }
//                 $a[$e] = $Qkb[$idku];
//                 $idku = '';
//         }
//     }
//     return implode("",$a);
// }

//new
String generateHash1() {
  var Qkb = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split("");
  var a = List.filled(36, '');
  var b = 0;
  var c = '';
  var e = 0;
  
  while (e < 36) {
    if (8 == e || 13 == e || 18 == e || 23 == e) {
      a[e] = '-';
    } else {
      if (14 == e) {
        a[e] = '4';
      } else if (2 >= b) {
        b = ((33554432 + 16777216  + Random().nextInt(pow(2, 32) as int)).toInt());
      }
      c = (b & 15).toRadixString(16);
      b = b >> 4;
      a[e] = Qkb[(19 == e) ? (int.parse(c, radix: 16) & 3) | 8 : int.parse(c, radix: 16)];
    }
    e += 1;
  }
  
  return a.join('');
}