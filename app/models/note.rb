class Note < ApplicationRecord
  validates :body, presence: true
  
  validates :title, presence: true, uniqueness: { message: ->(object, data) { I18n.t('activerecord.errors.messages.taken') } }
        
  scope :search_by_title_or_body, ->(query) { where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%") }

  def self.search_by_title(keywords)
    keywords.split.reduce(self) do |acc, word|
      acc.where "title LIKE ? ESCAPE '\\'", "%#{escape_sql_pattern word}%"
    end
  end

  private

  def self.escape_sql_pattern(pattern)
    pattern.gsub(/[%_\\]/, '\\\\\\&')
  end
end
