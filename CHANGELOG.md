## 3.5.8 (Februar 02, 2017)

added statsd, removed datadog

## 3.5.7 (Januar 26, 2017)

sidekiq upgrade, send emails from schedule decorator

## 3.5.6 (Januar 25, 2017)
  - remove tag and push from bump version
  - map index to show action on work report settings
  - add user csv export
  - destroy an active session if the user tries to create another session with invalid login data
  - identify actor by authenticable_id if available
  - Merge tag 'activate-application-destroy-on-dep-remove' into develop
  - Merge branch 'hotfix/activate-application-destroy-on-dep-remove' into production
  - fixed spec
  - add test to make sure work timer connects with application
  - allow upcoming user.applications to be removed
  - Merge tag '3.5.5' into develop
  - Merge branch 'release/3.5.5' into production

## 3.5.5 (Januar 23, 2017)
  - sidekiq cleanup
  - Merge tag '3.5.4' into develop
  - Merge branch 'release/3.5.4' into production

## 3.5.4 (Januar 23, 2017)
  - Merge branch 'production' into develop
  - Merge branch 'feature/eventsperformence' into develop
  - add ShiftCategoryIdentityCache
  - per improvements on events fetch vs find
  - add ActiveRecordQueryTrace to rails env
  - set batch_flush_interval to 3
  - batch size to 4
  - change batch_flush_interval intervall
  - set retry options to 3 for SchedulePublishWorker
  - Merge branch 'production' into develop
  - add sidekiq with failover execution
  - Merge tag 'sidekiq-bulk' into develop
  - Merge branch 'hotfix/sidekiq-bulk' into production
  - bulk retry only once/1
  - spec fixes
  - proper fakeredis setup
  - removed fake redis
  - spec fixes
  - Merge branch 'develop' into hotfix/sidekiq-bulk
  - Merge branch 'production' into hotfix/sidekiq-bulk
  - Merge branch 'production' into develop
  - authorize user adding to department
  - specs
  - simplify remove user from shifts after department change
  - remove logs on emails
  - spec fixes, add fake redid for tests
  - Merge branch 'feature/timetracking-user-rights' into develop
  - add new route to explizit add/remove users from department
  - sendinblue
  - include running timer in from, until scope
  - add navigate_work_timers to abilities
  - replace WorkingHours.update_redis with Workers::BulkWorkingHoursCacheWorker
  - replace Schedule.update_shifts_cache with BulkScheduleShiftsCacheWorker
  - add sidekiq/grouping/web route
  - added sidekiq-grouping gem
  - manager rights
  - staff rights
  - Merge branch 'hotfix/work-report-exportables' into production
  - Merge tag 'work-report-exportables' into develop
  - do not include running timer in export
  - docs
  - Merge tag 'record-not-uniq' into develop
  - Merge branch 'hotfix/record-not-uniq' into production
  - rescue from ActiveRecord::RecordNotUnique
  - Merge tag '3.5.3' into develop
  - Merge branch 'release/3.5.3' into production

## 3.5.3 (Januar 17, 2017)

add planned duration calculations to work reports and allow csv/xls export.

Additional/old commits not yet merged to version:

  - translations
  - Mae super we do not attempt validations on destroyed objects in application.rb
  - removed unused spec
  - spec fixes
  - add planned work_report calculation bases on work_timer.applications
  - Merge branch 'production' into develop
  - add cs/xls exporter work-reports
  - remove health_monitor:check from schedulers
  - pass application_hash instead of application.id to cache handler
  - add index on user_id, :shift_id
  - remove acts_as_paranoid for applications
  - add comments for fallback scopes on application
  - add bugfix for doorkeeper
  - gitignore
  - Revert "Merge tag 'application-uniqueness' into develop"
  - Merge tag 'application-uniqueness' into develop
  - Merge branch 'hotfix/application-uniqueness' into production
  - improve migration
  - add oauth doorkeeper routes to api subdomain scope/route
  - Merge branch 'hotfix/application-uniqueness' into production
  - remove acts_as_paranoid for applications, add uniq index on user_id and shift_id
  - cleanup cron tasks
  - spec fixes
  - Merge tag 'v3.5.1' into develop
  - Merge branch 'release/v3.5.1' into production
  - add bump-version.sh script

## 3.5.2 (Januar 11, 2017)

* add account.upgrade_until and accont.upgrade_from_plan_id to identify accounts which should upgrade the plan
