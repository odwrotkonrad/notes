##[>] 🤖🤖
require "date"
require "fileutils"

ROOT = File.expand_path("..", __dir__)
USER = File.join(ROOT, "current/user")
ARCHIVE_USER = File.join(ROOT, "archive/user")
TEMPLATE = File.join(ROOT, "assets/day.md")
DATE_RE = /\A\d{4}-\d{2}-\d{2}\.md\z/
KEEP = 3

FileUtils.mkdir_p([RAW, ARCHIVE_RAW])

today = Date.today.to_s
today_path = File.join(RAW, "#{today}.md")

unless File.exist?(today_path)
  File.write(today_path, "# #{today}\n\n#{File.read(TEMPLATE)}")
end
puts today_path

dates = Dir.children(RAW).select { |f| f =~ DATE_RE }.sort
dates[0...-KEEP].each do |f|
  FileUtils.mv(File.join(RAW, f), File.join(ARCHIVE_RAW, f))
end
##[<] 🤖🤖
