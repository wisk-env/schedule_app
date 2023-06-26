class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }
  validate :end_date_cannot_be_in_the_past, :end_date_cannot_be_greater_than_start_date

  private

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "に過去の日付は使えません")
    end
  end

  def end_date_cannot_be_greater_than_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "は開始日以降の日付で選択してください。")
    end
  end
end
