// import 'dart:async';

import 'package:dio/dio.dart';

class ConnectivityInterceptor {
  final Dio dio;

  ConnectivityInterceptor({
    required this.dio,
  });

  // Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
  //   StreamSubscription? streamSubscription;
  //   final responseCompleter = Completer<Response>();

  //   streamSubscription = connectivity.onConnectivityChanged.listen(
  //     (connectivityResult) async {
  //       if (connectivityResult != ConnectivityResult.none) {
  //         streamSubscription?.cancel();
  //         responseCompleter.complete(
  //           dio.request(
  //             requestOptions.path,
  //             cancelToken: requestOptions.cancelToken,
  //             data: requestOptions.data,
  //             onReceiveProgress: requestOptions.onReceiveProgress,
  //             onSendProgress: requestOptions.onSendProgress,
  //             queryParameters: requestOptions.queryParameters,
  //           ),
  //         );
  //       }
  //     },
  //   );

  //   return responseCompleter.future;
  // }
}
