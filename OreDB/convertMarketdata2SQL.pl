use strict;

my $marketdataFile = "../Examples/Input/market_20160205.txt";
my $fixingdataFile = "../Examples/Input/fixings_20160205.txt";

open SQLOUT, ">Data/marketfixingdata.sql";
print SQLOUT "use ORE\n\n";

################################
# process Marketdata
if (-e $marketdataFile) {
	print "processing $marketdataFile\n";
	open (FH_MD, "<".$marketdataFile);
	my $maxQuoteId; my %Quotehash; my %Quotevaluehash; my $linenum;
	while (<FH_MD>) {
		$linenum++;
		chomp;
		next if /^#/ or $_ eq "";
		my $colNames;
		my $colValues;
		my ($QuoteDate,$Quotestring,$QuoteValue) = /^(.*?)\s+(.*?)\s+(.*?)$/;
		if (!$Quotehash{$Quotestring}) {
			$maxQuoteId++;
			$Quotehash{$Quotestring}=$maxQuoteId;
			my ($InstrumentType,$QuoteType,$QuoteInstSpecific) = ($Quotestring =~ /^(.*?)\/(.*?)\/(.*?)$/);
			if ($InstrumentType eq "ZERO") {
				$colNames = "QuoteId,Currency,CurveId,DayCounter,Tenor,ZeroDate,Quote";
				my ($Currency,$CurveId,$DayCounter,$TenorOrZeroDate) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				my $Tenor = "NULL"; my $ZeroDate = "NULL";
				if ($TenorOrZeroDate =~ /\d+[DMWY]/) {
					$Tenor = "'".$TenorOrZeroDate."'";
				} else {
					$ZeroDate = "'".$TenorOrZeroDate."'";
				}
				$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$CurveId."','".$DayCounter."',".$Tenor.",".$ZeroDate.",'".$Quotestring."'";
			} elsif ($InstrumentType eq "DISCOUNT") {
				$colNames = "QuoteId,Currency,CurveId,Term,DiscountDate,Quote";
				my ($Currency,$CurveId,$TermOrDiscountDate) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/);
				my $Term = "NULL"; my $DiscountDate = "NULL";
				if ($TermOrDiscountDate =~ /\d+[DMWY]/) {
					$Term = "'".$TermOrDiscountDate."'";
				} else {
					$DiscountDate = "'".$TermOrDiscountDate."'";
				}
				$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$CurveId."',".$Term.",".$DiscountDate.",'".$Quotestring."'";
			} elsif ($InstrumentType eq "FX" || $InstrumentType eq "FX_SPOT") {
				$InstrumentType = "FX_SPOT";
				$colNames = "QuoteId,UnitCurrency,TargetCurrency,Quote";
				my ($UnitCurrency,$TargetCurrency) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$UnitCurrency."','".$TargetCurrency."','".$Quotestring."'";
			} elsif ($InstrumentType eq "FX_FWD" || $InstrumentType eq "FXFWD") {
				$InstrumentType = "FX_FWD";
				$colNames = "QuoteId,UnitCurrency,TargetCurrency,Term,Quote";
				my ($UnitCurrency,$TargetCurrency,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$UnitCurrency."','".$TargetCurrency."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "MM" || $InstrumentType eq "FRA") {
				$colNames = "QuoteId,Currency,ForwardStart,Term,Quote";
				my ($Currency,$ForwardStart,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$ForwardStart."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "MM_FUTURE") {
				$colNames = "QuoteId,Currency,Expiry,Contract,Term,Quote";
				my ($Currency,$Expiry,$Contract,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$Expiry."','".$Contract."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "IR_SWAP") {
				$colNames = "QuoteId,Currency,ForwardStart,Tenor,Term,Quote";
				my ($Currency,$ForwardStart,$Tenor,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$ForwardStart."','".$Tenor."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "BASIS_SWAP") {
				$colNames = "QuoteId,FlatTenor,Tenor,Term,Quote";
				my ($FlatTenor,$Tenor,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$FlatTenor."','".$Tenor."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "CC_BASIS_SWAP") {
				$colNames = "QuoteId,FlatCurrency,FlatTenor,Currency,Tenor,Term,Quote";
				my ($FlatCurrency,$FlatTenor,$Currency,$Tenor,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$FlatCurrency."','".$FlatTenor."','".$Currency."','".$Tenor."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "CDS") {
				$colNames = "QuoteId,Issuer,Seniority,Currency,Term,Quote";
				my ($Issuer,$Seniority,$Currency,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$Issuer."','".$Seniority."','".$Currency."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "RECOVERY_RATE") {
				if ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/) {
					$colNames = "QuoteId,Issuer,Seniority,Currency,Quote";
					my ($Issuer,$Seniority,$Currency) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/);
					$colValues = $Quotehash{$Quotestring}.",'".$Issuer."','".$Seniority."','".$Currency."','".$Quotestring."'";
				} else {
					$colNames = "QuoteId,SecurityID,Quote";
					$colValues = $Quotehash{$Quotestring}.",'".$QuoteInstSpecific."','".$Quotestring."'";
				}
			} elsif ($InstrumentType eq "HAZARD_RATE") {
				$colNames = "QuoteId,Issuer,Seniority,Currency,Term,Quote";
				my ($Issuer,$Seniority,$Currency,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$Issuer."','".$Seniority."','".$Currency."','".$Term."','".$Quotestring."'";
			# This is yet to be defined (PD/LGD for a Rating Name)
			} elsif ($InstrumentType eq "NAME") {
				$colNames = "QuoteId,Rating,Term,Quote";
				my ($Rating,$Term) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$Rating."','".$Term."','".$Quotestring."'";
			} elsif ($InstrumentType eq "FX_OPTION") {
				$colNames = "QuoteId,UnitCurrency,TargetCurrency,Expiry,StrikeType,Quote";
				my ($UnitCurrency,$TargetCurrency,$Expiry,$StrikeType) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$UnitCurrency."','".$TargetCurrency."','".$Expiry."','".$StrikeType."','".$Quotestring."'";
			} elsif ($InstrumentType eq "CAPFLOOR") {
				if ($QuoteType eq "SHIFT") {
					$colNames = "QuoteId,Currency,IndexTenor,Quote";
					my ($Currency,$IndexTenor) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)$/);
					$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$IndexTenor."','".$Quotestring."'";
				} else {
					$colNames = "QuoteId,Currency,Term,IndexTenor,Atm,Relative,StrikeRate,Quote";
					my ($Currency,$Term,$IndexTenor,$Atm,$Relative,$StrikeRate) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
					$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$Term."','".$IndexTenor."',".$Atm.",".$Relative.",".$StrikeRate.",'".$Quotestring."'";
				}
			} elsif ($InstrumentType eq "SWAPTION") {
				$colNames = "QuoteId,Currency,Term,IndexTenor,Dimension,StrikeRate,Quote";
				my ($Currency,$Term,$IndexTenor,$Dimension,$StrikeRate);
				if ($QuoteInstSpecific =~  /^(.*?)\/(.*?)\/(.*?)\/(.*?)\/(.*?)$/) {
					($Currency,$Term,$IndexTenor,$Dimension,$StrikeRate) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
					print "fux...";
				} else {
					($Currency,$Term,$IndexTenor,$Dimension) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
					$StrikeRate = "NULL";
				}
				$colValues = $Quotehash{$Quotestring}.",'".$Currency."','".$Term."','".$IndexTenor."','".$Dimension."',".$StrikeRate.",'".$Quotestring."'";
			} elsif ($InstrumentType eq "EQUITY") {
				$colNames = "QuoteId,Name,Currency,Quote";
				my ($Name,$Currency) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$Name."','".$Currency."','".$Quotestring."'";
			} elsif ($InstrumentType eq "EQUITY_FWD" || $InstrumentType eq "EQUITY_DIVIDEND") {
				$colNames = "QuoteId,Name,Currency,Maturity,MaturityDate,Quote";
				my ($Name,$Currency,$MaturityOrDate) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/);
				my $Maturity = "NULL"; my $MaturityDate = "NULL";
				if ($MaturityOrDate =~ /\d+[DMWY]/) {
					$Maturity = "'".$MaturityOrDate."'";
				} else {
					$MaturityDate = "'".$MaturityOrDate."'";
				}
				$colValues = $Quotehash{$Quotestring}.",'".$Name."','".$Currency."',".$Maturity.",".$MaturityDate.",'".$Quotestring."'";
			} elsif ($InstrumentType eq "EQUITY_OPTION") {
				$colNames = "QuoteId,Name,Currency,Expiry,ExpiryDate,StrikeRate,StrikeType,Quote";
				my ($Name,$Currency,$ExpiryOrDate,$StrikeTypeOrRate) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				my $Expiry = "NULL"; my $ExpiryDate = "NULL";
				if ($ExpiryOrDate =~ /\d+[DMWY]/) {
					$Expiry = "'".$ExpiryOrDate."'";
				} else {
					$ExpiryDate = "'".$ExpiryOrDate."'";
				}
				my $StrikeType = "NULL"; my $StrikeRate = "NULL";
				if ($StrikeTypeOrRate eq "ATMF") {
					$StrikeType = "'".$StrikeTypeOrRate."'";
				} else {
					$StrikeRate = $StrikeTypeOrRate;
				}
				$colValues = $Quotehash{$Quotestring}.",'".$Name."','".$Currency."',".$Expiry.",".$ExpiryDate.",".$StrikeRate.",".$StrikeType.",'".$Quotestring."'";
			} elsif ($InstrumentType eq "ZC_INFLATIONSWAP" || $InstrumentType eq "YY_INFLATIONSWAP") {
				$colNames = "QuoteId,IndexName,Maturity,Quote";
				my ($IndexName,$Maturity) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$IndexName."','".$Maturity."','".$Quotestring."'";
			} elsif ($InstrumentType eq "ZC_INFLATIONCAPFLOOR") {
				$colNames = "QuoteId,IndexName,Maturity,CapFloor,StrikeRate,Quote";
				my ($IndexName,$Maturity,$CapFloor,$StrikeRate) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$IndexName."','".$Maturity."','".$CapFloor."',".$StrikeRate.",'".$Quotestring."'";
			} elsif ($InstrumentType eq "SEASONALITY") {
				$colNames = "QuoteId,CorrFactType,IndexName,CorrFactMonth,Quote";
				my ($CorrFactType,$IndexName,$CorrFactMonth) = ($QuoteInstSpecific =~ /^(.*?)\/(.*?)\/(.*?)$/);
				$colValues = $Quotehash{$Quotestring}.",'".$CorrFactType."','".$IndexName."','".$CorrFactMonth."','".$Quotestring."'";
			} elsif ($InstrumentType eq "BOND") {
				$colNames = "QuoteId,Name,Quote";
				$colValues = $Quotehash{$Quotestring}.",'".$QuoteInstSpecific."','".$Quotestring."'";
			# if we don't have a defined marketdata structure then we also don't need the data value inserts ...
			} else {
				$Quotevaluehash{$Quotestring.$QuoteDate} = "ignoring unhandled data type: $Quotestring \n";
			}
			print SQLOUT "INSERT MarketdataDefinitions (InstrumentType,QuoteType,".$colNames.") VALUES ('".$InstrumentType."','".$QuoteType."',".$colValues.")\n" if $colNames;
		}
		
		if (!$Quotevaluehash{$Quotestring.$QuoteDate}) {
			print SQLOUT "INSERT Marketdata (QuoteId,QuoteDate,QuoteValue) VALUES (".$Quotehash{$Quotestring}.",'".$QuoteDate."',".$QuoteValue.")\n";
			#  to avoid unwanted duplicates, mark already inserted ones
			$Quotevaluehash{$Quotestring.$QuoteDate} = "already inserted $Quotestring @ $QuoteDate \n";
		} else {
			print $Quotevaluehash{$Quotestring.$QuoteDate};
		}
	}
	close FH_MD;
}

################################
# process Fixingdata
if (-e $fixingdataFile) {
	print "processing $fixingdataFile\n";
	open (FH_MD, "<".$fixingdataFile);
	my $maxIndexId; my %Indexhash; my %Indexvaluehash;
	while (<FH_MD>) {
		chomp;
		next if /^#/ or $_ eq "";
		my $colNames;
		my $colValues;
		my ($FixingDate,$Indexstring,$IndexValue) = /^(.*?)\s+(.*?)\s+(.*?)$/;
		if (!$Indexhash{$Indexstring}) {
			$maxIndexId++;
			$Indexhash{$Indexstring}=$maxIndexId;
			if ($Indexstring =~ /FX-/) {
				$colNames = "IndexId,Source,ForeignCurrency,DomesticCurrency,FixingIndex";
				my ($Source,$ForeignCurrency,$DomesticCurrency) = ($Indexstring =~ /^FX-(.*?)-(.*?)-(.*?)$/);
				$colValues = $Indexhash{$Indexstring}.",'".$Source."','".$ForeignCurrency."','".$DomesticCurrency."','".$Indexstring."'";
			} elsif ($Indexstring =~ /-CMS-/) {
				$colNames = "IndexId,Currency,isCMS,Tenor,FixingIndex";
				my ($Ccy,$Tenor) = ($Indexstring =~ /^(.*?)-CMS-(.*?)$/);
				$colValues = $Indexhash{$Indexstring}.",'".$Ccy."',1,'".$Tenor."'";
			} elsif ($Indexstring =~ /^.*?-.*?/) {
				my ($Ccy,$IndexName,$Tenor);
				$colNames = "IndexId,Currency,IndexName,Tenor,FixingIndex";
				if ($Indexstring =~ /^(.*?)-(.*?)-(.*?)$/) {
					($Ccy,$IndexName,$Tenor) = ($Indexstring =~ /^(.*?)-(.*?)-(.*?)$/);
				} elsif ($Indexstring =~ /^(.*?)-(.*?)$/) {
					($Ccy,$IndexName) = ($Indexstring =~ /^(.*?)-(.*?)$/);
					$Tenor = "NULL";
				}
				$colValues = $Indexhash{$Indexstring}.",'".$Ccy."','".$IndexName."','".$Tenor."','".$Indexstring."'";
			} else {
				$colNames = "IndexId,Name,FixingIndex";
				$colValues = $Indexhash{$Indexstring}.",'".$Indexstring."','".$Indexstring."'";
			}
			print SQLOUT "INSERT FixingDataDefinitions (".$colNames.") VALUES (".$colValues.")\n";
		}
		#  to avoid unwanted duplicates
		if (!$Indexvaluehash{$Indexstring.$FixingDate}) {
			print SQLOUT "INSERT Fixingdata (IndexId,FixingDate,IndexValue) VALUES (".$Indexhash{$Indexstring}.",'".$FixingDate."',".$IndexValue.")\n";
			$Indexvaluehash{$Indexstring.$FixingDate} = 1;
		}
	}
	close FH_MD;
}

close SQLOUT;