#!/bin/bash

cd /home/ubuntu/scalable_async_task_processing_sys

nohup bundle exec rails s -e production -b 0.0.0.0 -p 3000 > log/production.log 2>&1 &