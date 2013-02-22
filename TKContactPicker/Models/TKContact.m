//
//  TKContact.h
//  TKContactsMultiPicker
//
//  Created by Jongtae Ahn on 12. 8. 31..
//  Copyright (c) 2012년 TABKO Inc. All rights reserved.
//

#import "TKContact.h"

@implementation TKContact
@synthesize name, email, emails, tel, tels, thumbnail, recordID, sectionNumber, rowSelected, lastName, firstName;

- (id)init
{
    self = [super init];
    if (self) {
        emails = [[NSMutableArray alloc] init];
        tels = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [name release];
    [email release];
    [emails release];
    [tel release];
    [tels release];
    [thumbnail release];
    [lastName release];
    [firstName release];
    
    [super dealloc];
}

- (NSString*)sorterFirstName {
    if (nil != firstName && ![firstName isEqualToString:@""]) {
        return firstName;
    }
    if (nil != lastName && ![lastName isEqualToString:@""]) {
        return lastName;
    }
    if (nil != name && ![name isEqualToString:@""]) {
        return name;
    }
    return nil;
}

- (NSString*)sorterLastName {
    if (nil != lastName && ![lastName isEqualToString:@""]) {
        return lastName;
    }
    if (nil != firstName && ![firstName isEqualToString:@""]) {
        return firstName;
    }
    if (nil != name && ![name isEqualToString:@""]) {
        return name;
    }
    return nil;
}

- (NSDictionary *)contactAsDictionary
{
    NSMutableDictionary *results = [[[NSMutableDictionary alloc] init] autorelease];
    if (self.name) {
        [results setObject:[self.name autorelease] forKey:@"name"];
    }
    [results setObject:[self.emails autorelease] forKey:@"emails"];
    [results setObject:[self.tels autorelease] forKey:@"phones"];
    return results;
}

@end
