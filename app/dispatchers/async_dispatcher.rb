class AsyncDispatcher < BaseDispatcher
  def dispatch(event_name, timestamp, data)
    if event_name == 'message.updated'
      EventDispatcherJob.perform_now(event_name, timestamp, data)
    else
      EventDispatcherJob.perform_later(event_name, timestamp, data)
    end
  end

  def publish_event(event_name, timestamp, data)
    event_object = Events::Base.new(event_name, timestamp, data)
    publish(event_object.method_name, event_object)
  end

  def listeners
    [
      EventListener.instance,
      WebhookListener.instance,
      InstallationWebhookListener.instance, HookListener.instance
    ]
  end
end
