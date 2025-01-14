require 'fox16'
include Fox
class StudentApp < FXMainWindow
    def initialize(app)
        super(app, "Students", width: 1024, height: 768)

        tabs = FXTabBook.new(self, opts: LAYOUT_FILL)
        FXTabItem.new(tabs, "Список студентов")
        student_list = FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)

        FXTabItem.new(tabs, "Пустая вкладка")
        second_tab = FXVerticalFrame.new(tabs, LAYOUT_FILL)
        
        FXTabItem.new(tabs, "Пустая вкладка")
        third_tab = FXVerticalFrame.new(tabs)

        FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
    end
    
    def create
        super
        show(PLACEMENT_SCREEN)
    end

end

app = FXApp.new
StudentApp.new(app)
app.create
app.run
