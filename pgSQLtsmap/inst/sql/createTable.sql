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

CREATE TABLE ts_vintages (ts_key,vintage_title,
vintage_data)
ts_key varchar,
vintage_title varchar,


CREATE TABLE timeseries_sets (ts_set_key varchar,
ts_set_label varchar,
ts_set_description varchar,
primarykey (ts_set_key)

CREATE TABLE ts_key_ts_set_key (ts_key varchar,
ts_set_key)
primary key (ts_key varchar,ts_set_key)
foreign key (ts_key) references timseries_main (ts_key)
foreign key (ts_set_key) references timeseries_sets (ts_set_key)

