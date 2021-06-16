import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_decoder/json_decoder.dart';
import 'package:moor/moor.dart';
import 'package:sqlite_reporter/rewards/database/activity_contents.dart';
import 'package:tracers_package/tracers.dart';
import 'package:xfer/xfer.dart';

class ReadJson {
  void load() async {
    final url = 'asset://data/activity_content.json';
    Map<String, String> header = {'Content-Type': 'application/json'};
    Either<XferFailure, XferResponse> result = await Xfer().get(url, headers: header);
    result.fold(
      (err) => Log.E('ReadJson ERROR: ${err.toString()}'),
      (data) {
        final Either<Exception, JsonDecoded> decode = JSONDecoder.decode(data.body, trace: true);
        decode.fold(
          (l) => Log.E('ReadJson ERROR: ${l.toString()}'),
          (r) async {
            List<Map<String, dynamic>>? jsonList = r.jsonConvertListDynamic;
            if (jsonList != null) {
              //final moorBridge = Modular.get<MoorBridge>();
              final ActivityContentDao dao = Modular.get<ActivityContentDao>();
              for (Map<String, dynamic> map in jsonList) {
                final v = ActivityContentsCompanion(
                  activityId: Value(map['activityId']),
                  amount: Value(map['amount']),
                  confirmationCancel: Value(map['confirmationCancel']),
                  confirmationSave: Value(map['confirmationSave']),
                  confirmationTitle: Value(map['confirmationTitle']),
                  dateCompleteCaption: Value(map['dateCompleteCaption']),
                  dateFormat: Value(map['dateFormat']),
                  details: Value(map['details']),
                  imageUrl: Value(map['imageUrl']),
                  language: Value(map['language']),
                  rewardType: Value(map['rewardType']),
                  sequences: Value(map['sequences']),
                  setDateCaption: Value(map['setDateCaption']),
                  spinnerMessage: Value(map['spinnerMessage']),
                  title: Value(map['title']),
                  validFrom: Value(map['validFrom']),
                  validUntil: Value(map['validUntil']),
                );
                await dao.insertTask(v);
              }
            }
          },
        );
      },
    );
  }
}
