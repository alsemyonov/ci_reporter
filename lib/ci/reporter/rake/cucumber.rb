# Copyright (c) 2006-2010 Nick Sieger <nicksieger@gmail.com>
# See the file LICENSE.txt included with the distribution for
# software license details.

namespace :ci do
  namespace :setup do
    @reports_dir = ENV["CI_REPORTS"] || "features/reports"

    task :cucumber_report_cleanup do
      rm_rf @reports_dir
    end

    task :cucumber => :cucumber_report_cleanup do
      spec_opts = ['--format', 'junit', '--out', @reports_dir].join(" ")
      ENV["CUCUMBER_OPTS"] = "#{ENV['CUCUMBER_OPTS']} #{spec_opts}"
    end
  end
end
