require 'guardian'

after_initialize do
  Guardian.class_eval do
    alias_method :old_can_edit_topic?, :can_edit_topic?
    def can_edit_topic?(topic)
      old_can_edit_topic?(topic) && (is_staff? || is_my_own?(topic))
    end
  end
end
