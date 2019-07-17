
## This README.md file contains a detailed explanation of the process followed in the importing, cleaning, manipulation, and exporting of your data as well as your results, obstacles encountered, and lessons learned.


**step 1**. importation of libraries (pandas, numpy, re)

**step 2**. importation of original data (.csv) and creation of a data copy to work on.

**step 3**. list all columns in the dataframe, to know what we are dealing with

**step 4**. print of the dataframe shape (i.e. dimensions) to get number of rows and columns



**step 6** **looking for an index**
- is 'Case Number' an index ? 
To answer this, length of unique values array of the 'Case Number' column was printed. Length is then compared with length of data. It appears there were 32 duplicates in 'Case Number', meaning it can't be considered as an index, as duplicates of 'Case Number' were associated with different people. 

Same process is applied to column 'original order'. Conclusion is there was no column that could be considered as an index. 
When exporting cleaner data, an index must be produced.



**step 7** **columns with NA** **dropping columns with 5000+ NAs**
Are listed all columns with NAs, with number of NAs associated.
Since data length is ~6000 rows, a column with >5000 NAs is not considered significant for further analysis. 
Such column is thus dropped.


**step 8** **modifying column order**
The idea to group 'pseudo' ID columns together. 
'Original order' column is moved right next to 'Case Number' column.


**step 10** **'male' and 'female' instead of 'name'**
In the 'Name' column, some rows display 'male' or 'female' instead of NA. 
These errors were replaced by NAs.


**step 11** **Types of each column**
When displaying columns data types, 'Age' data type is object.
'Age' column will be cleaned in step 13.


**step 12** **Cleaning 'Fatal (Y/N)' column**
After displaying array of unique values of the Fatal column, NAs were dropped as there were only 19 NAs in the dataset.
Values such as 'Unknown', 'n' etc. were replaced either by NA, N or Y.
Goal is to uniformize the Fatal column with 2 unique values : N, Y.


**step 13** **Cleaning 'Age' column**
After displaying array of unique values of the Age column, NAs were replaced by '0'.
The reason NAs were not removed is there were 2585 NAs, which is around half of total dataset.
Replacing NAs by '0' allows us to change 'Age' data type from object to integer later on.

Values containing letters such as '60s', 'teen' etc. were replaced by numbers extracted from the same values.
Example: '60s' is replaced by '60'. 'teen' by ''.
Values such as '' are then removed.
Goal is to change 'Age' data type to 'int64'.


**step 14** **Cleaning 'Country' column**
After displaying array of unique values of the Country column, some values contained characters such as '?'.
Values containing such characters were replaced by letters extracted from the same values.
Example: 'RED SEA?' is replaced by 'RED SEA'.

Lengths of unique values array are compared before and after extraction. They remain the same.

Values such as '' are removed, as well as null values (NaN).

When some country were strangely written, special attention was made on the whole row.

Example : country 'ST' was contained in a row full of NAs. This row was removed from the dataset.
Country 'OCEAN' was contained in a row full of NAs (no name etc.). This row was removed from the dataset.
Same goes for country 'MID' etc.

Otherwise, country 'THE' was mistakenly written instead of Slovenia (which can be found in the 'Area' column). Such error was corrected.
Country 'AMERICAN' was associated with an 'Area' in Tutuila Island. After research, Tutuila Island is located in SAMOA ISLANDS. Country 'AMERICAN' was thus corrected to 'SAMOA ISLAND'.



**step 15** **Cleaning 'Type' column**
After displaying array of unique values of the Type column, values such as 'Boating', 'Boat' etc. were replaced by 'Boat'.
Goal is to uniformize the Type column with 5 unique values : 'Unprovoked', 'Provoked', 'Sea Disaster', 'Boat', 'Invalid'.


**step 16** **Cleaning 'Sex' column**
Sex column was renamed due to a key space in the column name: 'Sex '.

After displaying array of unique values of the Fatal column, special attention was made on the whole row when some country were strangely written. Value 'lli' was replaced  by 'M' (name was male type).
Values such as '.', 'N' were removed.

Goal is to uniformize the Sex column with 2 unique values : M, F.


**step 17** **duplicated**
Looking for duplicates in dataset (none were found).


**step 18** **cleaning 'Species' column**
Species column was renamed due to a key space in the column name: 'Species '.

After displaying array of unique values of the Species column, the row 'No shark involvement' was removed as this study aims to assess shark attacks.

    ** note : another dataset was created ('data1') where NAs in Species column were removed. There were ~2800 NAs in this column. This subset can be used for species attacks analysis.
    
    
Corrections were made for several species :

-Zambesi: all rows containing Zambesi ('attacked by Zambesi', 'Large Zambesi' etc.)were replaced by one single string "Zambesi".
Lowercase and uppercase (Zambesi, zambesi) must be found and replaced by "Zambesi".

Same thing goes for Sandtiger, Tiger, Grey nurse, White shark, Mako shark, Bronze whaler, Bull shark, Raggedtooth, Nurse.
A function is created (Uniformize) to replace lowercase and uppercase. 



**step 19** **cleaning 'Name' column**

After displaying array of unique values of the Name column, some rows display 'male' or 'female' instead of NA. 
These errors were replaced by NAs.
Same process was applied for 'boy' and 'girl' in Name column.


**step 20** **cleaning 'Activity' column**
After displaying array of unique values of the Activity column, corrections were made for several activities :

-Fishing: all rows containing Fishing ('Fishing', 'fishing' etc.)were replaced by one single string "Fishing".
Lowercase and uppercase must be found and replaced.

Note : Fishing was erroneously written in 'Name' column and values are replaced by NaN.

Same thing goes for Swimming, Spearfishing, Sea Disaste.
Same function Uniformize was used to replace lowercase and uppercase. 


**step 21** **cleaning 'Date' column**
All rows containing Reported ('reported', 'Reported' etc.)were replaced by one single string "Reported".
Data with ' ' as a date were replaced by ''.
Data with 'Nodate' as a date were replaced by ''.
Data with ',' as a date were replaced by ''.

All rows containing Beforedd-mm-yyyy ('before', 'Before' etc.)were replaced by a string dd-mm-yyyy.
All rows containing Beforeyyyy ('before', 'Before' etc.)were replaced by a string 01-01-year-1.


All rows containing dd-mm-16 were replaced by a string dd-mm-2016: '30-Dec-16' was replaced by '30-Dec-2016'.
All rows containing dd-mm-17 were replaced by a string dd-mm-2017.



**step 22** **comparing rows and columns in original data and cleaner data**
Numbers of removed lines and removed columns were computed.



**Exportation of the data in a csv format* *






