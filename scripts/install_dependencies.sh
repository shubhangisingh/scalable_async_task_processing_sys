#!/bin/bash
set -e

cd /home/ubuntu/scalable_async_task_processing_sys

bundle install

RAILS_ENV=production bundle exec rails db:migrate