<%@ page language="java" import="java.util.*" isELIgnored="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
String path2 = request.getContextPath();
String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path2+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <base href="<%=basePath2%>">
	<title>Help</title>
	<link rel="stylesheet" href="easybackup/css/github.css">
</head>
<div id="body">
<div class="highlight highlight-source-ini"><pre><span class="pl-c">######################## Global Config(Optional) 全局配置（可选）</span>

<span class="pl-c"># Backup ON or OFF, default is ON</span>
<span class="pl-c"># 备份服务默认是否打开，默认为 ON</span>
<span class="pl-k">easybackup.enable</span>=ON

<span class="pl-c"># Backup trigger Cron-Expressions</span>
<span class="pl-c"># 备份服务的默认调度 Cron-Expressions； 默认为 '0 30 * * * ?'</span>
<span class="pl-k">easybackup.cronexpression</span>=0 30 * * * ?

<span class="pl-c"># Directory to store the backup file</span>
<span class="pl-c"># You can specify more than one, separated by a ;</span>
<span class="pl-c"># 文件备份目录，多个备份目录使用 ; 分隔</span>
<span class="pl-k">easybackup.dir</span>=/user/backup/
<span class="pl-c"># backup file name under 'easybackup.backup.dir' directory</span>
<span class="pl-c"># If not specified, the automatically generated file name is 'targetFileName-yyyyMMddHHmmssS[.zip|tar|tar.gz]'</span>
<span class="pl-c"># you can use variable: ${targetFileName}, ${name}, ${type}, ${value}, ${backuptime}, ${backupConfiguration.XXX}</span>
<span class="pl-c"># 在文件备份目录下的备份的文件名</span>
<span class="pl-c"># 默认为 'targetFileName-yyyyMMddHHmmssS[.zip|tar|tar.gz]'</span>
<span class="pl-c"># 可以使用以下变量：${targetFileName}, ${name}, ${type}, ${value}, ${backuptime?string("yyyyMMddHHmmssS")}, ${backupConfiguration.XXX}</span>
<span class="pl-k">easybackup.file</span>=

<span class="pl-c"># Whether backup compression, default is OFF</span>
<span class="pl-c"># 默认是否使用压缩备份，默认为 OFF</span>
<span class="pl-k">easybackup.compress</span>=OFF
<span class="pl-c"># Compression format: TAR(*.tar), ZIP(*.zip), GZIP(*.tar.gz), default is ZIP</span>
<span class="pl-c"># 压缩备份使用的压缩方式，默认为 ZIP</span>
<span class="pl-k">easybackup.compressType</span>=ZIP
<span class="pl-c"># Comprssion encoding</span>
<span class="pl-c"># 压缩文件使用的编码格式</span>
<span class="pl-k">easybackup.compressEncoding</span>=

<span class="pl-c"># Whether delete targetFile after backup complete, default is OFF</span>
<span class="pl-c"># 备份完成后，是否删除已备份的目标文件，默认为 OFF</span>
<span class="pl-k">easybackup.deleteTargetFile</span>=OFF

<span class="pl-c"># Receive Backup file mail address</span>
<span class="pl-c"># You can specify more than one, separated by a ;</span>
<span class="pl-c"># 接收备份信息的邮箱列表，多个邮箱使用 ; 分隔</span>
<span class="pl-k">easybackup.mail.receiver</span>=yourmail@domain.com<span class="pl-c">;youmail2@domai2.org</span>

<span class="pl-c"># Send Mail Account Config</span>
<span class="pl-c"># 邮箱发送者账户配置</span>
<span class="pl-c"># Send Mail Account</span>
<span class="pl-k">easybackup.mail.sender</span>=sendermail@domain.com
<span class="pl-c"># Send Mail password</span>
<span class="pl-c"># 邮箱发送者密码</span>
<span class="pl-k">easybackup.mail.sender.passowrd</span>=mailpassword
<span class="pl-c"># Send Mail SMTP host</span>
<span class="pl-c"># 邮箱发送者 host</span>
<span class="pl-k">easybackup.mail.sender.host</span>=smtp.163.com
<span class="pl-c"># Send Mail SMTP port; default is 25</span>
<span class="pl-c"># 邮箱发送者 host 端口</span>
<span class="pl-k">easybackup.mail.sender.port</span>=25
<span class="pl-c"># Send Mail Whether use SSL; default is false</span>
<span class="pl-c"># 是否使用了 SSL 协议</span>
<span class="pl-k">easybackup.mail.sender.ssl</span>=false
<span class="pl-c"># Send Mail title</span>
<span class="pl-c"># you can use variable: ${targetFileName}, ${name}, ${type}, ${value}, ${backuptime?datetime}, ${backupConfiguration.XXX}</span>
<span class="pl-c"># 邮件发送标题</span>
<span class="pl-c"># 可以使用以下变量：${targetFileName}, ${name}, ${type}, ${value}, ${backuptime?datetime}, ${backupConfiguration.XXX}</span>
<span class="pl-k">easybackup.mail.sender.title</span>=Backup ${targetFileName}- EasyBackup
<span class="pl-c"># The send mail content freemarker template in template directory, default is 'mail.tpl'</span>
<span class="pl-c"># template 目录下的邮件发送模板，默认为 mail.tpl</span>
<span class="pl-k">easybackup.mail.sender.template</span>=mail.tpl

