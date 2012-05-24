setsebool -P httpd_unified 1
allow httpd_t httpd_sys_content_t:file write;
audit2allow -R

