#!/usr/local/bin/php
<?php

# config
$prefix = "/usr/local/webdata";
$ip = '192.168.0.178';
$svnsvr = "svn://{$ip}";
$username = 'mingxin.zhuang';
$password = 'caW2JCo3';

# parse
$story = '';
parse_str($argv[1], $story);
if (empty($story)) {
    echo "请输入需求号，如：STORY #88888::超返又来一个分流，哈哈！\n";
    exit(1);
}
$story = (array_shift(array_keys($story)));

list($branches, $version) = explode('#', $story);
$branches = strtolower(str_replace('_', '', $branches));
$version = intval($version);

# current dir => project name, like 'fun'、'mobile'
$project_name = basename(dirname($_SERVER['PWD']));

$des_path = "{$svnsvr}/{$project_name}/branches/{$branches}{$version}";
$auth = " --username $username --password $password ";

system("svn list $auth $password {$des_path} 2>&1 |grep 'non-existent' 2>&1 >/dev/null", $list_return);

# svn copy
if (empty($list_return)) {
     # 分支不存在则建立新分支
    $copy_return = system("svn copy -r HEAD $auth $svnsvr/$project_name/release {$des_path} -m \"{$story}\"");
    echo "～创建分支成功.\n";
}
else {
    echo "～分支已存在.\n";
}

#switch
echo "开始switch到当前目录...\n";
system("svn sw $auth {$des_path} .");
echo "代码switch到当前目录成功！\n";

# 检查当前目录分支
echo "当前分支：" . system("svn info|grep URL") . "\n";

# 如果当前目录有Runtime目录，则删除

if (is_dir('./Runtime')) {
    system("rm -rf ./Runtime");
    echo "\n已删除runtime\n";
}
exit(0);


?>
