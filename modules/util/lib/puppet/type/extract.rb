Puppet::Type.newtype(:extract) do

  desc "Downloads an archive from a local or remote url and extracts the content to the specified location.
        The rootlevel of the archive will be skipped when extracting."

  ensurable do
    defaultto(:present)
    newvalue(:present) do
      provider.create
    end
    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:path, :namevar => true) do
    validate do |value|
      fail "Path must be an absolute path" unless Pathname.new(value).absolute?
    end
  end

  newparam(:archive) do
    newvalues(/https?:\/\//, /file:\/\//)
  end

  newparam(:creates) do
    validate do |value|
      fail "Creates is required and must be an absolute path" unless Pathname.new(value).absolute?
    end
  end

  newparam(:create_path) do
    defaultto :true
    newvalues(:true, :false)
  end

  newparam(:group) do
  end

  newparam(:owner) do
  end

  newparam(:proxy_url) do
    validate do |value|
      unless URI.parse(value).is_a?(URI::HTTP)
        fail "proxy_url is not a valid url"
      end
    end
  end

end
