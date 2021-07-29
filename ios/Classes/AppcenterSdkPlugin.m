#import "AppcenterSdkPlugin.h"
#if __has_include(<appcenter_sdk/appcenter_sdk-Swift.h>)
#import <appcenter_sdk/appcenter_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "appcenter_sdk-Swift.h"
#endif

@implementation AppcenterSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppcenterSdkPlugin registerWithRegistrar:registrar];
}
@end
