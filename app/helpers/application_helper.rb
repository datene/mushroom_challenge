module ApplicationHelper
  def select_option_formatter(options)
    options.unshift(" ").collect.with_index { |name, index| [name, name]}
  end

  def active_option(options, active_param_query)
    selection = options.select {|option| option == active_param_query }
    selection ? selection[0] : " "
  end

  def options_for_select_formatter(options, field)
    options_for_select(select_option_formatter(options), active_option(options, @active_param_queries[field.to_sym]))
  end
end
