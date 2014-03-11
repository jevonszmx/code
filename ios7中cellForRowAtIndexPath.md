

最近在开发IOS7的应用发现有个方法似乎是有问题的，就是下面这个 

```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
```

下面分别查看之前的实现过程和现在的实现过程 

之前的实现过程如下： 
    
```objective-c

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *CellIdentifier = @"Cell";
        
        //创建cell
        UITableViewCell *cell = [_dataTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                          reuseIdentifier:CellIdentifier];
        }
        
        //获取行的个数
        NSInteger row = [indexPath row];
    
        // Configure the cell...
        cell.detailTextLabel.text = @"good";
        cell.textLabel.text = [NSString stringWithFormat:@"%d",row];
        return cell;
    }
```   

IOS7下面的实现过程如下：  

```objective-c

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *CellIdentifier = @"Cell";
        
        //注册要使用的cell
        [tableView registerClass:[UITableViewCell class]
          forCellReuseIdentifier:CellIdentifier];
        
        //创建cell
        UITableViewCell *cell = [_dataTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                          reuseIdentifier:CellIdentifier];
        }
        
        //获取行的个数
        NSInteger row = [indexPath row];
    
        // Configure the cell...
        cell.detailTextLabel.text = @"good";
        cell.textLabel.text = [NSString stringWithFormat:@"%d",row];
        return cell;
    }
    
```
  

