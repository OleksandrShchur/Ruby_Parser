require 'rubygems'
require 'zip'
require 'logger'

class Zipper
    def initialize(input_dir, output_file)
        @input_dir = input_dir
        @output_file = output_file

        @logger = Logger.new(STDOUT)
    end

    def write
        entries = Dir.entries(@input_dir) - %w[. ..]
    
        begin
          ::Zip::File.open(@output_file, create: true) do |zipfile|
            write_entries entries, '', zipfile
          end

          @logger.info('Zip file created without error.')
        rescue StandardError => e
          @logger.error(e.message)
          @logger.error('Cannot write in zip file')
        end
    end

    def write_entries(entries, path, zipfile)
        entries.each do |e|
          zipfile_path = path == '' ? e : File.join(path, e)
          disk_file_path = File.join(@input_dir, zipfile_path)
    
          if File.directory? disk_file_path
            recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
          else
            put_into_archive(disk_file_path, zipfile, zipfile_path)
          end
        end
    end

    def recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
        zipfile.mkdir zipfile_path
        subdir = Dir.entries(disk_file_path) - %w[. ..]
        write_entries subdir, zipfile_path, zipfile
    end
    
    def put_into_archive(disk_file_path, zipfile, zipfile_path)
        zipfile.add(zipfile_path, disk_file_path)
    end

end
