// 使用apple默认的内部方法处理，速度很慢，不建议使用在循环中
- (NSDate *)dateFromString:(NSString *)string {
	//Wed Mar 14 16:40:08 +0800 2012
	if (!string) return nil;
	NSDateFormatter *dateformatter=dateformatter = [[NSDateFormatter alloc] init];
	NSTimeZone *tz = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	[dateformatter setTimeZone:tz];
	[dateformatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];;
	return [dateformatter dateFromString:string];
}

// 改进版
- (NSDate *)dateFromString:(NSString *)string {
	 //Wed Mar 14 16:40:08 +0800 2012
	 if (!string) return nil;
		struct tm tm;
		time_t t;
		string=[string substringFromIndex:4];
		strptime([string cStringUsingEncoding:NSUTF8StringEncoding], "%b %d %H:%M:%S %z %Y", &tm);
		tm.tm_isdst = -1;
		t = mktime(&tm);
		return [NSDate dateWithTimeIntervalSince1970:t];
}
