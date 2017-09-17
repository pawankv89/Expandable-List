//
//  ViewController.m
//  PKList
//
//  Created by Pawan kumar on 3/4/17.
//  Copyright © 2017 Pawan kumar. All rights reserved.
//

#import "ViewController.h"
#import "DetailsCell.h"
#import "HeaderCell.h"

#define kTableHeaderHeight 44.0f
#define kTableRowHeight 44.0f

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *items;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self showNoAllData];
}

-(void)showNoAllData{
    
    
    NSDictionary *Animalsdict1 = @{@"Name": @"Dog", @"isSelected":@"NO", @"id":@"1"};
    NSDictionary *Animalsdict2 = @{@"Name": @"Cat", @"isSelected":@"NO", @"id":@"2"};
    NSDictionary *Animalsdict3 = @{@"Name": @"Pig", @"isSelected":@"NO", @"id":@"3"};
    
    NSDictionary *TennisPlayersdict1 = @{@"Name": @"Federer", @"isSelected":@"NO", @"id":@"1"};
    NSDictionary *TennisPlayersdict2 = @{@"Name": @"Nadal", @"isSelected":@"NO", @"id":@"2"};

    NSDictionary *Citiesdict1 = @{@"Name": @"Naples", @"isSelected":@"NO", @"id":@"1"};
    NSDictionary *Citiesdict2 = @{@"Name": @"Genoa", @"isSelected":@"NO", @"id":@"2"};
    NSDictionary *Citiesdict3 = @{@"Name": @"New York", @"isSelected":@"NO", @"id":@"3"};
    NSDictionary *Citiesdict4 = @{@"Name": @"India", @"isSelected":@"NO", @"id":@"4"};
    
    
    NSDictionary *Singersdict1 = @{@"Name": @"Adele", @"isSelected":@"NO", @"id":@"1"};
    NSDictionary *Singersdict2 = @{@"Name": @"Arisa", @"isSelected":@"NO", @"id":@"2"};
    NSDictionary *Singersdict3 = @{@"Name": @"Clementino", @"isSelected":@"NO", @"id":@"3"};
    
    // Setup some test data
    NSMutableArray *dataSection01 = [[NSMutableArray alloc] initWithObjects:Animalsdict1, Animalsdict2, Animalsdict3, nil];
    NSMutableArray *dataSection02 = [[NSMutableArray alloc] initWithObjects:TennisPlayersdict1, TennisPlayersdict2, nil];
    NSMutableArray *dataSection03 = [[NSMutableArray alloc] initWithObjects:Citiesdict1, Citiesdict2, Citiesdict3,Citiesdict4, nil];
    NSMutableArray *dataSection04 = [[NSMutableArray alloc] initWithObjects:Singersdict1, Singersdict2, Singersdict3, nil];
    
    
    NSDictionary *dict1 = @{@"Name": @"Animals",@"List":dataSection01,@"isOpen":@"YES"};
    NSDictionary *dict2 = @{@"Name": @"Tennis players",@"List":dataSection02,@"isOpen":@"YES"};
    NSDictionary *dict3 = @{@"Name": @"Cities",@"List":dataSection03,@"isOpen":@"YES"};
    NSDictionary *dict4 = @{@"Name": @"Singers",@"List":dataSection04,@"isOpen":@"YES"};
    
    self.items = [[NSMutableArray alloc]initWithObjects:dict1,dict2,dict3,dict4,nil];
    [self.menuTableView reloadData];
    self.menuTableView.separatorColor = [UIColor clearColor];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return [self.items count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    long count = 0;
    
    NSDictionary *oldDict = [self.items objectAtIndex:section];
    
    NSString *isOpen = [oldDict objectForKey:@"isOpen"];
    
    if ([isOpen isEqualToString:@"YES"]) {
        
       count = [[[self.items objectAtIndex:section] objectForKey:@"List"] count];
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifire = @"";
    DetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    
    if (!cell) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DetailsCell" owner:self options:nil];
        cell = [nib firstObject];
    }
    
    NSDictionary *dict = [[[self.items objectAtIndex:indexPath.section] objectForKey:@"List"] objectAtIndex:indexPath.row];

    NSString *name = [dict objectForKey:@"Name"];
    cell.title.text = name;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    
    NSString *isSelected = [dict objectForKey:@"isSelected"];
    
    if ([isSelected isEqualToString:@"YES"]) {
        
        cell.radioImageView.image = [UIImage imageNamed:@"radioSelected"];
        
    }else{
        
        cell.radioImageView.image = [UIImage imageNamed:@"radioDeSelected"];
       
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTableRowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kTableHeaderHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return nil;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HeaderCell" owner:self options:nil];
    HeaderCell *sectionView = [nib firstObject];
    sectionView.frame = CGRectMake(0.0f, 0.0f, self.menuTableView.frame.size.width, kTableHeaderHeight);
    sectionView.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.menuTableView.frame.size.width, kTableHeaderHeight)];
    [sectionBtn addTarget:self action:@selector(openTheSection:) forControlEvents:UIControlEventTouchDown];
    [sectionBtn setTag:section];
    [sectionView addSubview:sectionBtn];
    
    sectionView.title.text = [[self.items objectAtIndex:section] objectForKey:@"Name"];
                              
  return sectionView;
}

-(IBAction)openTheSection:(id)sender{

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailsCell *cell = (DetailsCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    NSDictionary *dict = [[[self.items objectAtIndex:indexPath.section] objectForKey:@"List"] objectAtIndex:indexPath.row];

    NSString *selectedItemId= [dict objectForKey:@"id"];
    NSString *isSelected = [dict objectForKey:@"isSelected"];
    
    isSelected = @"YES";
    cell.radioImageView.image = [UIImage imageNamed:@"radioSelected"];
    
    NSArray *iTemsSubArray = [[self.items objectAtIndex:indexPath.section] objectForKey:@"List"];
    
    for (int counter =0; counter < [iTemsSubArray count]; counter++) {
        
        NSDictionary *dictSubItem = [iTemsSubArray objectAtIndex:counter];
     
        if ([[dictSubItem objectForKey:@"id"] isEqualToString:selectedItemId]) {
            
            NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
            [newDict addEntriesFromDictionary:dictSubItem];
            [newDict setObject:isSelected forKey:@"isSelected"];
            
            [[[self.items objectAtIndex:indexPath.section] objectForKey:@"List"] replaceObjectAtIndex:counter withObject:newDict];
            
        }else{
        
            NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
            [newDict addEntriesFromDictionary:dictSubItem];
            [newDict setObject:@"NO" forKey:@"isSelected"];
        
             [[[self.items objectAtIndex:indexPath.section] objectForKey:@"List"] replaceObjectAtIndex:counter withObject:newDict];
        }
    }
    
    [self.menuTableView reloadData];
    
}

@end
