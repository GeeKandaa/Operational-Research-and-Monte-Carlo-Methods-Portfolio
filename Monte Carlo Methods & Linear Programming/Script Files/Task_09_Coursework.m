%% Task 9 
%% Importing Data from csv file.
% Matlab returns a warning that variable names were changed during the
% import of the cvs file, this is likely because the source data sheet
% contains special characters (spaces) in the column headers.

gReviewRatings = readtable('google_review_ratings.csv');
% Importing specific columns from table.
% Variables used to store names for later debugging
column1 = 'Category11';
column2 = 'Category22';
pubAverage = gReviewRatings{:,{column1}} ;
cafeAverage = gReviewRatings{:,{column2}} ;

%% Cleaning Data
% As there may be data in the .csv file that causes errors or is not within 
% the range expected (1 to 5), we perform a little preliminary analysis and 
% remove erroneous data. For the sake of the end user (and debugging), a 
% warning is given when data is removed.

pubAverage = str2double(pubAverage);
count = 0;
for i = 1:length(pubAverage)
    if isnan(pubAverage(i-count))
        pubAverage(i-count) = [];
        count=count+1;
    end
end
if count > 0
    fprintf('Source .csv file contains unreadable data.\nEntry cleanup performed on %s\n%i element removed.\n\n', column1, count) 
end
count = 0;
for i = 1:length(pubAverage)
    if pubAverage(i-count)<1 || pubAverage(i-count)>5
        pubAverage(i-count) = [];
        count=count+1;
    end
end
if count > 0
    fprintf('Source .csv file contains erroneous data.\nEntry cleanup performed on %s\n%i element removed.\n\n', column1, count) 
end
count = 0;
for i = 1:length(cafeAverage)
    if isnan(cafeAverage(i-count))
        cafeAverage(i-count) = [];
        count=count+1;
    end
end
if count > 0
    fprintf('Source .csv file contains unreadable data.\nEntry cleanup performed on %s\n%i element removed.\n\n', column2, count) 
end
count = 0;
for i = 1:length(cafeAverage)
    if cafeAverage(i-count)<1 || cafeAverage(i-count)>5
        cafeAverage(i-count) = [];
        count=count+1;
    end
end
if count > 0
    fprintf('Source .csv file contains erroneous data.\nEntry cleanup performed on %s\n%i element removed.\n\n', column2, count) 
end
%%  Bootstrap analysis of the IQ median data.
% The bootstrap method is a resampling technique that allows us to get
% multiple theoretical samples when we only have 1 to start with.

pubData = pubAverage;
cafeData = cafeAverage;
pubnData = length(pubData);
cafenData = length(cafeData);
pubmt = median(pubData);
pubmm = mean(pubData); 
cafemt = median(cafeData) ;
cafemm = mean(cafeData) ;

fprintf('Pub Data:                                Cafe Data: \n');
fprintf('Number of Pub data items = %d          Number of Cafe data items = %d\n' , pubnData, cafenData) ;
fprintf('Median of Pub data = %f            Median of Cafe data = %f\n' , pubmt, cafemt ) ;
fprintf('Mean of Pub data = %f              Mean of Cafe data = %f\n\n' , pubmm, cafemm )  ;

% Using the bootstrap method we can generate 1000 samples, each the same 
% size of the original sample
nboot = 1000 ;
fprintf('Number of bootstrap samples %d \n' , nboot) ;
store = zeros(1 , nboot) ;
bdata = zeros(1,pubnData) ;

%%Pub Bootsrap
for j = 1:nboot
    %  create bootstrap sample
    r = randi([1 pubnData],1,pubnData);
    for i = 1:pubnData
       bdata(i) = pubData( r(i)  ) ;
    end
    % For each of the bootstrap samples, we calculate the medians
    store(j) =  median(bdata);   
end
%Then we sort these medians
pubSort = sort(store);
pubStd = std(store);

%%Cafe Bootsrap
bdata = zeros(1,cafenData) ;

for j = 1:nboot
    %  create bootstrap sample
    r = randi([1 cafenData],1,cafenData);
    for i = 1:cafenData
       bdata(i) = cafeData( r(i)  ) ;
    end
    store(j) =  median(bdata);   
end
cafeSort = sort(store);
cafeStd = std(store);

fprintf('Pub Median SD = %f                 Cafe Median SD = %f \n\n' ,  pubStd, cafeStd )

%% Confidence Intervals
% Having calculated the median and sorted the bootstrap samples, we can 
% then find the upper and lower percentiles, which then gives us our 
% Confidence Intervals.
alpha = 5;
upperPer = 100-(alpha/2);
lowerPer = alpha/2;

pubUpper = prctile(pubSort, upperPer);
pubLower = prctile(pubSort, lowerPer);
cafeUpper = prctile(cafeSort, upperPer);
cafeLower = prctile(cafeSort, lowerPer);

fprintf('Comparison of Medians using bootstrap method with 95%% Confidence Intervals: \n') ;
fprintf('Pub Median Upper Bound = %f        Cafe Median Upper Bound = %f \n' ,  pubUpper, cafeUpper );
fprintf('Pub Median Lower Bound = %f        Cafe Median Lower Bound = %f \n\n' ,  pubLower, cafeLower );


% For this example we are looking at the median rating for pubs and cafes in 
% the local area. We have a sample median of 2 and 1.03 respectively. 
% We also find the pub median CI = [1.90, 1.93], and the 
% cafe median Ci = [0.99, 1]

% It would therefore be our suggestion that you were to build more pubs
% than cafes, as we can be fairly confident that the average rating for
% pubs is significantly higher than that of the average rating for cafes.