<span class="pl-c"># Auto delete when send email complete ON or OFF, default is OFF</span>
<span class="pl-c"># 备份发送到邮箱后，是否删除备份文件，默认为 OFF</span>
<span class="pl-k">easybackup.mail.deleteBackup</span>=OFF

<span class="pl-c"># Execute Command when backup before or after</span>
<span class="pl-c"># You can specify more than one, separated by a ;</span>
<span class="pl-c"># 备份开始前或完成后执行的前置和后置命令脚本，多个命令脚本使用 ; 分隔</span>
<span class="pl-k">easybackup.cmd.before</span>=
<span class="pl-k">easybackup.cmd.after</span>=

<span class="pl-c"># Execute Interceptor when backup before or after</span>
<span class="pl-c"># You can specify more than one, separated by a ;</span>
<span class="pl-c"># 备份开始前或完成后执行的前置和后置处理类，多个类完全限定名使用 ; 分隔</span>
<span class="pl-k">easybackup.beforeClass</span>=
<span class="pl-k">easybackup.afterClass</span>=


<span class="pl-c">########################  Backup Service Configuration 监控配置</span>

<span class="pl-c">############ File Backup(can override global config)</span>
<span class="pl-c">## format: </span>
<span class="pl-c">## easybackup.file.NAME=value</span>
<span class="pl-c">## easybackup.file.NAME.enable=ON | OFF</span>
<span class="pl-c">## easybackup.file.NAME.cronexpression=0/10 * * * * ?</span>
<span class="pl-c">## easybackup.file.NAME.dir=/user/backup/;/user/backup2</span>
<span class="pl-c">## easybackup.file.NAME.file=</span>
<span class="pl-c">## easybackup.file.NAME.compress=ON | OFF</span>
<span class="pl-c">## easybackup.file.NAME.compressType=ZIP | GZIP | TAR</span>
<span class="pl-c">## easybackup.file.NAME.compressEncoding=</span>
<span class="pl-c">## easybackup.file.NAME.deleteTargetFile=ON | OFF</span>
<span class="pl-c">## easybackup.file.NAME.cmd.before=/user/backupBefore.sh;/user/backupBefore2.sh</span>
<span class="pl-c">## easybackup.file.NAME.cmd.after=/user/backcAfter.sh;/user/backcAfter2.sh</span>
<span class="pl-c">## easybackup.file.NAME.beforeClass=package.BackupBefore;package.BackupBefore2</span>
<span class="pl-c">## easybackup.file.NAME.afterClass=package.BackupAfter;package.BackupAfter2</span>
<span class="pl-c">## easybackup.file.NAME.mail.receiver=receivermail@domain.com;receivermail1@domain.com</span>
<span class="pl-c">## easybackup.file.NAME.mail.sender=sendermail@domain.com</span>
<span class="pl-c">## easybackup.file.NAME.mail.sender.passowrd=sendermail_password</span>
<span class="pl-c">## easybackup.file.NAME.mail.sender.host=sendermail_host</span>
<span class="pl-c">## easybackup.file.NAME.mail.sender.port=sendermail_port</span>
<span class="pl-c">## easybackup.file.NAME.mail.sender.ssl=sendermail_ssh</span>
<span class="pl-c">## easybackup.file.NAME.mail.sender.title=sendermail_title</span>
<span class="pl-c">## easybackup.file.NAME.mail.sender.template=mail.tpl</span>
<span class="pl-c">## easybackup.file.NAME.mail.deleteBackup=ON | OFF</span>
<span class="pl-c">## easybackup.file.NAME.senders=package.userSenderClass;package.userSenderClass2</span>



