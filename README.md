# pipeline-monit


PIPELINE  pid=2018-11-20 ( A(run|done)--> B(run|done) --> C(run|done))


## Step 1. Create a pipeline process

```


# arg1= pid, arg2: jobs, arg3: endpoint

$ curl -sSL  https://raw.githubusercontent.com/phuongdo/pipeline-monit/master/scripts/scheduler-init.sh | bash -s 'A>B>C' http://localhost:10001
```


## Step2. Run Job

Modify the `scripts/service-template.sh`

```
$ sh bin/service-template.sh A http://localhost:10001

```

## Stop pipeline

```
curl -x POST $END_POINT/pipeline/stop
```
