Drop table if exists entries;
Drop table if exists transfers;
Drop table if exists accounts; --dropping entries and transfers table because there is foreign key contraint in entries and transfers table that reference accounts records.