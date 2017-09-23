
Expandable-List
=========

## Expandable-List with multiple radio button selection.
------------
 Added Some screens here.
 
[![](https://github.com/pawankv89/Expandable-List/blob/master/images/screen_1.png)]
[![](https://github.com/pawankv89/Expandable-List/blob/master/images/screen_2.png)]


## Usage
------------
 You can add this method in your `UICollectionView`.


```objective-c
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
```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each MBProgressHUD release can be found in the [CHANGELOG](CHANGELOG.mdown). 
