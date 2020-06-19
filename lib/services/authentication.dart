import 'package:http/http.dart' as http;

final String baseURL = 'http://167.172.216.15:3333';


class Services {

final String urlUsers = '$baseURL/users';

  auth() async {
print("IN ASYNC");

    http.get(urlUsers).toString();

    var response = await http.post(urlUsers,
        body: {'name': 'asda',
          'password_hash': 'blue'});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(urlUsers));

    print("FINISH ASYNC");

  }




  authHttpJson() async {
    print("Connecting to server GET...");
    // request public exists
    //final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');

    final response = await http.get(urlUsers);

    if (response.statusCode == 200) {
        print(response.body);
      } else {
        throw Exception('Failed to load post');
      }


      print("Result: ${response.statusCode}");
  }


}