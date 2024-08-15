//
//  TSDKCollectionCommand.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 9/10/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKCollectionQuery.h"

@interface TSDKCollectionCommand : TSDKCollectionQuery <NSCopying, NSSecureCoding>

-(void)executeWithExtraParameters:(NSDictionary *_Nullable)extraParameters completion:(TSDKCompletionBlock _Nullable)completion;
-(void)executeCollectionJSONTemplateWithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end
