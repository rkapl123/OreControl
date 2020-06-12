# convertXML2SQL.pl - converts ORE xml parametrization files to ORE DB sql statements

# $ARGV[0] .. oreRoot - ORE Root folder
# $ARGV[1] .. configDir - configuration files folder
# $ARGV[2] .. xsdDir - xsd schema definitions folder
# $ARGV[3] .. inputDir - analysis input folder

# Assumptions: XML parametrization filenames are
# configDir - conventions.xml, pricingengine.xml, todaysmarket.xml and curveconfig.xml
# inputDir  - portfolio.xml, ore.xml, netting.xml, simulation.xml, stresstest.xml and sensitivity.xml

use strict;
use XML::LibXML; use Data::Dumper;
use Scalar::Util qw(looks_like_number);

# set this to your ORE Root folder
my $oreRoot = ($ARGV[0] ? $ARGV[0] : 'C:\dev\ORE\master');
# set this to the folder where configuration files are located
my $configDir = ($ARGV[1] ? $ARGV[1] : "$oreRoot/Examples/Input");
# set this to the xsd schema definitions (should be the ones from the ORE Engine)
my $xsdDir = ($ARGV[2] ? $ARGV[2] : "$oreRoot/xsd");
# set this to your analysis input folder (to translate portfolio, ore parameters, netting sets and simulation/stresstest/sensitivity parameters)
my $inputDir = ($ARGV[3] ? $ARGV[3] : "$oreRoot/Examples/Example_1/Input");
# leave empty to process standard examples
$inputDir = "" if !$ARGV[0];
# GroupingId is used to query parameters from the database, set this to a meaningful name
my $GroupingId = ($ARGV[4] ? $ARGV[4] : "ExampleInput");

print "oreRoot:$oreRoot, configDir:$configDir, xsdDir:$xsdDir, inputDir:$inputDir...\n";

# to have unique parties from multiple netting.xml files (examples !), store in central "parties" hash...
my %parties;

###############################################################################################################################
# First convert common settings (conventions, curveconfig, pricingengine, ore types and todaysmarket)

# process conventions data
if (-e $configDir.'/conventions.xml') {
	open SQLOUT, ">Data/configTableconventions.sql";
	print SQLOUT "use ORE;\n\n";
	print "processing conventions.xml\n";
	my $xmlcontent = getXMLData($configDir.'/conventions.xml');
	print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$GroupingId."conventions','conventions','".$GroupingId." Description','".$xmlcontent."');\n";
	close SQLOUT;
}

# process pricingengine data
if (-e $configDir.'/pricingengine.xml') {
	open SQLOUT, ">Data/configTablepricingengine.sql";
	print SQLOUT "use ORE;\n\n";
	print "processing pricingengine.xml\n";
	my $xmlcontent = getXMLData($configDir.'/pricingengine.xml');
	print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$GroupingId."pricingengine','pricingengine','".$GroupingId." Description','".$xmlcontent."');\n";
	close SQLOUT;
}

