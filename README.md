# pipeline-monit


PIPELINE:  pname=demography-pred-raw,   pid=2018-11-20 ( A(run|done)--> B(run|done) --> C(run|done))


## Step 1. Create a pipeline process

```
# params: {arg1: pname, arg2: pid, arg3: jobs, arg4: endpoint}
$ curl -sSL  https://raw.githubusercontent.com/phuongdo/pipeline-monit/master/scripts/scheduler-init.sh | bash -s  demography-pred-raw 2018-11-20 'A>B>C' http://localhost:10001
```

## Step2. Run Job

Modify the `scripts/service-template.sh`

```
# params: {arg1: pname, arg2: process-id, arg3: endpoint}
$ sh bin/service-template.sh demography-pred-raw A http://localhost:10001
```

## Stop pipeline

```
END_POINT=http://localhost:10001
PNAME=demography-pred-raw
curl -X POST $END_POINT/pipeline/$PNAME/stop
```
