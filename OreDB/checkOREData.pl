use strict;

open SCHEMA, ">OREDataXMLSchemaFromSrc.html";
process_files ('C:/dev/Engine/OREData/ored');
process_files ('C:/dev/Engine/OREAnalytics/orea');

sub process_files {
	my $path = shift;
	opendir (DIR, $path) or die "Unable to open $path: $!";
	my @files = grep { !/^\.{1,2}$/ } readdir (DIR);
	closedir (DIR);
	@files = map { $path . '/' . $_ } @files;

	for (@files) {
		if (-d $_) {
			print SCHEMA '<a href="file:///'.$_.'">dir:'.$_.'</a></br>'."\n";
			process_files ($_);
		} else {
			next if !/\.cpp$/;
			print SCHEMA '<a href="file:///'.$_.'">file:'.$_.'</a></br>'."\n";
			open (FH_DF, "<".$_);
			my $funcName;
			while (<FH_DF>) {
				chomp;
				if (!$funcName) {
					($funcName) = /void (.*?)::fromXML/;
					do {print SCHEMA "---> $funcName</br>\n"; next} if $funcName;
				}
				if (/^}$/ && $funcName) {
					print SCHEMA "</br>\n";
					$funcName="";
				}
				next if !/XMLUtils::checkNode/ && !/XMLUtils::get/;
				my $plural = 1 if /ChildrenValues/;
				my ($type) = /As(.*?)\(/;
				my ($nodeName,$mandatory) = /"(.*?)", *(true|false).*/;
				print SCHEMA "$plural,$type,$nodeName,$mandatory.$_.</br>\n" if $funcName;
			}
			close FH_DF;
		}
	}
}

close SCHEMA;
