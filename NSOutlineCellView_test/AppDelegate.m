//
//  AppDelegate.m
//  NSOutlineCellView_test
//
//  Created by Gregory John Casamento on 4/21/24.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSOutlineView *outlineView;
// @property (strong) NSMutableDictionary *objectDictionary;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    /*
    NSMutableDictionary *objs = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 [NSMutableDictionary dictionary],
                                 @"NSString",
                                 [NSMutableDictionary dictionary],
                                 @"NSArray", nil];
    self.objectDictionary = [NSMutableDictionary dictionary];
    [self.objectDictionary setObject: objs forKey: @"NSObject"];
     */
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    self.outlineView.outlineTableColumn = [[self.outlineView tableColumns] objectAtIndex: 0];
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction) reload: (id)sender
{
    [self.outlineView reloadData];
}

// Data source
- (NSInteger) outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    if ([item isEqualToString: @"NSObject"])
    {
        return 2;
    }
    
    return 1;
}

// Delegate
- (NSView *) outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    NSTextField *tf = [[NSTextField alloc] initWithFrame: NSMakeRect(0, 0, 50, 10)];
    [tf setStringValue: item];
    return tf;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    if ([item isEqualToString: @"NSObject"] && index == 0)
    {
        return @"NSString";
    }
    
    if ([item isEqualToString: @"NSObject"] && index == 1)
    {
        return @"NSArray";
    }
    
    if (item == nil)
    {
        return @"NSObject";
    }
    
    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    if ([item isEqualToString: @"NSObject"])
    {
        return YES;
    }
    
    return NO;
}
@end