# process ore_types data
if (-e $xsdDir.'/ore_types.xsd' && -e $xsdDir.'/curveconfig.xsd') {
	open SQLOUT, ">Data/ore_types.sql";
	print SQLOUT "use ORE;\n\n";
	my $xmldata= XML::LibXML->load_xml(location => $xsdDir.'/ore_types.xsd', no_blanks => 1);
	print "processing ore_types.xsd\n";
	#<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	#	<xs:simpleType name="bool">
	#	...
	#	<xs:simpleType name="currencyCode">
	#	..
	my @firstlevel = $xmldata->firstChild->childNodes;
	foreach my $record (@firstlevel) {
		if (ref($record) eq "XML::LibXML::Element") {
			my $tableName = $record->getAttribute("name");
			#<xs:simpleType name="bool">
			#	<xs:restriction base="xs:string">
			#		<xs:enumeration value="Y"/>
			my @subrecordData = $record->firstChild->childNodes;
			foreach my $subrecord (@subrecordData) {
				print SQLOUT createInsert($subrecord, "Types", $tableName, 1) if $tableName =~ /AmortizationType|Bool|BusinessDayConvention|CapFloor|Calendar|CsaType|CurrencyCode|DateRule|DayCounter|EquityCurves|IndependentAmountType|IndexName|LegType|LongShort|OptionSettlement|OptionStyle|OptionType|OreTradeType|Parties|SecurityCurves|TradeActionOwner|TradeActionType/i;
			}
		}
	}

	my $xmldata= XML::LibXML->load_xml(location => $xsdDir.'/nettingsetdefinitions.xsd', no_blanks => 1);
	print "processing ore types in nettingsetdefinitions.xsd\n";
	#<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	#	<xs:simpleType name="csaType">
	#	...
	my @firstlevel = $xmldata->firstChild->childNodes;
	foreach my $record (@firstlevel) {
		if (ref($record) eq "XML::LibXML::Element" && $record->nodeName eq "xs:simpleType" && $record->getAttribute("name") ne "non-negative-decimal") {
			my $tableName = $record->getAttribute("name");
			# <xs:simpleType name="csaType">
			#   <xs:restriction base="xs:string">
			#     <xs:enumeration value="Bilateral"/>
			my @subrecordData = $record->firstChild->childNodes;
			foreach my $subrecord (@subrecordData) {
				print SQLOUT createInsert($subrecord, "Types", $tableName, 1);
			}
		}
	}
	
	my $xmldata= XML::LibXML->load_xml(location => $xsdDir.'/instruments.xsd', no_blanks => 1);
	print "processing ore types in instruments.xsd\n";
	my @firstlevel = $xmldata->firstChild->childNodes;
	foreach my $record (@firstlevel) {
		if (ref($record) eq "XML::LibXML::Element" && $record->nodeName eq "xs:simpleType") {
			my $tableName = $record->getAttribute("name");
			my @subrecordData = $record->firstChild->childNodes;
			foreach my $subrecord (@subrecordData) {
				print SQLOUT createInsert($subrecord, "Types", $tableName, 1);
			}
		}
	}
	
	close SQLOUT;
}

# process todaysmarket data
if (-e $configDir.'/todaysmarket.xml') {
	open SQLOUT, ">Data/configTabletodaysmarket.sql";
	print SQLOUT "use ORE;\n\n";
	print "processing todaysmarket.xml\n";
	my $xmlcontent = getXMLData($configDir.'/todaysmarket.xml');
	print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$GroupingId."todaysmarket','todaysmarket','".$GroupingId." Description','".$xmlcontent."');\n";
	close SQLOUT;
}

# process curveconfig data
if (-e $configDir.'/curveconfig.xml') {
	open SQLOUT, ">Data/configTablecurveconfig.sql";
	print SQLOUT "use ORE;\n\n";
	print "processing curveconfig.xml\n";
	my $xmlcontent = getXMLData($configDir.'/curveconfig.xml');
	print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$GroupingId."curveconfig','curveconfig','".$GroupingId." Description','".$xmlcontent."');\n";
	close SQLOUT;
}

###############################################################################################################################
# Now convert the analyses input folder
#
unlink "Data/configTableore.sql";
unlink "Data/netting.sql";
unlink "Data/configTablesimulation.sql";
unlink "Data/portfolio.sql";
unlink "Data/configTablesensitivity.sql";
unlink "Data/configTablestresstest.sql";
unlink "Data/ore_typesParties.sql";

# given analyses/portfolio data input Dir;
if ($inputDir) {
	# set all grouping IDs to the passed parameter, however GroupingIds (SimulationId,OreConfigId,NettingSetGrouping,SensitivityAnalysisId,StresstestGroupingId) could be individually changed here
	doInputXMLs ($inputDir,$GroupingId,$GroupingId,$GroupingId,$GroupingId,$GroupingId,"");
} else {
	# example inputs...
	for my $i (1 .. 32) {
		$GroupingId = "Example_$i";
		doInputXMLs("$oreRoot/Examples/Example_$i/Input","Example_$i","Example_$i","Example_$i","Example_$i","Example_$i",$i)
	}
}

open SQLOUT2, ">>Data/ore_typesParties.sql";
print SQLOUT2 "use ORE;\n\n";
for (keys %parties) {
	$parties{$_}->setNodeName("value");
	print SQLOUT2 createInsert($parties{$_}, "Types", "Parties");
}
close SQLOUT2;
	
