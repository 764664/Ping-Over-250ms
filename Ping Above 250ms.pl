#!perl
$| = 1;
print "Input IP.\n";
$ip = <STDIN>;
$count = 0;
while(1){
    @result = `ping $ip -n 5`;
    $_ = @result[-1];
    if(m/Average = (\d+)ms/){
        if($1>250){
            my($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time());
            $count ++;
            print $hour.":".$min." ".$1."ms"." Count:".$count."\n";
        }
    }
    sleep(60);
}