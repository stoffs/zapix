require_relative 'base'

class Scenarios < Base
  def create(options)
    client.webcheck_create(options) unless exists?(options)
  end

  def get_id(options)
    client.webcheck_get({
      'filter' => {'name' => options['name'],
      'hostid' => options['hostid']}})
  end

  def delete(options)
    client.webcheck_delete(options)
  end

  def exists?(options)
    result = client.webcheck_get({
      'countOutput' => true,
      'filter' => {'name' => options['name'],
      'hostid' => options['hostid']}})

    result.to_i >= 1 ? true : false
  end
end
