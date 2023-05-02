import 'dart:isolate';
import 'dart:async';

final ReceivePort macrosExecutorListener = ReceivePort();

SendPort? macrosExecutorController;

void main(List<String> args, dynamic message) async {

}