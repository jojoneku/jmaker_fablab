import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:jmaker_fablab/Model/counter_page_model.dart';

class Controller extends ControllerMVC {
  factory Controller() => _this ??= Controller._();
  Controller._();
  static Controller? _this;

  int get counter => CounterModel.counter;
  void increment() {
    CounterModel.increment();
  }

  void decrement() {
    CounterModel.decrement();
  }
}
