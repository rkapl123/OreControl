use strict;
use XML::LibXML; use Data::Dumper;
use Scalar::Util qw(looks_like_number);
my %data;

# set this to your ORE Root folder
my $oreRoot='../../Engine';
# set this to the folder where configuration files are located (named as the example configurations)
my $configDir = "$oreRoot/Examples/Input";
# set this to the xsd schema definitions (should be the ones from the ORE Engine)
my $xsdDir = "$oreRoot/xsd";
# set this to your analysis input folder (to translate portfolio, ore parameters, netting sets and simulation/stresstest/sensitivity parameters)
my $inputDir = "$oreRoot/Examples/Example_1/Input";
# leave empty to process standard examples
$inputDir = "";


###############################################################################################################################
# First convert common settings (conventions, curveconfig, pricingengine, ore types and todaysmarket)

# process conventions data
if (-e $configDir.'/conventions.xml') {
	print "processing conventions.xml\n";
	open SQLOUT, ">Data/conventions.sql";
	print SQLOUT "use ORE;\n\n";
	my $xmldata= XML::LibXML->load_xml(location => $configDir.'/conventions.xml', no_blanks => 1);
	my @firstlevel=$xmldata->firstChild->childNodes;
	foreach my $record (sort @firstlevel) {
		if (ref($record) eq "XML::LibXML::Element") {
			my $tableName = $record->nodeName;
			$record->setAttribute("GroupingId", 'ExampleInput');
			printInsert($record, "Conventions", $tableName);
		}
	}
	close SQLOUT;
}

# process pricingengine data
if (-e $configDir.'/pricingengine.xml') {
	open SQLOUT, ">Data/pricingengine.sql";
	print SQLOUT "use ORE;\n\n";
	my $xmldata= XML::LibXML->load_xml(location => $configDir.'/pricingengine.xml', no_blanks => 1);
	print "processing pricingengine.xml\n";
	my @firstlevel = $xmldata->firstChild->childNodes;
	foreach my $record (@firstlevel) {
		if (ref($record) eq "XML::LibXML::Element") {
			$record->setAttribute("GroupingId", 'ExampleInput');
			printInsert($record, "PricingEngine", "Products");
			my $typeAtt = $record->getAttribute("type");
			my @subrecordData = $record->findnodes('EngineParameters/Parameter');
			foreach my $subrecord (@subrecordData) {
				$subrecord->setAttribute("type", $typeAtt);
				printInsert($subrecord, "PricingEngine", "EngineParameters");
			}
			my @subrecordData = $record->findnodes('ModelParameters/Parameter');
			foreach my $subrecord (@subrecordData) {
				$subrecord->setAttribute("type", $typeAtt);
				printInsert($subrecord, "PricingEngine", "ModelParameters");
			}
		}
	}
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
				printInsert($subrecord, "Types", $tableName, 1);
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
				printInsert($subrecord, "Types", $tableName, 1);
			}
		}
	}
	
	my $xmldata= XML::LibXML->load_xml(location => $xsdDir.'/simulation.xsd', no_blanks => 1);
	print "processing ore types in simulation.xsd\n";
	#<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	#	<xs:simpleType name="csaType">
	#	...
	my @firstlevel = $xmldata->firstChild->childNodes;
	foreach my $record (@firstlevel) {
		if (ref($record) eq "XML::LibXML::Element" && $record->nodeName eq "xs:simpleType" && $record->getAttribute("name") ne "correlationValue" && $record->getAttribute("name") ne "default" && $record->getAttribute("name") ne "reversionTypeType") {
			my $tableName = $record->getAttribute("name");
			my @subrecordData = $record->firstChild->childNodes;
			foreach my $subrecord (@subrecordData) {
				printInsert($subrecord, "Types", $tableName, 1);
			}
		}
	}
	
	my $xmldata= XML::LibXML->load_xml(location => $xsdDir.'/curveconfig.xsd', no_blanks => 1);
	print "processing ore types in curveconfigtypes.xsd\n";
	#<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	  # <xs:complexType name="segmentsType">
		# <xs:choice minOccurs="1" maxOccurs="unbounded">
		  # <xs:element type="directSegmentType" name="Direct"/>
		  # <xs:element type="simpleSegmentType" name="Simple"/>
		  # <xs:element type="aoisSegmentType" name="AverageOIS"/>
		  # <xs:element type="tenorBasisSegmentType" name="TenorBasis"/>
		  # <xs:element type="crossCurrencySegmentType" name="CrossCurrency"/>
		  # <xs:element type="zeroSpreadType" name="ZeroSpread"/>
		# </xs:choice>
	  # </xs:complexType>
	my @firstlevel = $xmldata->firstChild->findnodes('xs:complexType/xs:choice/xs:element');
	foreach my $record (@firstlevel) {
		if (ref($record) eq "XML::LibXML::Element") {
			$record->removeAttribute("type");
			$record->setAttribute("value",$record->getAttribute("name"));
			$record->removeAttribute("name");
			printInsert($record, "Types", "SegmentType", 1);
		}
	}
	# <xs:simpleType name="simpleSegmentTypeType">
		# <xs:restriction base="xs:string">
		  # <xs:enumeration value="Deposit"/>
		  # <xs:enumeration value="FRA"/>
		  # <xs:enumeration value="Future"/>
		  # <xs:enumeration value="OIS"/>
		  # <xs:enumeration value="Swap"/>
		# </xs:restriction>
	  # </xs:simpleType>
	my @firstlevel = $xmldata->firstChild->findnodes('xs:simpleType');
	foreach my $record (@firstlevel) {
		if ($record->getAttribute("name") =~ /TypeType$/ || $record->getAttribute("name") =~ /CurveType$/) {
			# <xs:simpleType name="simpleSegmentTypeType">
			#   <xs:restriction base="xs:string">
			#     <xs:enumeration value="Deposit"/>
			# .........
			my @subrecordData = $record->firstChild->childNodes;
			foreach my $subrecord (@subrecordData) {
				printInsert($subrecord, "Types", "SegmentTypeType", 1);
			}
		}
	}
	foreach my $record (@firstlevel) {
		my $tableName = $record->getAttribute("name");
		if ($tableName =~ /defaultCurveType$/) {
			# <xs:simpleType name="defaultCurveType">
			#   <xs:restriction base="xs:string">
			#     <xs:enumeration value="SpreadCDS"/>
			# .........
			my @subrecordData = $record->firstChild->childNodes;
			foreach my $subrecord (@subrecordData) {
				printInsert($subrecord, "Types", $tableName, 1);
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
				printInsert($subrecord, "Types", $tableName, 1);
			}
		}
	}
	
	close SQLOUT;
}

