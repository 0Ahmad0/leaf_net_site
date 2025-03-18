import 'package:flutter/cupertino.dart';


class ImageLocalHandler extends StatelessWidget {
  const ImageLocalHandler( this.url,{super.key,this.width, this.height, this.fit,this.color});
  final String? url;
  final double? width, height;
  final  BoxFit? fit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return  getImageWidget();
  }
  Widget getImageWidget() {
   String  imagePath=url??'';

    switch(imagePath.split('.').last){
     // case 'svg':
     //   return SvgPicture.asset(imagePath,width: width,height: height,fit:fit??BoxFit.contain,
     //       colorFilter: color==null?null:ColorFilter.mode(color!, BlendMode.srcIn));
     case 'png':
     case 'jpg':
     case 'jpeg':
        return Image.asset(imagePath,width: width,height: height,fit:fit,color: color,);
     case 'gif':
       return Image.asset(imagePath,width: width,height: height,fit:fit,color: color);
     case 'webp':
       return Image.asset(imagePath,width: width,height: height,fit:fit,color: color);
     case 'bmp':
       return Image.asset(imagePath,width: width,height: height,fit:fit,color: color);
     case 'tiff':
     case 'tif':
     return Image.asset(imagePath,width: width,height: height,fit:fit,color: color);
     case 'ico':
       return Image.asset(imagePath,width: width,height: height,fit:fit,color: color);
     // case 'json':
     //   return Lottie.asset(imagePath,width: width,height: height,fit:fit);

   }
   return const Text('Unsupported image format');

  }
}
