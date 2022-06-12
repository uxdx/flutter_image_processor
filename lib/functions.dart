import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> downloadImageFiles(List<String> sources) async {
  // 동일 서버에 여러번 요청하기 위해 클라이언트를 생성.
  var client = http.Client();

  for (var src in sources) {
    src = src.replaceAll(RegExp(r'\n'), '');
    if(isValidUrl(src)){
      try {
        var response = await client.get(
          Uri.parse(src)
        );
        String path = 'images/scrapped_images/' + src.split('/').last;
        File(path).writeAsBytesSync(response.bodyBytes);
        print('Download '+path);
        // print(response.body);
        // new File()

      } catch (e) {
        print('Error.');
      } finally {
    }
    }
    else{
      print(src+' is invalid url.');
    }

  }
        client.close();
  
}
bool isValidUrl(String src){
  // src = src.replaceAll(RegExp(r'\n'), '');
  // http가 있는지
  if (!src.contains('http')){
    print('need to contain http');
    return false;
  }
  // 확장자로 끝나는지
  const List<String> extensions = ['png', 'jpg', 'jpeg', 'gif'];
  for (String extension in extensions) {
    if (src.split('.').last == extension){
      return true;
    }
  }
  // 없으면 false반환
  return false;
}