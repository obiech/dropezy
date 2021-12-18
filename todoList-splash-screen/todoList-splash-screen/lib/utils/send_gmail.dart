
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;


class SendEmail{
  void gmail(){
    android_intent.Intent()
                  ..setAction(android_action.Action.ACTION_VIEW)
        ..setData(Uri(scheme: "mailto", path: "savchits.dev@gmail.com"))
        ..startActivity().catchError((e) {android_intent.Intent()..setAction(android_action.Action.ACTION_BUG_REPORT)
        ..startActivity().catchError((e) => print(e));});
  }
}