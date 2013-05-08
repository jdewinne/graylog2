Puppet::Type.type(:extract).provide(:tar) do

  confine :feature => :posix

  commands :tar    => '/bin/tar',
           :mktemp => '/bin/mktemp',
           :curl   => '/usr/bin/curl'

  def exists?
    File.exists?(resource[:creates])
  end

  def create
    begin
      download_dir = mktemp('-d').strip
      filename     = File.basename(resource[:archive])
      tmp_file     = "#{download_dir}/#{filename}"

      download_file(resource[:archive], tmp_file)

      extract_file(tmp_file, resource[:path], resource[:create_path])

      FileUtils.chown_R(resource[:owner], resource[:group], resource[:path]) unless resource[:owner].nil?
    ensure
      FileUtils.remove_dir(download_dir, true) unless download_dir.nil?
    end
  end

  def destroy
    self.notice "Destroy"
    if resource[:create_path] == :true
      path = resource[:path]
    else
      path = "#{resource[:path]}/*"
    end
    FileUtils.rmtree(path)
  end

  def download_file(source, target)
    unless resource[:proxy_url].nil?
      ENV['http_proxy'] = resource[:proxy_url]
    end
    self.notice "Downloading archive '#{source}'"
    curl('--output', target, source)
  end

  def extract_file(source, target, create_target)
    FileUtils.mkpath(target) if create_target == :true
    self.notice "Extracting archive to '#{target}'"
    tar('-xf', source, '-C', target, '--strip-components=1')
  end

end
