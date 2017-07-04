class Book

  @@on_shelf = []
  @@on_loan = []

  attr_reader :due_date
  attr_writer :due_date

  # def due_date
  #   return @due_date
  # end
  #
  # def due_date=(x)
  #  @due_date = x
  # end

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = due_date
  end

  def borrow
    if lent_out? == true
      return false
    else
      @due_date = Book.current_due_date
      @@on_loan << self
      @@on_shelf.delete(self)
      return true
    end
  end

  def return_to_library
    if lent_out? == true
      @@on_shelf << self
      @@on_loan.delete(self)
      due_date = nil
      return true
    else
      return false
    end
  end

  def lent_out?
    if @@on_loan.include?(self)
      return true
    else
      return false
    end
  end

  def self.create(title, author, isbn)
    @@on_shelf << Book.new(title, author, isbn)
    return @@on_shelf.last
  end

  def self.current_due_date
    due_date = Time.now + (6*7*24*60*60)
    return due_date
  end

  def self.overdue_books
    overdue = []
    @@on_loan.each do |book|
      if book.due_date < Time.now
        overdue << book
      end
    end
    return overdue
  end

  def self.browse
    return @@on_shelf.sample
  end

  def self.available
    return @@on_shelf #???
  end

  def self.borrowed
    return @@on_loan
  end



end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
puts sister_outsider.lent_out? # true
puts sister_outsider.borrow # false
puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue_books.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out? # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []
