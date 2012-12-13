n order to find out what user your instance of apache is running as, create a test script with the following content:
<?php echo(exec("whoami")); ?>

In Terminal Go to parent of the Wordpress Directory and Execute
sudo chown -R <?php echo(exec("whoami")); ?>: wordpress<?php echo(exec("whoami")); ?>

