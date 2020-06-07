import 'dart:convert';

final jsonString = '''{
	"age": 23,
	"clasp": {
		"name": "zz-top",
		"album": "crusin",
		"wasAHit": true
	},
	"items": {
		"songTitle": "legs",
		"songWriter": {
			"agent": "MCI",
			"composer": "John Williams"
		},
		"songLength": 600,
		"songRelease": [{
			"year": "1990-01-12T16:00:00",
			"quantity": 1000000
		}, {
			"year": "2019-03-04T00:30:00",
			"quantity": 50000
		}]
	}
}
''';

Map<String, dynamic> jsonData() => jsonDecode(jsonString);