# need these 2 global for counting in sub doTradeTypeData
my $LegDataId;
my $ScheduleId;

sub doInputXMLs {
	my ($xmlInputDir,$SimulationId,$OreConfigId,$NettingSetGrouping,$SensitivityAnalysisId,$StresstestGroupingId,$UniqueIdPrefix) = @_;
	print "_________________________\n entering $xmlInputDir\n";
	# process portfolio data
	if (-e $xmlInputDir.'/portfolio.xml') {
		open SQLOUT, ">>Data/portfolio.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 1 || !$UniqueIdPrefix);
		my $xmldata= XML::LibXML->load_xml(location => $xmlInputDir.'/portfolio.xml', no_blanks => 1);
		print "processing portfolio.xml\n";
		# first level: trades
		my @firstlevel = $xmldata->firstChild->childNodes;
		$LegDataId=($UniqueIdPrefix ? $UniqueIdPrefix*1000 : 0);
		$ScheduleId=($UniqueIdPrefix ? $UniqueIdPrefix*1000 : 0);
		my $TradeActionId=($UniqueIdPrefix ? $UniqueIdPrefix*1000 : 0);
		foreach my $record (@firstlevel) {
			if (ref($record) eq "XML::LibXML::Element") {
				my $TradeId = $record->getAttribute("id");
				my $TradeType = $record->findvalue("TradeType");
				$record->setAttribute("id", $UniqueIdPrefix.$TradeId);
				$record->setAttribute("EnvelopeCounterParty", $record->findvalue("Envelope/CounterParty"));

				# sidestep: store parties for reference type "TypesParties" from Counterparty entries.
				my @Partyrecord = $record->findnodes('Envelope/CounterParty');
				$parties{$Partyrecord[0]->textContent} = $Partyrecord[0]  if $Partyrecord[0];

				$record->setAttribute("EnvelopeNettingSetId", $UniqueIdPrefix.$record->findvalue("Envelope/NettingSetId")) if $record->findvalue("Envelope/NettingSetId");
				
				# AdditionalFields (only flat structure possible, fields need to be defined in table PortfolioTrades as AddFields<Name>)
				my @subrecords = $record->findnodes("Envelope/AdditionalFields/*");
				foreach my $subsubrecord (@subrecords) {
					$record->setAttribute("AddFields".$subsubrecord->nodeName, $subsubrecord->textContent);
				}
				print SQLOUT createInsert($record, "Portfolio", "Trades");

				# add Create initial TradeGrouping from given GroupingId ...
				my $GroupingIdEl = XML::LibXML::Element->new("TradeGroupingIds");
				$GroupingIdEl->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
				$GroupingIdEl->setAttribute("GroupingId", $GroupingId);
				print SQLOUT createInsert($GroupingIdEl, "Portfolio", "TradeGroupingIds");

				# Trade Actions
				my $subrecord = $record->findnodes("TradeActions")->[0];
				if ($subrecord && $subrecord->exists('*')) {
					my @subsubrecords = $subrecord->findnodes("TradeAction");
					foreach my $subsubrecord (@subsubrecords) {
						$subsubrecord->setAttribute("Id", $TradeActionId);
						$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
						print SQLOUT createInsert($subsubrecord, "Portfolio", "TradeActions");
						# Schedule for Trade Actions
						my $subsubsubrecord = ${$subsubrecord->findnodes("Schedule")}[0];
						if ($subsubsubrecord) {
							$subsubsubrecord->setAttribute("StartDate", $subsubsubrecord->findvalue("Rules/StartDate"));
							$subsubsubrecord->setAttribute("EndDate", $subsubsubrecord->findvalue("Rules/EndDate"));
							$subsubsubrecord->setAttribute("Tenor", $subsubsubrecord->findvalue("Rules/Tenor"));
							$subsubsubrecord->setAttribute("Calendar", $subsubsubrecord->findvalue("Rules/Calendar"));
							$subsubsubrecord->setAttribute("Convention", $subsubsubrecord->findvalue("Rules/Convention"));
							$subsubsubrecord->setAttribute("TermConvention", $subsubsubrecord->findvalue("Rules/TermConvention"));
							$subsubsubrecord->setAttribute("RuleName", $subsubsubrecord->findvalue("Rules/Rule"));
							$subsubsubrecord->setAttribute("EndOfMonth", $subsubsubrecord->findvalue("Rules/EndOfMonth"));
							$subsubsubrecord->setAttribute("FirstDate", $subsubsubrecord->findvalue("Rules/FirstDate"));
							$subsubsubrecord->setAttribute("LastDate", $subsubsubrecord->findvalue("Rules/LastDate"));
							$subsubsubrecord->setAttribute("TradeActionId", $TradeActionId);
							$subsubsubrecord->setAttribute("Id", $ScheduleId);
							print SQLOUT createInsert($subsubsubrecord, "Portfolio", "ScheduleDataRules",0,1);
							# Schedule Dates for Trade Actions
							my @subsubsubrecords = $subsubrecord->findnodes("Schedule/Dates/Date");
							foreach $subsubsubrecord (@subsubsubrecords) {
								$subsubsubrecord->setNodeName("ScheduleDate");
								$subsubsubrecord->setAttribute("TradeActionId", $TradeActionId);
								$subsubsubrecord->setAttribute("Id", $ScheduleId);
								print SQLOUT createInsert($subsubsubrecord, "Portfolio", "ScheduleDataDates",0,1);
							}
							$ScheduleId++;
						}
						$TradeActionId++;
					}
				}
				
				# abstracted TradeTypeData conversion to allow extraction of tradedata inside of tradedata.
				convertTradeTypeData($TradeType, $record, $UniqueIdPrefix, $TradeId);
				if ($TradeType eq "IndexCreditDefaultSwapOption") {
					# extraction of IndexCreditDefaultSwapData inside IndexCreditDefaultSwapOptionData
					$record = ${$record->findnodes($TradeType."Data")}[0];
					convertTradeTypeData("IndexCreditDefaultSwap", $record, $UniqueIdPrefix, $TradeId, "IndexCreditDefaultSwapOptionSwap");
				}
			}
		}
		close SQLOUT;
	}

	# process ORE.xml config
	if (-e $xmlInputDir.'/ore.xml') {
		open SQLOUT, ">>Data/configTableore.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 1 || !$UniqueIdPrefix);
		print "processing ore.xml\n";
		my $xmlcontent = getXMLData($xmlInputDir.'/ore.xml');
		print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$OreConfigId."orestart','orestart','".$OreConfigId." Description','".$xmlcontent."');\n";
		close SQLOUT;
	}

	# process nettingsetdefinitions data
	if (-e $xmlInputDir.'/netting.xml') {
		open SQLOUT, ">>Data/netting.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 1 || !$UniqueIdPrefix);
		my $xmldata= XML::LibXML->load_xml(location => $xmlInputDir.'/netting.xml', no_blanks => 1);
		print "processing netting.xml\n";
		my @firstlevel = $xmldata->firstChild->childNodes;
		foreach my $record (@firstlevel) {
			my $NsetID = $UniqueIdPrefix.$record->findvalue("NettingSetId");
			${$record->find('NettingSetId')}[0]->unbindNode();
			$record->setAttribute("NettingSetId", $NsetID);
			$record->setAttribute("GroupingId", $NettingSetGrouping);
			print SQLOUT createInsert($record, "Netting", "Set");

			# sidestep: store parties for reference type "TypesParties" from Counterparty entries.
			my @Partyrecord = $record->findnodes('Counterparty');
			$parties{$Partyrecord[0]->textContent} = $Partyrecord[0] if $Partyrecord[0];

			my @subrecordData = $record->findnodes('CSADetails');
			foreach my $subrecord (@subrecordData) {
				$subrecord->setAttribute("NettingSetId", $NsetID);
				$subrecord->setAttribute("IndependentAmountHeld", $subrecord->findvalue("IndependentAmount/IndependentAmountHeld"));
				$subrecord->setAttribute("IndependentAmountType", $subrecord->findvalue("IndependentAmount/IndependentAmountType"));
				$subrecord->setAttribute("CallFrequency", $subrecord->findvalue("MarginingFrequency/CallFrequency"));
				$subrecord->setAttribute("PostFrequency", $subrecord->findvalue("MarginingFrequency/PostFrequency"));
				print SQLOUT createInsert($subrecord, "Netting", "CSADetails");
				my @subsubrecordData = $subrecord->findnodes('EligibleCollaterals/Currencies');
				foreach my $subsubrecord (@subsubrecordData) {
					$subsubrecord->setAttribute("NettingSetId", $NsetID);
					print SQLOUT createInsert($subsubrecord, "Netting", "EligibleCollateralsCurrencies");
				}
			}
		}
		close SQLOUT;
		close SQLOUT2;
	}

	# process simulation config
	if (-e $xmlInputDir.'/simulation.xml') {
		open SQLOUT, ">>Data/configTablesimulation.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 1 || !$UniqueIdPrefix);
		print "processing simulation.xml\n";
		my $xmlcontent = getXMLData($xmlInputDir.'/simulation.xml');
		print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$OreConfigId."simulation','simulation','".$OreConfigId." Description','".$xmlcontent."');\n";
		close SQLOUT;
	}
	
	# process sensitivity config
	if (-e $xmlInputDir.'/sensitivity.xml') {
		open SQLOUT, ">>Data/configTablesensitivity.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 15 || !$UniqueIdPrefix); # example 15 has sensitivity.xml
		print "processing sensitivity.xml\n";
		my $xmlcontent = getXMLData($xmlInputDir.'/sensitivity.xml');
		print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$OreConfigId."sensitivity','sensitivity','".$OreConfigId." Description','".$xmlcontent."');\n";
		close SQLOUT;
	}
	
	# process stresstest config
	if (-e $xmlInputDir.'/stresstest.xml') {
		open SQLOUT, ">>Data/configTablestresstest.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 15 || !$UniqueIdPrefix); # example 15 has stresstest.xml
		print "processing stresstest.xml\n";
		my $xmlcontent = getXMLData($xmlInputDir.'/stresstest.xml');
		print SQLOUT "INSERT OreConfigurations (ConfigurationId,ConfigurationType,Description,ConfigurationData) VALUES ('".$OreConfigId."stresstest','stresstest','".$OreConfigId." Description','".$xmlcontent."');\n";
		close SQLOUT;
	}
}

