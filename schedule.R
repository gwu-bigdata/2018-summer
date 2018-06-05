library(tibble, quietly = T,warn.conflicts = F)
library(dplyr, quietly = T,warn.conflicts = F)
library(stringr, quietly = T, warn.conflicts = F)


noclass <- as.Date(c("2018-07-04"))

l01 <- tibble(
  title_topic = "Welcome to Big Data: Course Overview, What is Big Data, Distributed Computing, Cloud Computing, High Performance Computing, the Infrastructure of the Cloud",
  lab = "Create your cloud & GitHub accounts. Setup your environment. Install software. Create and configure SSH keys.",
  reading = "",
  assignment = "",
  quiz = ""
)

l02 <- tibble(
  title_topic = "AWS/Azure overview. Introduction to Hadoop & MapReduce: Hadoop, Distributed filesystems, MapReduce programming model",
  lab = "Start and connect to your first virtual machine on the cloud. Start and connect to a Hadoop cluster, run built-in Hadoop examples, examine the different user interfaces",
  reading = "Required: (Bengfort, Kim) Chapter 2",
  assignment = "",
  quiz = ""
)

l03 <- tibble(
  title_topic = "Hadoop Streaming",
  lab = "Run the \"Hello World\" of Hadoop, the word count using Hadoop Streaming",
  reading = "Required: (Bengfort, Kim) Ch. 3",
  assignment = "A01 released - due Sun 6/17",
  quiz = "Q01"
)

l04 <- tibble(
  title_topic = "Higher Level APIs: Pig and Hive",
  lab = "Store a dataset in a Hive table, Run and example Pig job",
  reading = "Required: (Bengfort, Kim) Ch. 6,8",
  assignment = "L02 released - due Sun 6/24",
  quiz = "Q02"
)

l05 <- tibble(
  title_topic = "Introduction to Spark: What is Spark, Resilient Distributed Datasets, PySpark",
  lab = "Start a PySpark session, Create RDDs, Operate on RDDs",
  reading = "Required: (Chambers, Zaharia) Ch. 1-3, 12, 32; Recommended: (Sankar) p.122-126",
  assignment = "",
  quiz = "Q03"
)

l06 <- tibble(
  title_topic = "SparkSQL: SQL Review, Intro to SparkSQL",
  lab = "Perform operations on Spark dataframes using SparkSQL",
  reading = "Required: (Chambers, Zaharia) Ch. 10; Recommended: (Sankar) Ch. 8",
  assignment = "A03 released - due Sunday 7/15",
  quiz = ""
)

l08 <- tibble(
  title_topic = "Machine Learning with Big Data: SparkML, Issues with ML algorithms on large datasets",
  lab = "Build a predictive model with SparkML",
  reading = "Required: (Chambers, Zaharia) Ch. 24, 25; Recommended: (Sankar) Ch. 11",
  assignment = "A04 released - due Sun 7/29",
  quiz = ""
)

l07 <- tibble(
  title_topic = "Working with Streaming Datasets: Spark Streaming",
  lab = "Run real-time analytics on a data stream using Spark Streaming",
  reading = "Required: (Chambers, Zaharia) Ch. 20, 21",
  assignment = "",
  quiz = "Q04"
)


l09 <- tibble(
  title_topic = "Working with Graph Datasets: GraphX API for Spark",
  lab = "Analyze a large graph using GraphX",
  reading = "Required: (Chambers, Zaharia) Chapter 30; Recommended: (Sankar) Ch. 12",
  assignment = "",
  quiz = "Q05"
)


l10 <- tibble(
  title_topic = "TBD",
  lab = "TBD",
  reading = "TBD",
  assignment = "",
  quiz = ""
)
# l11 <- tibble(
#   title = "Other tools of interest",
#   topics = "Apache Drill, other topics TBD",
#   lab = "",
#   reading = "",
#   assignment = "",
#   quiz = ""
# )

sessions <- sort(ls(pattern = "l[0-9]{2}"))
sched_rows <- length(sessions) + length(noclass)

sched <- 
  tibble(date = seq.Date(from = as.Date("2018-05-23"), 
                         length.out = sched_rows,
                         by = "week")) %>%
  filter(!date %in% noclass) %>%
  mutate(session = as.integer(1:nrow(.))) %>%
  select(session, date) %>% 
  bind_cols(.,
            lapply(sessions, get) %>%  bind_rows())

