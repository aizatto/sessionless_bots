module SessionlessBots
  def self.included(base)
    base.class_eval do
      session :off, :if => proc { |request| SessionlessBots.robot?(request.user_agent) }
    end
  end

  def self.robot?(user_agent)
    user_agent =~ /(Baidu|bot|Google|SiteUptime|Slurp|WordPress|ZIBB|ZyBorg)/i
  end
end

ActionController::Base.send(:include, SessionlessBots)