# process todaysmarket data
if (-e $configDir.'/todaysmarket.xml') {
	open SQLOUT, ">Data/todaysmarket.sql";
	print SQLOUT "use ORE;\n\n";
	my $xmldata= XML::LibXML->load_xml(location => $configDir.'/todaysmarket.xml', no_blanks => 1);
	print "processing todaysmarket.xml\n";
	my @firstlevel = $xmldata->firstChild->childNodes;
	foreach my $record (@firstlevel) {
		if (ref($record) eq "XML::LibXML::Element") {
			my $tableId = $record->getAttribute("id");
			my $tableName = $record->nodeName;
			if ($tableName eq "Configuration") {
				my $ConfigurationTypeRecord = XML::LibXML::Element->new("ConfigurationTypes");
				$ConfigurationTypeRecord->setAttribute("id",$tableId);
				printInsert($ConfigurationTypeRecord, "TodaysMarket", "ConfigurationTypes", 1);
				$record->setAttribute("GroupingId",'ExampleInput');
#				DONT DO THIS, as it causes problems with XML generation: 
# 				# enter the configuration id for a block in case there is none set explicitly
#				foreach my $block ("DiscountingCurvesId","YieldCurvesId","IndexForwardingCurvesId","SwapIndexCurvesId","ZeroInflationIndexCurvesId","YYInflationIndexCurvesId","FxSpotsId","FxVolatilitiesId","SwaptionVolatilitiesId","CapFloorVolatilitiesId","CDSVolatilitiesId","DefaultCurvesId","InflationCapFloorPriceSurfacesId","EquityCurvesId","EquityVolatilitiesId","SecuritiesId","BaseCorrelationsId") {
#					$record->setAttribute($block,$tableId) if !$record->findnodes($block);
#				}
				printInsert($record, "TodaysMarket", $tableName, 1);
			} elsif ($tableName eq "SwapIndexCurves") {
				my @subrecordData = $record->childNodes;
				foreach my $subrecord (@subrecordData) {
					if (ref($subrecord) eq "XML::LibXML::Element") {
						$subrecord->setAttribute("id", $tableId);
						printInsert($subrecord, "TodaysMarket", $tableName, 1);
					}
				}
			} else {
				my @subrecordData = $record->childNodes;
				foreach my $subrecord (@subrecordData) {
					if (ref($subrecord) eq "XML::LibXML::Element") {
						$subrecord->setAttribute("id", $tableId);
						printInsert($subrecord, "TodaysMarket", $tableName, 1);
					}
				}
			}
		}
	}
	close SQLOUT;
}

