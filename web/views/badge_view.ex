defmodule OpenreevooWebsite.BadgeView do
  use OpenreevooWebsite.Web, :view

  def rating_colour(rating, number_of_reviews) do
    cond do
      number_of_reviews == 0 -> "#9f9f9f"
      rating >= 0.9 -> "#4c1"
      rating >= 0.8 -> "#97CA00"
      rating >= 0.7 -> "#a4a61d"
      rating >= 0.6 -> "#dfb317"
      rating >= 0.5 -> "#fe7d37"
      true          -> "#e05d44"
    end
  end

  def status(rating, number_of_reviews) do
    rating_display(rating) <> " | " <> review_display(number_of_reviews)
  end

  def rating_display(rating) do
    percent = rating * 100 |> Float.to_string [decimals: 0]
    "#{percent}%"
  end

  def review_display(number_of_reviews) do
    reviews_formatted = Regex.replace(
      ~r/(\d)(?=(\d\d\d)+(?!\d))/, 
      to_string(number_of_reviews), 
      "\\1,"
    )

    "#{reviews_formatted} reviews"
  end

end
