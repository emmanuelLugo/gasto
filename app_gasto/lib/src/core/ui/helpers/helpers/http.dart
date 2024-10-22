import 'dart:io';

// extend `HttpOverrides` class
class CustomHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? securityContext){
    return super
        .createHttpClient(securityContext)
        ..badCertificateCallback =
                        (X509Certificate certificate, String hostName, int hostPort)=> true;
  }
}