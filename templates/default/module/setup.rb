def init
  super
  sections.place(:validations).before(:children)
  sections.place(:assocations).before(:children)
  sections.place(:rails_scopes).before(:children)
  sections.place(:callbacks).before(:children)
  sections.place(:nested_attributes).before(:children)
  sections.place(:devise).before(:children)
  sections.place(:controller_filters).before(:children)
  sections.place(:has_scopes).before(:children)
  sections.place(:observers).before(:children)
end
