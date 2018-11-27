# pipeline-monit


## Step 1. Create a pipeline process

```
# arg1= pid, arg2: jobs, arg3: endpoint
$ sh bin/scheduler-init.sh 2018-11-20 'A>B>C' http://localhost:10001
```