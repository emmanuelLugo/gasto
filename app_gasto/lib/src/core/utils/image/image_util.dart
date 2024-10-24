import 'package:app_gasto/src/core/api/host_name.dart';
import 'package:app_gasto/src/core/global/image_constants.dart';
import 'package:flutter/material.dart';

FadeInImage customFadeInImage(String? urlFoto,
    {BoxFit? fit, bool? ocultaTextoError = false}) {
  return FadeInImage(
    placeholder: const AssetImage(ImageConstants.LOADING_IMAGE),
    image: NetworkImage(Hostname.instance.httpImageURL(urlFoto)),
    fit: fit ?? BoxFit.cover,
    imageErrorBuilder: (context, error, stackTrace) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error,
              color: Color.fromARGB(255, 175, 52, 52), size: 50),
          if (ocultaTextoError! == false)
            const Text('Error', style: TextStyle(color: Colors.grey)),
        ],
      );
    },
  );
}

Widget customImageWidget(String? urlFoto,
    {BoxFit? fit, bool? ocultaTextoError = false}) {
  if (urlFoto == null) {
    return const Icon(
      Icons.image_not_supported,
      size: 75,
      color: Colors.grey,
    );
  }
  return customFadeInImage(urlFoto,
      fit: fit, ocultaTextoError: ocultaTextoError);
}