# process curveconfig data
if (-e $configDir.'/curveconfig.xml') {
	open SQLOUT, ">Data/curveconfig.sql";
	print SQLOUT "use ORE;\n\n";
	my $xmldata= XML::LibXML->load_xml(location => $configDir.'/curveconfig.xml', no_blanks => 1);
	print "processing curveconfig.xml\n";
	my @firstlevel = $xmldata->firstChild->childNodes;
	foreach my $record (@firstlevel) {
		my $tableName = $record->nodeName;
		my @subelemData = $record->childNodes;
		foreach my $tblrecord (@subelemData) {
			# subtables of record
			if ($tblrecord->nodeName !~ /^InflationCurve$/ && ref($tblrecord) eq "XML::LibXML::Element") {
				# first the configuration curve to let childs relate
				$tblrecord->setAttribute("GroupingId",'ExampleInput');
				printInsert($tblrecord, "CurveConfiguration", $tableName);
				my $curveid = $tblrecord->findvalue('CurveId');
				my @subrecordData = $tblrecord->findnodes('Segments/*');
				my $SegmentSequenceNo = 0;
				foreach my $subrecord (@subrecordData) {
					$subrecord->setAttribute("SegmentsType",$subrecord->nodeName);
					$subrecord->setAttribute("CurveId", $curveid);
					$subrecord->setAttribute("Seq",$SegmentSequenceNo);
					printInsert($subrecord, "CurveConfiguration", "YieldCurveSegments");
					my $segtype = $subrecord->findvalue("Type");
					my @subsubrecordData = $subrecord->findnodes('Quotes/Quote');
					my $SequenceNo = 0;
					foreach my $subsubrecord (@subsubrecordData) {
						$subsubrecord->setAttribute("Seq",$SequenceNo);
						$subsubrecord->setAttribute("Type",$segtype);
						$subsubrecord->setAttribute("CurveId", $curveid);
						printInsert($subsubrecord, "CurveConfiguration", "Quotes");
						$SequenceNo++;
					}
					my @subsubrecordData = $subrecord->findnodes('Quotes/CompositeQuote');
					foreach my $subsubrecord (@subsubrecordData) {
						$subsubrecord->setAttribute("Type",$segtype);
						$subsubrecord->setAttribute("CurveId", $curveid);
						printInsert($subsubrecord, "CurveConfiguration", "CompositeQuotes");
					}
					$SegmentSequenceNo++;
				}
				my @subrecordData = $tblrecord->findnodes('Quotes/Quote');
				my $SequenceNo = 0;
				foreach my $subrecord (@subrecordData) {
					$subrecord->setAttribute("Seq",$SequenceNo);
					$subrecord->setAttribute("CurveId", $curveid);
					printInsert($subrecord, "CurveConfiguration", "Quotes");
					$SequenceNo++;
				}
			}
			if ($tblrecord->nodeName =~ /^InflationCurve$/ && ref($tblrecord) eq "XML::LibXML::Element") {
				# first the configuration curve to let childs relate
				$tblrecord->setAttribute("SeasonalityBaseDate", $tblrecord->findvalue('Seasonality/BaseDate'));
				$tblrecord->setAttribute("SeasonalityFrequency", $tblrecord->findvalue('Seasonality/Frequency'));
				$tblrecord->setAttribute("GroupingId",'ExampleInput');
				# numeric as char -> false, numeric as date (8 digit numbers) ->true)
				printInsert($tblrecord, "CurveConfiguration", $tableName,0,1);
				my $curveid = $tblrecord->findvalue('CurveId');
				my @subrecordData = $tblrecord->findnodes('Quotes/Quote');
				my $SequenceNo = 0;
				foreach my $subrecord (@subrecordData) {
					$subrecord->setAttribute("Seq",$SequenceNo);
					$subrecord->setAttribute("CurveId", $curveid);
					printInsert($subrecord, "CurveConfiguration", "Quotes");
					$SequenceNo++;
				}
				my @subrecordData = $tblrecord->findnodes('Seasonality/Factors/Factor');
				foreach my $subrecord (@subrecordData) {
					$subrecord->setAttribute("CurveId", $curveid);
					printInsert($subrecord, "CurveConfiguration", "SeasonalityFactors");
				}
			}
		}
	}
	close SQLOUT;
}

###############################################################################################################################
# Now convert the analyses input folder
#
unlink "Data/ore.sql";
unlink "Data/netting.sql";
unlink "Data/simulation.sql";
unlink "Data/portfolio.sql";
unlink "Data/sensitivity.sql";
unlink "Data/stresstest.sql";

# given analyses/portfolio data input Dir;
if ($inputDir) {
	doInputXMLs ($inputDir,"SimulationId","OreConfigId","NettingSetGroupingId","SensitivityAnalysisId","StresstestGroupingId","");
} else {
	# example inputs...
	for my $i (1 .. 30) {
		if ($i == 1) {
			unlink "Data/ore.sql";
			unlink "Data/netting.sql";
			unlink "Data/simulation.sql";
			unlink "Data/portfolio.sql";
			unlink "Data/sensitivity.sql";
			unlink "Data/stresstest.sql";
		}
		doInputXMLs("$oreRoot/Examples/Example_$i/Input","Example_$i","Example_$i","Example_$i","Example_$i","Example_$i",$i)
	}
}

