CREATE TABLE timeseries_main (ts_key varchar primary key, 
ts_data hstore, 
md_frequency varchar,
md_generated_by varchar,
md_generated_on varchar,
md_legacy_key varchar,
md_source varchar,
md_notes varchar,
md_restrictions
);

CREATE TABLE localized_meta_data (ts_key varchar,
ts_language varchar,
ts_labels hstore,
primary key (ts_key,ts_language),
foreign key (ts_key) references timeseries_main (ts_key));

CREATE TABLE ts_vintages (ts_key varchar,
vintage_key varchar,
vintage_data hstore,
primary key (ts_key,vintage_key),
foreign key (ts_key) references timeseries_main (ts_key));


CREATE TABLE timeseries_sets (ts_set_key varchar,
ts_set_label varchar,
ts_set_description varchar,
primary key (ts_set_key));

dbGetQuery(con,"CREATE TABLE ts_key_ts_set_key (ts_key varchar, ts_set_key varchar,
primary key (ts_key, ts_set_key),
foreign key (ts_key) references timeseries_main (ts_key),
foreign key (ts_set_key) references timeseries_sets (ts_set_key));
")
