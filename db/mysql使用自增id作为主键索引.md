### mysql使用自增id作为主键索引：

```
SET @row1 := 0;
SELECT @row1 :=@row1 + 1 as id, a.id as item_id from table as a
```
