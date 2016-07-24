# cut_odoo_log
用法：
1、将cut_odoo_log.sh放置到服务器上：
设置crontab，每天凌晨00:00切割odoo访问日志crontab -e 
输入以下内容：
引用00 00 * * * /bin/bash /mnt/odoo/cut_odoo_log.sh
