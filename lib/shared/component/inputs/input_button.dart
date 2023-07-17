import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool loading;
  final bool active;
  final String text;
  final double? textSize;
  final double width;
  final double height;

  const DefaultButton({
    Key? key,
    required this.text,
    this.textSize,
    this.loading = false,
    this.active = true,
    this.width = double.infinity,
    this.height = 50,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        child: ElevatedButton(
          onPressed: active ? onTap : null,
          style: ButtonStyle(
            // elevation:
            //     elevation != null ? MaterialStateProperty.all(elevation) : null,
            // shape: isOutlined
            //     ? MaterialStateProperty.all(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(5),
            //           side: BorderSide(
            //             width: 2,
            //             color: color ?? AppColors.primary,
            //           ),
            //         ),
            //       )
            //     : null,

            backgroundColor: MaterialStateProperty.all(
              loading
                  ? (Colors.orange)
                  : active
                      ? Colors.red
                      : (Colors.grey),
            ),
          ),
          child: Center(
            child: loading
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'loading',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textSize ?? 20,
                      // fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}
