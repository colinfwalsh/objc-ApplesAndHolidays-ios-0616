//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits;{
        NSPredicate *findApples = [NSPredicate predicateWithFormat:@"self == %@", @"apple"];
        NSArray *foundApplesArray = [fruits filteredArrayUsingPredicate:findApples];
        NSLog(@"%@", foundApplesArray);
    return foundApplesArray;}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database;{
        NSArray *holidays = [database[season] allKeys];
    return holidays;}

-(NSArray *)suppliesInHoliday:(NSString*)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database;{
        NSArray *supplies = database[season][holiday];
    return supplies;}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database;{
    
    NSArray *holidayArray = [database[season] allKeys];
    
    NSPredicate *findHolidays = [NSPredicate predicateWithFormat:@"self == %@", holiday];
    
    NSArray *holidayArrayPredicated = [holidayArray filteredArrayUsingPredicate:findHolidays];
    
    if([holidayArrayPredicated containsObject:holiday]){
        return true;}
    else{
        return false;}
    }


-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database;{
    
    NSArray *suppliesArray = database[season][holiday];
    
    NSPredicate *findSupplies = [NSPredicate predicateWithFormat:@"self == %@", supply];
    
    NSArray *suppliesArrayPredicated = [suppliesArray filteredArrayUsingPredicate:findSupplies];
    
    if ([suppliesArrayPredicated containsObject:supply]) {
        return true;
    }
    
    else {
        return false;}
}
-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database;{
    NSMutableArray *newHoliday = [[NSMutableArray alloc]init];
    [database[season] setValue:newHoliday forKey:holiday];
    return database;}
-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database;{
    [database[season] setValue:supply forKey:holiday];
    
    
    return database;}
@end