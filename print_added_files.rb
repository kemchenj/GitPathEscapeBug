require 'danger'

repo = Danger::GitRepo.new
repo.diff_for_folder('.', from: '313592b64b25d48b599123953e8d5572d01e868e')
added_files = repo.diff.select { _1.type == "new" }.map(&:path)

added_files.each do |file|
  exists = File.exist?(file)
  puts "#{exists} #{file}" unless exists
end
