#!/bin/bash

# 1) Ensure all chart deps are fetched:
make deps

# 2) Deploy nginx + FluentBit + ADOT Collector:
make observability

# 3) Check:
kubectl get ds,pods -n default
aws logs describe-log-groups     # your new log groups
aws xray get-servicegraph --start-time $(date +%s -d"-5m")
