#import "KiyibodiPlugin.h"
#if __has_include(<kiyibodi/kiyibodi-Swift.h>)
#import <kiyibodi/kiyibodi-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kiyibodi-Swift.h"
#endif

@implementation KiyibodiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKiyibodiPlugin registerWithRegistrar:registrar];
}
@end