<span class="pl-c"># Example:</span>
<span class="pl-k">easybackup.file.LOG</span>=D:/log
<span class="pl-k">easybackup.file.LOG.enable</span>=ON
<span class="pl-k">easybackup.file.LOG.dir</span>=D:/backup/logfile/<span class="pl-c">;E:/backup/logfile</span>
<span class="pl-k">easybackup.file.LOG.cronexpression</span>=0 30 * * * ?
<span class="pl-k">easybackup.file.LOG.compress</span>=ON
<span class="pl-k">easybackup.file.LOG.compressType</span>=ZIP
<span class="pl-c">#easybackup.file.LOG.mail.receiver=mail@domain.com</span>


<span class="pl-c">############ Port Monitor(can override global config)</span>
<span class="pl-c">## format: </span>
<span class="pl-c">## easybackup.user.NAME=value</span>
<span class="pl-c">## easybackup.user.NAME.enable=ON | OFF</span>
<span class="pl-c">## easybackup.user.NAME.cronexpression=0/10 * * * * ?</span>
<span class="pl-c">## easybackup.user.NAME.dir=/user/backup/;/user/backup2</span>
<span class="pl-c">## easybackup.user.NAME.file=</span>
<span class="pl-c">## easybackup.user.NAME.compress=ON | OFF</span>
<span class="pl-c">## easybackup.user.NAME.compressType=ZIP | GZIP | TAR</span>
<span class="pl-c">## easybackup.user.NAME.compressEncoding=</span>
<span class="pl-c">## easybackup.user.NAME.deleteTargetFile=ON | OFF</span>
<span class="pl-c">## easybackup.user.NAME.targetFileClass=package.YourTargetFile</span>
<span class="pl-c">## easybackup.user.NAME.dirClass=package.YourBackupDir</span>
<span class="pl-c">## easybackup.user.NAME.fileClass=package.YourBackupFile</span>
<span class="pl-c">## easybackup.user.NAME.backupClass=package.YourBackup</span>
<span class="pl-c">## easybackup.user.NAME.cmd.before=/user/backupBefore.sh;/user/backupBefore2.sh</span>
<span class="pl-c">## easybackup.user.NAME.cmd.after=/user/backcAfter.sh;/user/backcAfter2.sh</span>
<span class="pl-c">## easybackup.user.NAME.beforeClass=package.BackupBefore;package.BackupBefore2</span>
<span class="pl-c">## easybackup.user.NAME.afterClass=package.BackupAfter;package.BackupAfter2</span>
<span class="pl-c">## easybackup.user.NAME.mail.receiver=receivermail@domain.com;receivermail1@domain.com</span>
<span class="pl-c">## easybackup.user.NAME.mail.sender=sendermail@domain.com</span>
<span class="pl-c">## easybackup.user.NAME.mail.sender.passowrd=sendermail_password</span>
<span class="pl-c">## easybackup.user.NAME.mail.sender.host=sendermail_host</span>
<span class="pl-c">## easybackup.user.NAME.mail.sender.port=sendermail_port</span>
<span class="pl-c">## easybackup.user.NAME.mail.sender.ssl=sendermail_ssh</span>
<span class="pl-c">## easybackup.user.NAME.mail.sender.title=sendermail_title</span>
<span class="pl-c">## easybackup.user.NAME.mail.sender.template=mail.tpl</span>
<span class="pl-c">## easybackup.user.NAME.mail.deleteBackup=ON | OFF</span>
<span class="pl-c">## easybackup.user.NAME.senders=package.userSenderClass;package.userSenderClass2</span>

<span class="pl-c"># Example:</span>
<span class="pl-k">easybackup.user.MySQL</span>=mysqldump -uroot -proot demoDB 
<span class="pl-k">easybackup.user.MySQL.targetFileClass</span>=cn.easyproject.easybackup.mysql.MySQLTargetFile
<span class="pl-k">easybackup.user.MySQL.dir</span>=D:/backup/<span class="pl-c">;E:/backupdb</span>
<span class="pl-c"># default targetFileName is 'demoDB-yyyyMMddHHmmssS.sql'</span>
<span class="pl-c"># you can use variable: ${targetFileName}, ${name}, ${type}, ${value}, ${backuptime?string("yyyyMMddHHmmssS")}, ${backupConfiguration.XXX}</span>
<span class="pl-k">easybackup.user.MySQL.file</span>= demodb-${backuptime?string(<span class="pl-s"><span class="pl-pds">"</span>yyyyMMddHHmmss<span class="pl-pds">"</span></span>)}-backup.sql
<span class="pl-k">easybackup.user.MySQL.compress</span>=ON
<span class="pl-k">easybackup.user.MySQL.compressType</span>=ZIP
<span class="pl-k">easybackup.user.MySQL.cronexpression</span>=0 0 2 * * ?
<span class="pl-c">#easybackup.user.MySQL.mail.receiver=mail@domain.com</span></pre></div>
</div>

</body>
</html>