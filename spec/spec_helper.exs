ESpec.configure fn(config) ->
  config.before fn ->
    {
      :shared,
      hex_color_regex: ~r/\A#([[:xdigit:]]{3,3}|[[:xdigit:]]{6,6})\Z/,
      hex_regex: ~r/\A[[:xdigit:]]+\Z/
    }
  end

  config.finally fn(_shared) ->
    :ok
  end
end
