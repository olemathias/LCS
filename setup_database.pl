require "config.pm";

use String::Random;
$pass = new String::Random;

my $db_name = $lcs::config::db_name;
my $db_user = $lcs::config::db_username;
my $db_password = $pass->randpattern("Cn!CnCcC!Ccn");
my $root_password = $lcs::config::db_root_password;

$Q1="CREATE DATABASE IF NOT EXISTS $db_name;";
$Q2="GRANT ALL ON $db_name.* TO \'$db_user\'@\'localhost\' IDENTIFIED BY \'$db_password\';";
$Q3="FLUSH PRIVILEGES;";
$sql = "$Q1 $Q2 $Q3";

system("mysql -uroot -p$root_password  -e \"$sql\"");
system("mysql -uroot -p$root_password $db_name < lcs.sql");

print "Created database $db_name with user: $db_user and password: $db_password  UPDATE THE DB_PASSWORD IN THE config.pm AND REMOVE ROOT PASSWORD\n";
