class IsRootValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? || value.root?

    record.errors[attribute] << (options[:message] || I18n.t('errors.messages.is_root'))
  end
end
