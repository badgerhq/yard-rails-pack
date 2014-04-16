def init
  super
  sections.last.place(:specs).before(:source)
  sections.last.place(:alfreds).before(:source)
end