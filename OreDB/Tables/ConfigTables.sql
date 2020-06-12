use ORE;

CREATE TABLE OreConfigurations (
	ConfigurationId varchar(30) NOT NULL,
	ConfigurationType varchar(30) NOT NULL,
	Description varchar(255) NOT NULL,
	ConfigurationData varchar(MAX) NOT NULL
CONSTRAINT PK_OreConfigurations PRIMARY KEY CLUSTERED (
	ConfigurationId ASC
));

ALTER TABLE OreConfigurations ADD CONSTRAINT FK_OreConfigurations_ConfigurationType FOREIGN KEY(ConfigurationType)
REFERENCES TypesConfigurationTypes (value);