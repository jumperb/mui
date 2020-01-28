#import "MuiPlugin.h"
#if __has_include(<mui/mui-Swift.h>)
#import <mui/mui-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mui-Swift.h"
#endif

@implementation MuiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMuiPlugin registerWithRegistrar:registrar];
}
@end
