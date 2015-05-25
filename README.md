# stringdbr
stringdbr: STRING-db R API

```r
z <- sdb("resolve") %>%
  sdb_constrain(format = "tsv", identifier = "ADD", species = 9606) %>%
  sdb_get_results()
```