sub getXMLData() {
	my ($xmlfilepath) = @_;
	my $wholeXMLFILE;
	open (XMLFILE, "<$xmlfilepath");
	{
		local $/=undef;
		$wholeXMLFILE = <XMLFILE>;
		close XMLFILE;
	}
	# get rid of CR LF and blanks between elements
	$wholeXMLFILE =~ s/>\s*?</></g;
	# last CRLF as well..
	$wholeXMLFILE =~ s/>\s+$/>/;
	# quote quotes in SQL ..
	$wholeXMLFILE =~ s/'/''/g;
	return $wholeXMLFILE;
}

sub convertTradeTypeData() {
	my ($TradeType, $record, $UniqueIdPrefix, $TradeId, $DBTradeType) = @_;
	print "TradeType: $TradeType\n";
	# $TradeType Data
	$TradeType =~ s/SyntheticCDO/CDO/;
	$TradeType =~ s/EquitySwap/Swap/;
	# Common Data (goes into main data table)
	my $subrecord = ${$record->findnodes($TradeType."Data")}[0];
	$subrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
	$subrecord->setAttribute("OptionDataLongShort", $subrecord->findvalue("OptionData/LongShort"));
	$subrecord->setAttribute("OptionDataOptionType", $subrecord->findvalue("OptionData/OptionType"));
	$subrecord->setAttribute("OptionDataStyle", $subrecord->findvalue("OptionData/Style"));
	$subrecord->setAttribute("OptionDataSettlement", $subrecord->findvalue("OptionData/Settlement"));
	$subrecord->setAttribute("OptionDataPayOffAtExpiry", $subrecord->findvalue("OptionData/PayOffAtExpiry"));
	$subrecord->setAttribute("OptionDataPremiumAmount", $subrecord->findvalue("OptionData/Premium/Amount"));
	$subrecord->setAttribute("OptionDataPremiumCurrency", $subrecord->findvalue("OptionData/Premium/Currency"));
	$subrecord->setAttribute("OptionDataPremiumPayDate", $subrecord->findvalue("OptionData/Premium/PayDate"));
	
	# sidestep: store parties for reference type "TypesParties" from IssuerId entries.
	my @Partyrecord = $record->findnodes('IssuerId');
	$parties{$Partyrecord[0]->textContent} = $Partyrecord[0] if $Partyrecord[0];

	# sidestep: store parties for reference type "TypesParties" from CreditCurveId entries.
	@Partyrecord = $record->findnodes('CreditCurveId');
	$parties{$Partyrecord[0]->textContent} = $Partyrecord[0] if $Partyrecord[0];

	# sidestep: store parties for reference type "TypesParties" from IssuerId entries.
	@Partyrecord = $subrecord->findnodes('IssuerId');
	$parties{$Partyrecord[0]->textContent} = $Partyrecord[0] if $Partyrecord[0];

	# sidestep: store parties for reference type "TypesParties" from CreditCurveId entries.
	@Partyrecord = $subrecord->findnodes('CreditCurveId');
	$parties{$Partyrecord[0]->textContent} = $Partyrecord[0] if $Partyrecord[0];
	
	print SQLOUT createInsert($subrecord, "Portfolio", ($DBTradeType ? $DBTradeType : $TradeType)."Data",0,1) if $TradeType ne "Swap";
	# Exercise Data (Dates as nodes, Fees and Prices optional but parallel!)
	my @subsubrecords = $subrecord->findnodes("OptionData/ExerciseDates/ExerciseDate");
	my $i = 1;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("ExerciseFee", $subrecord->findvalue("OptionData/ExerciseFees/ExerciseFee[".$i."]"));
		$subsubrecord->setAttribute("ExercisePrice", $subrecord->findvalue("OptionData/ExercisePrices/ExercisePrice[".$i."]"));
		print SQLOUT createInsert($subsubrecord, "Portfolio", "OptionExercises",0,1);
		$i++
	}
	# Cap Rates
	@subsubrecords = $subrecord->findnodes("CapRates/Rate");
	my $SeqId=0;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("SeqId", $SeqId);
		print SQLOUT createInsert($subsubrecord, "Portfolio", "CapRates",0,1);
		$SeqId++;
	}
	# Baskets
	@subsubrecords = $subrecord->findnodes("Basket/Name");
	my $SeqId=0;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("SeqId", $SeqId);
		# sidestep: store parties for reference type "TypesParties" from IssuerId entries.
		my @Partyrecord = $record->findnodes('IssuerId');
		$parties{$Partyrecord[0]->textContent} = $Partyrecord[0] if $Partyrecord[0]->textContent;
	
		print SQLOUT createInsert($subsubrecord, "Portfolio", "Baskets",0,1);
		$SeqId++;
	}
	# Floor Rates
	@subsubrecords = $subrecord->findnodes("FloorRates/Rate");
	$SeqId=0;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("SeqId", $SeqId);
		print SQLOUT createInsert($subsubrecord, "Portfolio", "FloorRates",0,1);
		$SeqId++;
	}
	# Leg Data
	my @subrecords = $record->findnodes($TradeType."Data/LegData");
	foreach my $subrecord (@subrecords) {
		$LegDataId++;
		$subrecord->setAttribute("Id", $LegDataId);
		$subrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subrecord->setAttribute("NotionalInitialExchange", $subrecord->findvalue("Notionals/Exchanges/NotionalInitialExchange"));
		$subrecord->setAttribute("NotionalFinalExchange", $subrecord->findvalue("Notionals/Exchanges/NotionalFinalExchange"));
		$subrecord->setAttribute("NotionalAmortizingExchange", $subrecord->findvalue("Notionals/Exchanges/NotionalAmortizingExchange"));
		$subrecord->setAttribute("FXResetForeignCurrency", $subrecord->findvalue("Notionals/FXReset/ForeignCurrency"));
		$subrecord->setAttribute("FXResetForeignAmount", $subrecord->findvalue("Notionals/FXReset/ForeignAmount"));
		$subrecord->setAttribute("FXResetFXIndex", $subrecord->findvalue("Notionals/FXReset/FXIndex"));
		$subrecord->setAttribute("FXResetFixingDays", $subrecord->findvalue("Notionals/FXReset/FixingDays"));
		$subrecord->setAttribute("FixedLegRate", $subrecord->findvalue("FixedLegData/Rate"));
		$subrecord->setAttribute("FloatingLegIndexName", $subrecord->findvalue("FloatingLegData/Index"));
		$subrecord->setAttribute("FloatingLegIsInArrears", $subrecord->findvalue("FloatingLegData/IsInArrears"));
		$subrecord->setAttribute("FloatingLegFixingDays", $subrecord->findvalue("FloatingLegData/FixingDays"));
		$subrecord->setAttribute("FloatingLegIsNotResettingXCCY", $subrecord->findvalue("FloatingLegData/IsNotResettingXCCY"));
		$subrecord->setAttribute("CPILegIndexName", $subrecord->findvalue("CPILegData/Index"));
		$subrecord->setAttribute("CPILegBaseCPI", $subrecord->findvalue("CPILegData/BaseCPI"));
		$subrecord->setAttribute("CPILegObservationLag", $subrecord->findvalue("CPILegData/ObservationLag"));
		$subrecord->setAttribute("CPILegInterpolated", $subrecord->findvalue("CPILegData/Interpolated"));
		$subrecord->setAttribute("YYLegIndexName", $subrecord->findvalue("YYLegData/Index"));
		$subrecord->setAttribute("YYLegFixingDays", $subrecord->findvalue("YYLegData/FixingDays"));
		$subrecord->setAttribute("YYLegObservationLag", $subrecord->findvalue("YYLegData/ObservationLag"));
		$subrecord->setAttribute("YYLegInterpolated", $subrecord->findvalue("YYLegData/Interpolated"));
		print SQLOUT createInsert($subrecord, "Portfolio", "LegData",0,1);
		# Amortizations
		my @subsubrecords = $subrecord->findnodes("Amortizations/AmortizationData");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "LegAmortizations",0,1);
			$SeqId++;
		}
		# Notionals
		my @subsubrecords = $subrecord->findnodes("Notionals/Notional");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "LegNotionals",0,1);
			$SeqId++;
		}
		# FloatingLeg Spreads
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Spreads/Spread");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "FloatingLegSpreads",0,1);
			$SeqId++;
		}
		# FloatingLeg Caps
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Caps/Cap");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "FloatingLegCaps",0,1);
			$SeqId++;
		}
		# FloatingLeg Floors
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Floors/Floor");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "FloatingLegFloors",0,1);
			$SeqId++;
		}
		# FloatingLeg Gearings
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Gearings/Gearing");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "FloatingLegGearings",0,1);
			$SeqId++;
		}
		# FixedLeg Rates
		@subsubrecords = $subrecord->findnodes("FixedLegData/Rates/Rate");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "FixedLegCPIRates",0,1);
			$SeqId++;
		}
		# CPILeg Rates
		@subsubrecords = $subrecord->findnodes("CPILegData/Rates/Rate");
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "FixedLegCPIRates",0,1);
			$SeqId++;
		}
		# Schedule Data
		my $subsubrecord = ${$subrecord->findnodes("ScheduleData")}[0];
		if ($subsubrecord) {
			$subsubrecord->setAttribute("StartDate", $subsubrecord->findvalue("Rules/StartDate"));
			$subsubrecord->setAttribute("EndDate", $subsubrecord->findvalue("Rules/EndDate"));
			$subsubrecord->setAttribute("Tenor", $subsubrecord->findvalue("Rules/Tenor"));
			$subsubrecord->setAttribute("Calendar", $subsubrecord->findvalue("Rules/Calendar"));
			$subsubrecord->setAttribute("Convention", $subsubrecord->findvalue("Rules/Convention"));
			$subsubrecord->setAttribute("TermConvention", $subsubrecord->findvalue("Rules/TermConvention"));
			$subsubrecord->setAttribute("RuleName", $subsubrecord->findvalue("Rules/Rule"));
			$subsubrecord->setAttribute("EndOfMonth", $subsubrecord->findvalue("Rules/EndOfMonth"));
			$subsubrecord->setAttribute("FirstDate", $subsubrecord->findvalue("Rules/FirstDate"));
			$subsubrecord->setAttribute("LastDate", $subsubrecord->findvalue("Rules/LastDate"));
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("Id", $ScheduleId);
			print SQLOUT createInsert($subsubrecord, "Portfolio", "ScheduleDataRules",0,1);
			# Schedule Dates
			my @subsubrecords = $subrecord->findnodes("ScheduleData/Dates/Date");
			foreach my $subsubrecord (@subsubrecords) {
				$subsubrecord->setNodeName("ScheduleDate");
				$subsubrecord->setAttribute("LegDataId", $LegDataId);
				$subsubrecord->setAttribute("Id", $ScheduleId);
				print SQLOUT createInsert($subsubrecord, "Portfolio", "ScheduleDataDates",0,1);
			}
			$ScheduleId++;
		}
	}
	print SQLOUT "\n";
}

