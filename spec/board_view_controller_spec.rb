describe BoardViewController do
  before do
    @board_view_controller = BoardViewController.new
    @square_views, @board_view = @board_view_controller.init_views
  end

  it "default squares" do
    for i in 0..8
      @square_views[i].backgroundColor.should.be.nil
    end
  end
end
