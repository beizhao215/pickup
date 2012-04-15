def full_title(page_title)
  base_title = "FACSS airport pickup"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end