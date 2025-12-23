-- Creation of DB Schemas for our DWH
-- These are the 3 layers of data storage

create schema bronze; -- Responsible for storing every data without preprocessinig or cleaning
create schema silver; -- Responsible for doing data cleaning, making transformation to suit different requirements
create schema gold; -- Last layer responsible for structurally presenting of data to business stakeholders and non-tech people to perform insight driven business action
