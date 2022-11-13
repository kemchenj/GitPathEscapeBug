require 'danger'

repo = Danger::GitRepo.new
repo.diff_for_folder('.', from: '0d146c9ba4d28be2fb61e1d3838d33a21f939d2f')
added_files = repo.diff.select { _1.type == "new" }.map(&:path)

added_files.each do |file|
  exists = File.exist?(file)
  puts "added file '#{file}' exist? '#{exists}'"
end
