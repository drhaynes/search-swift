//
//  OSJSONParser.m
//  Routing
//
//  Created by Dave Hardiman on 02/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import "OSJSON.h"

@interface OSJSON ()
@property (nonatomic, strong) NSObject *root;
@end

@implementation OSJSON

- (instancetype)initWithObject:(NSObject *)object {
    if (object == nil) {
        return nil;
    }
    if ((self = [super init])) {
        _root = object;
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data {
    NSObject *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return [self initWithObject:json];
}

- (instancetype)initWithData:(NSData *)data initialKeyPath:(NSString *)initialKeyPath {
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return [self initWithObject:[json valueForKeyPath:initialKeyPath]];
}

- (NSString *)stringValueForKey:(NSString *)key {
    return [(NSDictionary *)self.root objectForKey:key];
}

- (double)doubleValueForKey:(NSString *)key {
    return [[(NSDictionary *)self.root objectForKey:key] doubleValue];
}

- (int)intValueForKey:(NSString *)key {
    return [[(NSDictionary *)self.root objectForKey:key] intValue];
}

- (NSArray *)arrayValueForKey:(NSString *)key {
    return [(NSDictionary *)self.root objectForKey:key];
}

- (OSJSON *)jsonForKey:(NSString *)key {
    NSDictionary *dict = [(NSDictionary *)self.root objectForKey:key];
    return dict ? [[OSJSON alloc] initWithObject:dict] : nil;
}

- (NSArray<OSJSON *> *)array {
    if (![self.root isKindOfClass:NSArray.class]) {
        return nil;
    }
    NSMutableArray *results = [NSMutableArray array];
    for (NSObject *item in (NSArray *)self.root) {
        OSJSON *jsonItem = [[OSJSON alloc] initWithObject:item];
        [results addObject:jsonItem];
    }
    return results;
}

@end
