module Helpers
  def with_env(opts = {})
    old = {}
    opts.each do |k, v|
      k = k.to_s
      v = v.to_s unless v.nil?
      old[k] = ENV[k]
      ENV[k] = v
    end
    yield
  ensure
    old.each do |k, v|
      ENV[k] = v
    end
  end

  def with_rails_env(env)
    initial_env = Rails.env
    Rails.env = env
    yield
  ensure
    Rails.env = initial_env
  end
end
