RSpec::Matchers.define :permit do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end

  failure_message_for_should do |policy|
    "#{policy.class} should not permit #{action} on #{policy.record} for #{policy.user.inspect}."
  end

  failure_message_for_should_not do |policy|
    "#{policy.class} does not forbit #{action} on #{policy.record} for #{policy.user.inspect}."
  end
end
