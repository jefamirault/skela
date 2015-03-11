module GamesHelper
  def game_board(options = {})
    squares = ''

    num_rows = options[:rows] || 3
    num_columns = options[:columns] || 3

    num_rows.times do |row|
      row_klass = if row == 0
        'top_row'
      elsif row == num_rows - 1
        'bottom_row'
      else
        'middle_row'
      end
      num_columns.times do |col|
        col_klass = if col == 0
          'top_col'
        elsif col == num_cols - 1
          'bottom_col'
        else
          'middle_col'
        end

        klass = row_klass + col_klass
        squares << content_tag(:div, class: klass)
      end
    end

    board = content_tag :div do

    end
  end
end
