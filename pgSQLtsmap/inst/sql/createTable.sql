CREATE TABLE timeseries_main (ts_key varchar primary key, 
ts_data hstore, 
ts_format varchar,
md_generatedon varchar,
md_generatedby varchar,
md_unit varchar, 
md_legacy_key varchar,
md_frequency varchar);



CREATE TABLE localized_meta_data (ts_key varchar,
ts_language varchar,
ts_labels hstore,
primary key (ts_key,ts_language),
foreign key (ts_key) references timeseries_main (ts_key));