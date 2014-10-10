//
//  AppDelegate.h
//  XMPPDemoZhenyuGao
//
//  Created by apple on 14/10/8.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "XMPPFramework.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,XMPPRosterDelegate>
{
    NSString *password;
    
    BOOL customCertEvaluation;
    
    BOOL isXmppConnected;
    
    BOOL isRegister;
}

@property (nonatomic, strong, readonly) XMPPStream *xmppStream;
@property (nonatomic, strong, readonly) XMPPReconnect *xmppReconnect;
@property (nonatomic, strong, readonly) XMPPRoster *xmppRoster;
@property (nonatomic, strong, readonly) XMPPRosterCoreDataStorage *xmppRosterStorage;
@property (nonatomic, strong, readonly) XMPPvCardTempModule *xmppvCardTempModule;
@property (nonatomic, strong, readonly) XMPPvCardAvatarModule *xmppvCardAvatarModule;
@property (nonatomic, strong, readonly) XMPPCapabilities *xmppCapabilities;
@property (nonatomic, strong, readonly) XMPPCapabilitiesCoreDataStorage *xmppCapabilitiesStorage;
@property (nonatomic, strong, readonly) XMPPvCardCoreDataStorage *xmppvCardStorage;

@property (strong, nonatomic) UIWindow *window;

- (NSManagedObjectContext *)managedObjectContext_roster;
- (NSManagedObjectContext *)managedObjectContext_capabilities;


//状态

//是否连接
-(BOOL)connect;
//断开连接
-(void)disconnect;

- (void)setupStream;
- (void)teardownStream;

- (void)goOnline;
- (void)goOffline;

- (void) gotoRegister;
@end

