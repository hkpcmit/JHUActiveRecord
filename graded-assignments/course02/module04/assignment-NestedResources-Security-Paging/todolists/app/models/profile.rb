class Profile < ActiveRecord::Base
  belongs_to :user

  validate :check_sue
  validate :has_name
  validates :gender, inclusion: {in: %w(female male)}

  def check_sue
    if gender == "male" and first_name.to_s.downcase == "sue"
      errors.add(:first_name, "Sue is an invalid name for male.")
    end
  end

  def has_name
    if first_name.nil? and last_name.nil?
      errors.add(:first_name, "Both first and last names cannot be null.")
    end
  end

  def self.get_all_profiles(min_year, max_year)
    where(birth_year: min_year..max_year).order(:birth_year)
  end
end
