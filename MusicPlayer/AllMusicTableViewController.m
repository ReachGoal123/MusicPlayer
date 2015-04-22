//
//  AllMusicTableViewController.m
//  MusicPlayer
//
//  Created by tarena3812 on 15/3/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AllMusicTableViewController.h"
#import "TRMusic.h"
#import "TRMusicGroup.h"
#import "MusicTableViewCell.h"
@interface AllMusicTableViewController ()
@property (nonatomic, strong) NSMutableArray *allMusics;
@end

@implementation AllMusicTableViewController

- (NSMutableArray *)allMusics
{
    if (!_allMusics) {
        _allMusics = [NSMutableArray array];
        NSArray *array = [TRMusicGroup fakeData];
        for (NSInteger count = 0; count<array.count; count++) {
            TRMusicGroup *musicGroup = array[count];
            if (musicGroup.musics.count>0) {
                [_allMusics addObjectsFromArray:musicGroup.musics];
            }
        }
    }
    return _allMusics;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%ld",self.allMusics.count);
    [self.tableView registerClass:[MusicTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.allMusics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.music = self.allMusics[indexPath.row];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
