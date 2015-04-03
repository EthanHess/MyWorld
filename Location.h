//
//  Location.h
//  MyWorld
//
//  Created by Ethan Hess on 4/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entry, Picture;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitute;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *entries;
@property (nonatomic, retain) NSOrderedSet *pictures;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)insertObject:(Entry *)value inEntriesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEntriesAtIndex:(NSUInteger)idx;
- (void)insertEntries:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEntriesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEntriesAtIndex:(NSUInteger)idx withObject:(Entry *)value;
- (void)replaceEntriesAtIndexes:(NSIndexSet *)indexes withEntries:(NSArray *)values;
- (void)addEntriesObject:(Entry *)value;
- (void)removeEntriesObject:(Entry *)value;
- (void)addEntries:(NSOrderedSet *)values;
- (void)removeEntries:(NSOrderedSet *)values;
- (void)insertObject:(Picture *)value inPicturesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPicturesAtIndex:(NSUInteger)idx;
- (void)insertPictures:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePicturesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPicturesAtIndex:(NSUInteger)idx withObject:(Picture *)value;
- (void)replacePicturesAtIndexes:(NSIndexSet *)indexes withPictures:(NSArray *)values;
- (void)addPicturesObject:(Picture *)value;
- (void)removePicturesObject:(Picture *)value;
- (void)addPictures:(NSOrderedSet *)values;
- (void)removePictures:(NSOrderedSet *)values;
@end