# need these 2 global for counting in sub doTradeTypeData
my $LegDataId;
my $ScheduleId;
sub doInputXMLs {
	my ($xmlInputDir,$SimulationId,$OreConfigId,$NettingSetGrouping,$SensitivityAnalysisId,$StresstestGroupingId,$UniqueIdPrefix) = @_;
	
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
				$record->setAttribute("EnvelopeNettingSetId", $UniqueIdPrefix.$record->findvalue("Envelope/NettingSetId")) if $record->findvalue("Envelope/NettingSetId");
				printInsert($record, "Portfolio", "Trades");
				if ($UniqueIdPrefix) {
					my $node = XML::LibXML::Element->new("AdditionalFields");
					my $subnode = XML::LibXML::Element->new("AdditionalId");
					my $subnodevalue = XML::LibXML::Text->new("Example_".$UniqueIdPrefix);
					$subnode->addChild($subnodevalue);
					$node->addChild($subnode);
					if ($record->findnodes("Envelope/AdditionalFields")) {
						$record->findnodes("Envelope/AdditionalFields")->[0]->addChild($subnode);
					} else {
						$record->findnodes("Envelope")->[0]->addChild($node);
					}
				}
				# AdditionalFields (only flat structure currently supported, fields need to be defined in PortfolioAdditionalFields)
				my $subrecord = ${$record->findnodes("Envelope/AdditionalFields")}[0];
				if ($subrecord && $subrecord->exists('*')) {
					$subrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
					printInsert($subrecord, "Portfolio", "AdditionalFields");
				}
				# Trade Actions
				my $subrecord = ${$record->findnodes("TradeActions")}[0];
				if ($subrecord && $subrecord->exists('*')) {
					my @subsubrecords = $subrecord->findnodes("TradeAction");
					foreach my $subsubrecord (@subsubrecords) {
						$subsubrecord->setAttribute("Id", $TradeActionId);
						$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
						printInsert($subsubrecord, "Portfolio", "TradeActions");
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
							printInsert($subsubsubrecord, "Portfolio", "ScheduleDataRules",0,1);
							# Schedule Dates for Trade Actions
							my @subsubsubrecords = $subsubrecord->findnodes("Schedule/Dates/Date");
							foreach $subsubsubrecord (@subsubsubrecords) {
								$subsubsubrecord->setNodeName("ScheduleDate");
								$subsubsubrecord->setAttribute("TradeActionId", $TradeActionId);
								$subsubsubrecord->setAttribute("Id", $ScheduleId);
								printInsert($subsubsubrecord, "Portfolio", "ScheduleDataDates",0,1);
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

	# process ORE.xml data
	if (-e $xmlInputDir.'/ore.xml') {
		open SQLOUT, ">>Data/ore.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 1 || !$UniqueIdPrefix);
		my $xmldata= XML::LibXML->load_xml(location => $xmlInputDir.'/ore.xml', no_blanks => 1);
		print "processing ore.xml\n";
		print SQLOUT "INSERT OreParametersConfigs (id,Description) VALUES ('".$OreConfigId."','".$OreConfigId." Description');\n";
		my @firstlevel = $xmldata->firstChild->childNodes;
		foreach my $record (@firstlevel) {
			if (ref($record) eq "XML::LibXML::Element") {
				my $tableName = $record->nodeName;
				my @subrecordData = $record->childNodes;
				foreach my $subrecord (@subrecordData) {
					if ($tableName ne 'Analytics') {
						$subrecord->setAttribute("OreConfigId", $OreConfigId);
						printInsert($subrecord, "OreParameters", $tableName, 1);
					} else {
						if (ref($subrecord) eq "XML::LibXML::Element") {
							my $type = $subrecord->getAttribute("type");
							my @subsubrecordData = $subrecord->childNodes;
							foreach my $subsubrecord (@subsubrecordData) {
								if (ref($subsubrecord) eq "XML::LibXML::Element") {
									$subsubrecord->setAttribute("type", $type);
									$subsubrecord->setAttribute("OreConfigId", $OreConfigId);
									printInsert($subsubrecord, "OreParameters", $tableName, 1);
								}
							}
						}
					}
				}
			}
		}
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
			printInsert($record, "Netting", "Set");
			my @subrecordData = $record->findnodes('CSADetails');
			foreach my $subrecord (@subrecordData) {
				$subrecord->setAttribute("NettingSetId", $NsetID);
				$subrecord->setAttribute("IndependentAmountHeld", $subrecord->findvalue("IndependentAmount/IndependentAmountHeld"));
				$subrecord->setAttribute("IndependentAmountType", $subrecord->findvalue("IndependentAmount/IndependentAmountType"));
				$subrecord->setAttribute("CallFrequency", $subrecord->findvalue("MarginingFrequency/CallFrequency"));
				$subrecord->setAttribute("PostFrequency", $subrecord->findvalue("MarginingFrequency/PostFrequency"));
				printInsert($subrecord, "Netting", "CSADetails");
				my @subsubrecordData = $subrecord->findnodes('EligibleCollaterals/Currencies');
				foreach my $subsubrecord (@subsubrecordData) {
					$subsubrecord->setAttribute("NettingSetId", $NsetID);
					printInsert($subsubrecord, "Netting", "EligibleCollateralsCurrencies");
				}
			}
		}
		close SQLOUT;
	}

	# process simulation data
	if (-e $xmlInputDir.'/simulation.xml') {
		open SQLOUT, ">>Data/simulation.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 1 || !$UniqueIdPrefix);
		my $xmldata= XML::LibXML->load_xml(location => $xmlInputDir.'/simulation.xml', no_blanks => 1);
		print "processing simulation.xml\n";
		# first market (primary element)
		my $record = ${$xmldata->firstChild->find('Market')}[0];
		$record->setAttribute("Id", $SimulationId);
		$record->setAttribute("SimulationDescription", $SimulationId." Description");
		$record->setAttribute("YieldCurvesConfigurationTenors", $record->findvalue("YieldCurves/Configuration/Tenors"));
		$record->setAttribute("YieldCurvesConfigurationInterpolation", $record->findvalue("YieldCurves/Configuration/Interpolation"));
		$record->setAttribute("YieldCurvesConfigurationExtrapolation", $record->findvalue("YieldCurves/Configuration/Extrapolation"));
		$record->setAttribute("DefaultCurvesTenors", $record->findvalue("DefaultCurves/Tenors"));
		$record->setAttribute("EquitiesTenors", $record->findvalue("Equities/Tenors"));
		$record->setAttribute("SwaptionVolatilitiesSimulate", $record->findvalue("SwaptionVolatilities/Simulate"));
		$record->setAttribute("SwaptionVolatilitiesReactionToTimeDecay", $record->findvalue("SwaptionVolatilities/ReactionToTimeDecay"));
		$record->setAttribute("SwaptionVolatilitiesExpiries", $record->findvalue("SwaptionVolatilities/Expiries"));
		$record->setAttribute("SwaptionVolatilitiesTerms", $record->findvalue("SwaptionVolatilities/Terms"));
		$record->setAttribute("SwaptionVolatilitiesStrikes", $record->findvalue("SwaptionVolatilities/Strikes"));
		$record->setAttribute("SwaptionVolatilitiesSimulate", $record->findvalue("SwaptionVolatilities/Simulate"));
		$record->setAttribute("SwaptionVolatilitiesReactionToTimeDecay", $record->findvalue("SwaptionVolatilities/ReactionToTimeDecay"));
		$record->setAttribute("SwaptionVolatilitiesExpiries", $record->findvalue("SwaptionVolatilities/Expiries"));
		$record->setAttribute("SwaptionVolatilitiesStrikes", $record->findvalue("SwaptionVolatilities/Strikes"));
		$record->setAttribute("FxVolatilitiesSimulate", $record->findvalue("FxVolatilities/Simulate"));
		$record->setAttribute("FxVolatilitiesReactionToTimeDecay", $record->findvalue("FxVolatilities/ReactionToTimeDecay"));
		$record->setAttribute("FxVolatilitiesExpiries", $record->findvalue("FxVolatilities/Expiries"));
		$record->setAttribute("FxVolatilitiesStrikes", $record->findvalue("FxVolatilities/Strikes"));
		$record->setAttribute("EquityVolatilitiesSimulate", $record->findvalue("EquityVolatilities/Simulate"));
		$record->setAttribute("EquityVolatilitiesReactionToTimeDecay", $record->findvalue("EquityVolatilities/ReactionToTimeDecay"));
		$record->setAttribute("EquityVolatilitiesExpiries", $record->findvalue("EquityVolatilities/Expiries"));
		$record->setAttribute("EquityVolatilitiesStrikes", $record->findvalue("EquityVolatilities/Strikes"));
		printInsert($record, "Simulation", "Market");
		my @subrecord = $record->findnodes('FxRates/CurrencyPairs/CurrencyPair');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", "FxRatesCurrencyPairs");
		}
		@subrecord = $record->findnodes('Indices/Index');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", "Indices");
		}
		@subrecord = $record->findnodes('SwapIndices/SwapIndex');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'SwapIndices');
		}
		@subrecord = $record->findnodes('DefaultCurves/Names/Name');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'DefaultCurvesNames');
		}
		@subrecord = $record->findnodes('Equities/Names/Name');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'EquitiesNames');
		}
		@subrecord = $record->findnodes('SwaptionVolatilities/Currencies/Currency');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'SwaptionVolatilitiesCurrencies');
		}
		@subrecord = $record->findnodes('CapFloorVolatilities/Currencies/Currency');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'CapFloorVolatilitiesCurrencies');
		}
		@subrecord = $record->findnodes('FxVolatilities/CurrencyPairs/CurrencyPair');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'FxVolatilitiesCurrencyPairs');
		}
		@subrecord = $record->findnodes('EquityVolatilities/Names/Name');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'EquityVolatilitiesEquityNames');
		}
		@subrecord = $record->findnodes('BenchmarkCurves/BenchmarkCurve');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'BenchmarkCurves');
		}
		@subrecord = $record->findnodes('Securities/Security');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'Securities');
		}
		@subrecord = $record->findnodes('AggregationScenarioDataCurrencies/Currency');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'AggregationScenarioDataCurrencies');
		}
		@subrecord = $record->findnodes('Currencies/Currency');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'Currencies');
		}
		@subrecord = $record->findnodes('AggregationScenarioDataIndices/Index');
		foreach my $subrecord (@subrecord) {
			$subrecord->setAttribute("SimulationId", $SimulationId);
			printInsert($subrecord, "SimulationMarket", 'AggregationScenarioDataIndices');
		}

		# rest of simulation
		my @firstlevel = $xmldata->firstChild->childNodes;
		foreach my $record (@firstlevel) {
			if (ref($record) eq "XML::LibXML::Element" && $record->nodeName ne 'Market') {
				my $table = $record->nodeName;
				$record->setAttribute("SimulationId", $SimulationId);
				# get rid of that node
				${$record->find('Scenario')}[0]->unbindNode() if ($table eq 'Parameters');
				printInsert($record, "Simulation", $table);
				if ($table eq "CrossAssetModel") {
					@subrecord = $record->findnodes('Currencies/Currency');
					foreach my $subrecord (@subrecord) {
						$subrecord->setAttribute("SimulationId", $SimulationId);
						printInsert($subrecord, "Simulation$table", 'Currencies');
					}
					@subrecord = $record->findnodes('Equities/Equity');
					foreach my $subrecord (@subrecord) {
						$subrecord->setAttribute("SimulationId", $SimulationId);
						printInsert($subrecord, "Simulation$table", 'Equities');
					}
					@subrecord = $record->findnodes('InstantaneousCorrelations/Correlation');
					foreach my $subrecord (@subrecord) {
						$subrecord->setAttribute("SimulationId", $SimulationId);
						printInsert($subrecord, "Simulation$table", 'InstantaneousCorrelations');
					}
					@subrecord = $record->findnodes('InterestRateModels/LGM');
					foreach my $subrecord (@subrecord) {
						$subrecord->setAttribute("VolatilityCalibrate", $subrecord->findvalue("Volatility/Calibrate"));
						$subrecord->setAttribute("VolatilityVolatilityType", $subrecord->findvalue("Volatility/VolatilityType"));
						$subrecord->setAttribute("VolatilityParamType", $subrecord->findvalue("Volatility/ParamType"));
						$subrecord->setAttribute("VolatilityTimeGrid", $subrecord->findvalue("Volatility/TimeGrid"));
						$subrecord->setAttribute("VolatilityInitialValue", $subrecord->findvalue("Volatility/InitialValue"));
						$subrecord->setAttribute("ReversionCalibrate", $subrecord->findvalue("Reversion/Calibrate"));
						$subrecord->setAttribute("ReversionReversionType", $subrecord->findvalue("Reversion/ReversionType"));
						$subrecord->setAttribute("ReversionParamType", $subrecord->findvalue("Reversion/ParamType"));
						$subrecord->setAttribute("ReversionTimeGrid", $subrecord->findvalue("Reversion/TimeGrid"));
						$subrecord->setAttribute("ReversionInitialValue", $subrecord->findvalue("Reversion/InitialValue"));
						$subrecord->setAttribute("CalibrationSwaptionsExpiries", $subrecord->findvalue("CalibrationSwaptions/Expiries"));
						$subrecord->setAttribute("CalibrationSwaptionsTerms", $subrecord->findvalue("CalibrationSwaptions/Terms"));
						$subrecord->setAttribute("CalibrationSwaptionsStrikes", $subrecord->findvalue("CalibrationSwaptions/Strikes"));
						$subrecord->setAttribute("ParameterTransformationShiftHorizon", $subrecord->findvalue("ParameterTransformation/ShiftHorizon"));
						$subrecord->setAttribute("ParameterTransformationScaling", $subrecord->findvalue("ParameterTransformation/Scaling"));
						$subrecord->setAttribute("SimulationId", $SimulationId);
						printInsert($subrecord, "Simulation$table", 'InterestRateModels');
					}
					@subrecord = $record->findnodes('ForeignExchangeModels/CrossCcyLGM');
					foreach my $subrecord (@subrecord) {
						$subrecord->setAttribute("SigmaCalibrate", $subrecord->findvalue("Sigma/Calibrate"));
						$subrecord->setAttribute("SigmaParamType", $subrecord->findvalue("Sigma/ParamType"));
						$subrecord->setAttribute("SigmaTimeGrid", $subrecord->findvalue("Sigma/TimeGrid"));
						$subrecord->setAttribute("SigmaInitialValue", $subrecord->findvalue("Sigma/InitialValue"));
						$subrecord->setAttribute("CalibrationOptionsExpiries", $subrecord->findvalue("CalibrationOptions/Expiries"));
						$subrecord->setAttribute("CalibrationOptionsStrikes", $subrecord->findvalue("CalibrationOptions/Strikes"));
						$subrecord->setAttribute("SimulationId", $SimulationId);
						printInsert($subrecord, "Simulation$table", 'ForeignExchangeModels');
					}
					@subrecord = $record->findnodes('EquityModels/CrossAssetLGM');
					foreach my $subrecord (@subrecord) {
						$subrecord->setAttribute("SigmaCalibrate", $subrecord->findvalue("Sigma/Calibrate"));
						$subrecord->setAttribute("SigmaParamType", $subrecord->findvalue("Sigma/ParamType"));
						$subrecord->setAttribute("SigmaTimeGrid", $subrecord->findvalue("Sigma/TimeGrid"));
						$subrecord->setAttribute("SigmaInitialValue", $subrecord->findvalue("Sigma/InitialValue"));
						$subrecord->setAttribute("CalibrationOptionsExpiries", $subrecord->findvalue("CalibrationOptions/Expiries"));
						$subrecord->setAttribute("CalibrationOptionsStrikes", $subrecord->findvalue("CalibrationOptions/Strikes"));
						$subrecord->setAttribute("SimulationId", $SimulationId);
						printInsert($subrecord, "Simulation$table", 'EquityModels');
					}
				}
			}
		}
		close SQLOUT;
	}
	
	# process sensitivity data
	if (-e $xmlInputDir.'/sensitivity.xml') {
		open SQLOUT, ">>Data/sensitivity.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 15 || !$UniqueIdPrefix); # example 15 has sensitivity.xml
		my $xmldata= XML::LibXML->load_xml(location => $xmlInputDir.'/sensitivity.xml', no_blanks => 1);
		print "processing sensitivity.xml\n";
		my $record = $xmldata->firstChild;
		$record->setAttribute("Id", $SensitivityAnalysisId);
		printInsert($record, "Sensitivityanalysis", "");
		my @firstlevel = $xmldata->firstChild->childNodes;
		foreach $record (@firstlevel) {
			my @subelemData = $record->childNodes;
			foreach my $subrecord (@subelemData) {
				if (ref($subrecord) eq "XML::LibXML::Element") {
					my $tableName = $subrecord->nodeName;
					$tableName = "CrossGammaFilter" if $record->nodeName eq "CrossGammaFilter";
					$subrecord->setAttribute("AnalysisId", $SensitivityAnalysisId);
					printInsert($subrecord, "Sensitivityanalysis", $tableName);
				}
			}
		}
		close SQLOUT;
	}
	
	# process stresstest data
	if (-e $xmlInputDir.'/stresstest.xml') {
		open SQLOUT, ">>Data/stresstest.sql";
		print SQLOUT "use ORE;\n\n" if ($UniqueIdPrefix == 15 || !$UniqueIdPrefix); # example 15 has stresstest.xml
		my $xmldata= XML::LibXML->load_xml(location => $xmlInputDir.'/stresstest.xml', no_blanks => 1);
		print "processing stresstest.xml\n";
		my @firstlevel = $xmldata->firstChild->childNodes;
		foreach my $record (@firstlevel) {
			if (ref($record) eq "XML::LibXML::Element") {
				my $StresstestId = $UniqueIdPrefix.$record->getAttribute("id");
				# leave attribute lowercase, otherwise we'd have two ids (Id and id)
				$record->setAttribute("id", $StresstestId);
				$record->setAttribute("GroupingId", $StresstestGroupingId);
				printInsert($record, "Stresstest", "");
				my @subelemData = $record->childNodes;
				foreach my $subrecord (@subelemData) {
					if (ref($subrecord) eq "XML::LibXML::Element") {
						my @subsubelemData = $subrecord->childNodes;
						foreach my $subsubrecord (@subsubelemData) {
							if (ref($subsubrecord) eq "XML::LibXML::Element") {
								my $tableName = $subsubrecord->nodeName;
								$subsubrecord->setAttribute("StresstestId", $StresstestId);
								my $ccy = $subsubrecord->getAttribute("ccy");
								printInsert($subsubrecord, "Stresstest", $tableName);
								my @subsubsubelemData = $subsubrecord->findnodes("Shifts/Shift");
								foreach my $subsubsubrecord (@subsubsubelemData) {
									$subsubsubrecord->setAttribute("StresstestId", $StresstestId);
									$subsubsubrecord->setAttribute("ccy", $ccy);
									$subsubsubrecord->setAttribute("term", "default") if !$subsubsubrecord->getAttribute("term");
									$subsubsubrecord->setAttribute("expiry", "default") if !$subsubsubrecord->getAttribute("expiry");
									printInsert($subsubsubrecord, "Stresstest", "SwaptionShift");
								}
							}
						}
					}
				}
			}
		}
		close SQLOUT;
	}
}