###################################################################################################
# helper functions
# print the insert statement for a XML Record
sub createInsert() {
	my ($record, $prefix, $tableName, $numericAsChar, $numericAsDate) = @_;
	
	my ($colNames, $colValues);
	#first the element data
	foreach my $tableCol ($record->childNodes) {
		#print $tableCol->nodeName.":".ref($tableCol).",tcolexists:".$tableCol->exists('*').",textContent:".$tableCol->textContent."\n" if $prefix eq "Stresstest";;
		# real nodes/elements (no comments, etc.)    && no subnodes (exists(*)) && no empty nodes (/^\s*$/ is to prevent empty (only whitespace) multiline nodes)
		if (ref($tableCol) eq "XML::LibXML::Element" && !$tableCol->exists('*') && $tableCol->textContent ne '' && $tableCol->textContent !~ /^\s*$/) {
			$colNames.=($tableCol->nodeName =~ /^Rule$|^Index$/ ? $tableCol->nodeName."Name" : $tableCol->nodeName).",";
			$colValues.=formatSQL($tableCol->textContent, $numericAsChar,$numericAsDate).",";
		}
		# plain text nodes
		if (ref($tableCol) eq "XML::LibXML::Text" && $tableCol->textContent ne '' && $tableCol->textContent !~ /^\s*$/) {
			$colNames.=($tableCol->parentNode->nodeName =~ /^Rule$|^Index$/ ? $tableCol->parentNode->nodeName."Name" : $tableCol->parentNode->nodeName).",";
			$colValues.=formatSQL($tableCol->textContent, $numericAsChar,$numericAsDate).",";
		}
	}
	# then the attributes
	if ($record->hasAttributes) {
		foreach my $tableCol ($record->attributes) {
			#print Dumper($tableCol)."\n";
			# duplicate values in CaseInsenstive Database: true|false|Following|Preceding
			# && (($tableCol->value !~ /^true$|^false$/ && $tableName eq "bool") || ($tableCol->value !~ /^Following$|^Preceding$/ && $tableName eq "businessDayConvention"))
			if ($tableCol->value ne "") {
				$colNames.=($tableCol->nodeName =~ /^rule$|^index$/i ? $tableCol->nodeName."Name" : $tableCol->nodeName).",";
				$colValues.=formatSQL($tableCol->value, $numericAsChar,$numericAsDate).",";
			}
		}
	}
	return "INSERT $prefix$tableName (".substr($colNames,0,-1).") VALUES (".substr($colValues,0,-1).");\n" if $colValues ne "";
}

# format SQL according to type (number vs. string/dates)
sub formatSQL() {
	my ($var, $numericAsChar,$numericAsDate) = @_;
	return $var if looks_like_number($var) && !$numericAsChar && !($numericAsDate && $var =~ /^\d{8}$/);
	$var =~ s/^\n\s*//;
	$var =~ s/\n\s*$//;
	$var =~ s/'/''/;
	return "'".$var."'";
}