


Exploration of the NOAA Storm Database, and which types of meteorological events are most harmful
========================================================================================

## Synopsis

The target of this analysis is to find out which metereological events cause the most harmful effects for human health and have the greatest economic consequences in terms of property damage. For the research of given objectives was used the U.S. National Oceanic and Atmospheric Administration's storm database from the past 60 years. It turned out that 

We found that the most harmful metereological event was the tornado, which caused over 90,000 direct injuries in the last 60 years. Likewise, most deadly events were caused also by tornadoes, with about 5,600 deaths during the evaluated period of time. Finally, flooding had the greatest economic consequences, with over 150 billion dollars in property damages.

## Data Processing

### Loading data

The data got downloaded from [source](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2) and stored as `CSV` file at the disk.


```r
data.url <- "http://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
file.csv <- "stormData.csv"

storm <- NULL
if (!file.exists(data.name)) {
    file.tmp <- tempfile()
    download.file(data.url, destfile = file.tmp, method = "curl")
    storm <- read.csv(bzfile(file.tmp), na.strings = "")
    write.csv(storm, file = file.csv)
    file.remove(file.tmp)
}
```

```
## Error: object 'data.name' not found
```

```r

if (is.null(storm)) storm <- read.csv(file.csv, na.strings = "")
```


The data.frame `storm` contains the 902,297 observation of 37 variables.

```r
dim(storm)
```

```
## [1] 902297     38
```