sub convertTradeTypeData() {
	my ($TradeType, $record, $UniqueIdPrefix, $TradeId, $DBTradeType) = @_;
	
	# $TradeType Data
	$TradeType =~ s/SyntheticCDO/CDO/;
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
	printInsert($subrecord, "Portfolio", ($DBTradeType ? $DBTradeType : $TradeType)."Data",0,1);
	# Exercise Data (Dates as nodes, Fees and Prices optional but parallel!)
	my @subsubrecords = $subrecord->findnodes("OptionData/ExerciseDates/ExerciseDate");
	my $i = 1;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("ExerciseFee", $subrecord->findvalue("OptionData/ExerciseFees/ExerciseFee[".$i."]"));
		$subsubrecord->setAttribute("ExercisePrice", $subrecord->findvalue("OptionData/ExercisePrices/ExercisePrice[".$i."]"));
		printInsert($subsubrecord, "Portfolio", "OptionExercises",0,1);
		$i++
	}
	# Cap Rates
	@subsubrecords = $subrecord->findnodes("CapRates/Rate");
	my $SeqId=0;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("SeqId", $SeqId);
		printInsert($subsubrecord, "Portfolio", "CapRates",0,1);
		$SeqId++;
	}
	# Baskets
	@subsubrecords = $subrecord->findnodes("Basket/Name");
	my $SeqId=0;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("SeqId", $SeqId);
		printInsert($subsubrecord, "Portfolio", "Baskets",0,1);
		$SeqId++;
	}
	# Floor Rates
	@subsubrecords = $subrecord->findnodes("FloorRates/Rate");
	$SeqId=0;
	foreach my $subsubrecord (@subsubrecords) {
		$subsubrecord->setAttribute("TradeId", $UniqueIdPrefix.$TradeId);
		$subsubrecord->setAttribute("SeqId", $SeqId);
		printInsert($subsubrecord, "Portfolio", "FloorRates",0,1);
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
		printInsert($subrecord, "Portfolio", "LegData",0,1);
		# Amortizations
		my @subsubrecords = $subrecord->findnodes("Amortizations/AmortizationData");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "LegAmortizations",0,1);
			$SeqId++;
		}
		# Notionals
		my @subsubrecords = $subrecord->findnodes("Notionals/Notional");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "LegNotionals",0,1);
			$SeqId++;
		}
		# FloatingLeg Spreads
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Spreads/Spread");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "FloatingLegSpreads",0,1);
			$SeqId++;
		}
		# FloatingLeg Caps
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Caps/Cap");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "FloatingLegCaps",0,1);
			$SeqId++;
		}
		# FloatingLeg Floors
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Floors/Floor");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "FloatingLegFloors",0,1);
			$SeqId++;
		}
		# FloatingLeg Gearings
		@subsubrecords = $subrecord->findnodes("FloatingLegData/Gearings/Gearing");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "FloatingLegGearings",0,1);
			$SeqId++;
		}
		# FixedLeg Rates
		@subsubrecords = $subrecord->findnodes("FixedLegData/Rates/Rate");
		$SeqId=0;
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "FixedLegCPIRates",0,1);
			$SeqId++;
		}
		# CPILeg Rates
		@subsubrecords = $subrecord->findnodes("CPILegData/Rates/Rate");
		foreach my $subsubrecord (@subsubrecords) {
			$subsubrecord->setAttribute("LegDataId", $LegDataId);
			$subsubrecord->setAttribute("SeqId", $SeqId);
			printInsert($subsubrecord, "Portfolio", "FixedLegCPIRates",0,1);
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
			printInsert($subsubrecord, "Portfolio", "ScheduleDataRules",0,1);
			# Schedule Dates
			my @subsubrecords = $subrecord->findnodes("ScheduleData/Dates/Date");
			foreach my $subsubrecord (@subsubrecords) {
				$subsubrecord->setNodeName("ScheduleDate");
				$subsubrecord->setAttribute("LegDataId", $LegDataId);
				$subsubrecord->setAttribute("Id", $ScheduleId);
				printInsert($subsubrecord, "Portfolio", "ScheduleDataDates",0,1);
			}
			$ScheduleId++;
		}
	}
	print SQLOUT "\n";
}

###################################################################################################
# helper functions
# print the insert statement for a XML Record
sub printInsert() {
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
			if ($tableCol->value ne "") {
				$colNames.=($tableCol->nodeName =~ /^rule$|^index$/i ? $tableCol->nodeName."Name" : $tableCol->nodeName).",";
				$colValues.=formatSQL($tableCol->value, $numericAsChar,$numericAsDate).",";
			}
		}
	}
	print SQLOUT "INSERT $prefix$tableName (".substr($colNames,0,-1).") VALUES (".substr($colValues,0,-1).");\n" if $colValues ne "";
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