
#import "RNBytedanceAd.h"
#import <BUAdSDK/BURewardedVideoAd.h>
#import <BUAdSDK/BURewardedVideoModel.h>

static NSString *const kEventAdEvent = @"BytedanceAdEvent";

@interface RNBytedanceAd () <BURewardedVideoAdDelegate>

@property (nonatomic, strong) BURewardedVideoAd *rewardedVideoAd;

@end


@implementation RNBytedanceAd
{
    BOOL hasListeners;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}


RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents
{
    return @[kEventAdEvent];
}


RCT_EXPORT_METHOD(loadRewardVideoAd:(NSString *)slotId userId:(NSString *)userId)
{
    BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    model.userId = userId;
    model.isShowDownloadBar = YES;
    
    self.rewardedVideoAd = [[BURewardedVideoAd alloc] initWithSlotID:slotId rewardedVideoModel:model];
    
    self.rewardedVideoAd.delegate = self;
    [self.rewardedVideoAd loadAdData];
}

RCT_EXPORT_METHOD(showRewardVideoAd)
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIViewController *rootViewController = [keyWindow rootViewController];
    
    if (self.rewardedVideoAd) {
        [self.rewardedVideoAd showAdFromRootViewController:rootViewController]
    }
}


- (void)startObserving
{
    hasListeners = YES;
}

- (void)stopObserving
{
    hasListeners = NO;
}

#pragma mark BURewardedVideoAdDelegate
/**
 This method is called when video ad material loaded successfully.
 */
- (void)rewardedVideoAdDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                       body:@{@"message": @"rewardedVideoAdDidLoad"}];
    }
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)rewardedVideoAd:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdFailed", @"error": error.localizedDescription}];
    }
}

/**
 This method is called when cached successfully.
 */
- (void)rewardedVideoAdVideoDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdVideoDidLoad"}];
    }
}

/**
 This method is called when video ad slot will be showing.
 */
- (void)rewardedVideoAdWillVisible:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdWillVisible"}];
    }
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)rewardedVideoAdDidVisible:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdDidVisible"}];
    }
}

/**
 This method is called when video ad is about to close.
 */
- (void)rewardedVideoAdWillClose:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdWillClose"}];
    }
}

/**
 This method is called when video ad is closed.
 */
- (void)rewardedVideoAdDidClose:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdDidClose"}];
    }
}

/**
 This method is called when video ad is clicked.
 */
- (void)rewardedVideoAdDidClick:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdDidClick"}];
    }
}


/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)rewardedVideoAdDidPlayFinish:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdDidPlayFinishFailed", @"error": error.localizedDescription}];
    }
}

/**
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)rewardedVideoAdServerRewardDidSucceed:(BURewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdServerRewardDidSucceed", @"verify": verify}];
    }
}

/**
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)rewardedVideoAdServerRewardDidFail:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdServerRewardDidFail"}];
    }
}
/**
 This method is called when the user clicked skip button.
 */
- (void)rewardedVideoAdDidClickSkip:(BURewardedVideoAd *)rewardedVideoAd {
    if (hasListeners) {
        [self sendEventWithName:kEventAdEvent
                           body:@{@"message": @"rewardedVideoAdDidClickSkip"}];
    }
}

@end
