
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:jmaker_fablab/Model/counter_page_model.dart';
class Controller extends ControllerMVC {
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this = Controller._();
  Controller._();

  int get counter => counter_model.counter;
  void increment(){
    counter_model.increment();
  }
  void decrement(){
    counter_model.decrement();
  }
}